function [tau] = Newton_Euler_symbolic(rbt,q,qd,qdd,W,h,g)

    %%% function che dati in input il modello del manipolatore, la sua
    %%% configurazione in termini di variabili di giunto , la derivata
    %%% temporale prima e seconda delle variabili di giunto, peso e altezza
    %%% del payload e costante gravitazionale da in output le componenti 
    %%% lungo l'asse dei giunti dei momenti/forze globali scambiate alle 
    %%% interfacce dei giunti.  (Accetta sia variabili di giunto numeriche 
    %%% che simboliche e restituisce output coerente)
    
    % INPUT:
    % rbt:                struct     [1x1] = modello manipolatore 
    % q:                  double/sym [nx1] = variabili di giunto [rad] / [m]
    % qd:                 double/sym [nx1] = derivata temporale prima variabili di giunto [rad/s] / [m/s]
    % qdd:                double/sym [nx1] = derivata temporale seconda variabili di giunto [rad/s^2] / [m/s^2]
    % W:                  scalar     [1x1] = payload weight [N]
    % h:                  scalar     [1x1] = payload height [m]
    % g:                  scalar     [1x1] = gravity constant [m/s^2]
    
    % OUTPUT:
    % tau:                double/sym [nx1] = componente lungo asse di giunto dei momenti/forze scambiati all'interfaccia tra i giunti
    
    % IMPORTANTE: 
    % 1) il payload è considerato un oggetto assialsimmetrico con
    %     distribuzione di massa uniforme
    % 2) tau non considera forze di attrito al momento.
    % 3) tau non considera la presenza del motor side al momento
    % SOLUZIONI:
    % 2) Per superare la seconda assunzione si può imporre una maggiorazione 
    % scalare su tau (forza di attrito è in direzione del movimento) pari a:
    % tau(i) = tau(i) + vq_dot(i) + csign(q_dot(i)). 
    % 3) Per superare la terza assunzione si può imporre una maggiorazione
    % scalare su tau (motori hanno inerzia non trascurabile solo in direzione del moto)
    % tau(i) = tau(i) + eta(i)^2*Im(i)*q_ddot(i) + eta(i)^2*bm(i)*q_dot(i)
    
    %% inizializzazione

    % info joints
    n_joints = rbt.joints_number;
    J = [rbt.joints; rbt.end_effector];

    % inizializzazione container simbolici
    F = sym(zeros(3,n_joints)); % forza risultante sui c.d.m giunti [N]
    N = sym(zeros(3,n_joints)); % [nx1] vettore momento risultante intorno ai c.d.m giunti [N*m]
    tau = sym(zeros(n_joints,1)); % [nx1] componente lungo asse di giunto di forza/momento all'interfaccia giunto [N] / [N*m]
    w = sym(zeros(3,n_joints)); % [3xn] vettore velocità angolare dei giunti, ogni giunto i wrt {i} centrata in origine {0} [rad/s]
    w_dot = sym(zeros(3,n_joints)); % [3xn] vettore accelerazione angolare dei giunti, ogni giunto i wrt {i} centrata in origine {0} [rad/s^2]
    v_dot = sym(zeros(3,n_joints)); % [3xn] vettore accelerazione lineare dei giunti, ogni giunto i wrt {i} centrata in origine {0} [m/s^2]
    f = sym(zeros(3,n_joints)); % [3xn] vettore forza globale scambiata tra i giunti 
    n = sym(zeros(3,n_joints)); % [3xn] vettore momento globale scambiato tra i giunti
    
    %% outward iteration
    
    for i = 0:n_joints-1
        if strcmp(J(i+1).type, 'revolute')
            theta = q(i+1);
            d = sym(J(i+1).MDH.d);
        else
            theta = sym(J(i+1).MDH.theta);
            d = q(i+1);
        end
        alpha = J(i+1).MDH.alpha;
        % trattare alpha come sym
        if abs(alpha + pi/2) < 1e-12
            alpha = -sym(pi)/2;
        elseif abs(alpha - pi/2) < 1e-12
            alpha =  sym(pi)/2;
        else
            alpha = sym(alpha); % altri casi
        end
        T = MDH2tr(theta,d,alpha,sym(J(i+1).MDH.a));
        R = (T(1:3,1:3))'; % matrice di rotazione i --> i+1
        Ix = sym(rbt.links(i+1).inertia.Ixx);
        Iy = sym(rbt.links(i+1).inertia.Iyy);
        Iz = sym(rbt.links(i+1).inertia.Izz);
        I = diag([Ix , Iy , Iz]); % tensore inerzia link i+1
        % estrazione quantità cinematice giunto precedente
        if i==0
            wi = sym(zeros(3,1));
            wi_dot = sym(zeros(3,1));
            vi_dot = sym([0;0;g]); 
        else
            wi = w(:,i);
            wi_dot = w_dot(:,i);
            vi_dot = v_dot(:,i);
        end
        % determinazione grandezze cinematiche
        if strcmp(J(i+1).type, 'revolute')
            w(:,i+1) = R*wi + qd(i+1) * sym([0;0;1]);
            w_dot(:,i+1) = R*wi_dot + cross( R*wi , qd(i+1)*sym([0;0;1]) ) + qdd(i+1)*sym([0;0;1]);
            v_dot(:,i+1) = R * ( cross( wi_dot , sym(J(i+1).MDH.a)*sym([1;0;0]) ) ...
                + cross( wi , cross( wi , sym(J(i+1).MDH.a)*sym([1;0;0]) ) ) + vi_dot);
            vci_dot = cross( w_dot(:,i+1) , sym(J(i+1).MDH.a)/2*sym([1;0;0]) )...
                + cross( w(:,i+1) , cross( w(:,i+1) , sym(J(i+1).MDH.a)/2*sym([1;0;0]) ) ) + v_dot(:,i+1);
            F(:,i+1) = sym(rbt.links(i+1).mass) * vci_dot;
            N(:,i+1) = I * w_dot(:,i+1) + cross( w(:,i+1) , I * w(:,i+1) );
        else
            w(:,i+1) = R*wi;
            w_dot(:,i+1) = R*wi_dot;
            v_dot(:,i+1) = R * ( cross( wi_dot , sym(J(i+1).MDH.a)*sym([1;0;0]) ) ...
                + cross( wi , cross( wi , sym(J(i+1).MDH.a)*sym([1;0;0]) ) ) + vi_dot)...
                + qdd(i+1)*sym([0;0;1]) + cross( 2*w(:,i+1) , qd(i+1)*sym([0;0;1]) );
            vci_dot = cross( w_dot(:,i+1) , sym(J(i+1).MDH.a)/2*sym([1;0;0]) )...
                + cross( w(:,i+1) , cross( w(:,i+1) , sym(J(i+1).MDH.a)/2*sym([1;0;0]) ) ) + v_dot(:,i+1);
            F(:,i+1) = sym(rbt.links(i+1).mass) * vci_dot;
            N(:,i+1) = I * w_dot(:,i+1) + cross( w(:,i+1) , I * w(:,i+1) );
        end
    end
    
    %% Inward iteration
    
    for i = n_joints:-1:1
        if strcmp(J(i+1).type, 'revolute')
            theta = q(i+1);
            d = sym(J(i+1).MDH.d);
        elseif strcmp(J(i+1).type, 'prismatic')
            theta = sym(J(i+1).MDH.theta);
            d = q(i+1);
        else 
            theta = sym(J(i+1).MDH.theta);
            d = sym(J(i+1).MDH.d);    
        end
        % trattare alpha come sym
        alpha = J(i+1).MDH.alpha;
        if abs(alpha + pi/2) < 1e-12
            alpha = -sym(pi)/2;
        elseif abs(alpha - pi/2) < 1e-12
            alpha =  sym(pi)/2;
        else
            alpha = sym(alpha); % altri casi
        end
        T = MDH2tr(theta,d,alpha,sym(J(i+1).MDH.a));
        R = T(1:3,1:3); % matrice di rotazione da i+1 --> i
        % estrazione quantità dinamiche giunto successivo
        if i==n_joints
            [T,~] = FK_symbolic(rbt,q);
            Tr = T(1:3,1:3);
            fi =  Tr' * (  W * sym([0;0;1]) ); % deve essere verso l'alto poichè è forza imposta da ultimo link su end effector (deve sostenere peso payload)
            ni = cross( sym(h)/2*sym([1;0;0]) , fi );
        else
            fi = f(:,i+1);
            ni = n(:,i+1);
        end
        f(:,i) = R*fi + F(:,i);
        n(:,i) = N(:,i) + R * ni + cross( sym(J(i+1).MDH.a)/2*sym([1;0;0]) , F(:,i) )...
            + cross(  sym(J(i+1).MDH.a)*sym([1;0;0]) , R*fi );
        if strcmp(J(i).type, 'revolute')
            tau(i) = dot( n(:,i) , [0;0;1] );
        else
            tau(i) = dot( f(:,i) , [0;0;1] );
        end    
    end
    
    if class(q) == "sym" || class(qd) == "sym" || class(qdd) == "sym"
        tau = simplify(tau);
    else 
        tau = double(tau);
    end

end