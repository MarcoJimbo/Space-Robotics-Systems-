function [tau] = Newton_Euler(rbt,q,q_dot,q_ddot,W,h,g)

    %%% function che dati in input il modello del manipolatore, la sua
    %%% configurazione in termini di variabili di giunto , la derivata
    %%% temporale prima e seconda delle variabili di giunto, peso e altezza
    %%% del payload e costante gravitazionale da in output le componenti 
    %%% lungo l'asse dei giunti dei momenti/forze globali scambiate alle 
    %%% interfacce dei giunti. 
    
    % INPUT:
    % rbt:                struct [1x1] = modello manipolatore 
    % q:                  double [nx1] = variabili di giunto [rad] / [m]
    % q_dot:              double [nx1] = derivata temporale variabili di giunto [rad/s] / [m/s]
    % q_dot:              double [nx1] = derivata seconda temporale variabili di giunto [rad/s^2] / [m/s^2]
    % W:                  scalar [1x1] = payload weight [N]
    % h:                  scalar [1x1] = payload height [m]
    % g:                  scalar [1x1] = gravity constant [m/s^2]
    
    % OUTPUT:
    % tau:                double [nx1] = componente lungo asse di giunto dei momenti/forze scambiati all'interfaccia tra i giunti
    
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
    
    n_joints = rbt.joints_number;
    J = [rbt.joints; rbt.end_effector];
    F = zeros(3,n_joints); % forza risultante sui c.d.m giunti [N]
    N = F; % [nx1] vettore momento risultante intorno ai c.d.m giunti [N*m]
    tau = zeros(n_joints,1); % [nx1] componente lungo asse di giunto di forza/momento all'interfaccia giunto [N] / [N*m]
    w = F; % [3xn] vettore velocità angolare dei giunti, ogni giunto i wrt {i} centrata in origine {0} [rad/s]
    w_dot = F; % [3xn] vettore accelerazione angolare dei giunti, ogni giunto i wrt {i} centrata in origine {0} [rad/s^2]
    v_dot = F; % [3xn] vettore accelerazione lineare dei giunti, ogni giunto i wrt {i} centrata in origine {0} [m/s^2]
    f = F; % [3xn] vettore forza globale scambiata tra i giunti 
    n = F; % [3xn] vettore momento globale scambiato tra i giunti
    
    %% outward iteration
    
    for i = 0:n_joints-1
        if strcmp(J(i+1).type, 'revolute')
            theta = q(i+1);
            d = J(i+1).MDH.d;
        else
            theta = J(i+1).MDH.theta;
            d = q(i+1);
        end
        T = MDH2tr(theta,d,J(i+1).MDH.alpha,J(i+1).MDH.a);
        R = (T(1:3,1:3))'; % matrice di rotazione i --> i+1
        Ix = rbt.links(i+1).inertia.Ixx;
        Iy = rbt.links(i+1).inertia.Iyy;
        Iz = rbt.links(i+1).inertia.Izz;
        I = [Ix , 0 , 0 ; 0 , Iy , 0 ; 0 , 0 , Iz]; % tensore inerzia link i+1
        % estrazione quantità cinematice giunto precedente
        if i==0
            wi = zeros(3,1);
            wi_dot = zeros(3,1);
            vi_dot = [0;0;g]; 
        else
            wi = w(:,i);
            wi_dot = w_dot(:,i);
            vi_dot = v_dot(:,i);
        end
        % determinazione grandezze cinematiche
        if strcmp(J(i+1).type, 'revolute')
            w(:,i+1) = R*wi + q_dot(i+1) * [0;0;1];
            w_dot(:,i+1) = R*wi_dot + cross( R*wi , q_dot(i+1)*[0;0;1] ) + q_ddot(i+1)*[0;0;1];
            v_dot(:,i+1) = R * ( cross( wi_dot , J(i+1).MDH.a*[1;0;0] ) ...
                + cross( wi , cross( wi , J(i+1).MDH.a*[1;0;0] ) ) + vi_dot);
            vci_dot = cross( w_dot(:,i+1) , 1/2*J(i+1).MDH.a*[1;0;0] )...
                + cross( w(:,i+1) , cross( w(:,i+1) , 1/2*J(i+1).MDH.a*[1;0;0] ) ) + v_dot(:,i+1);
            F(:,i+1) = rbt.links(i+1).mass * vci_dot;
            N(:,i+1) = I * w_dot(:,i+1) + cross( w(:,i+1) , I * w(:,i+1) );
        else
            w(:,i+1) = R*wi;
            w_dot(:,i+1) = R*wi_dot;
            v_dot(:,i+1) = R * ( cross( wi_dot , J(i+1).MDH.a*[1;0;0] ) ...
                + cross( wi , cross( wi , J(i+1).MDH.a*[1;0;0] ) ) + vi_dot)...
                + q_ddot(i+1)*[0;0;1] + cross( 2*w(:,i+1) , q_dot(i+1)*[0;0;1] );
            vci_dot = cross( w_dot(:,i+1) , 1/2*J(i+1).MDH.a*[1;0;0] )...
                + cross( w(:,i+1) , cross( w(:,i+1) , 1/2*J(i+1).MDH.a*[1;0;0] ) ) + v_dot(:,i+1);
            F(:,i+1) = rbt.links(i+1).mass * vci_dot;
            N(:,i+1) = I * w_dot(:,i+1) + cross( w(:,i+1) , I * w(:,i+1) );
        end
    end
    
    %% Inward iteration
    
    for i = n_joints:-1:1
        if strcmp(J(i+1).type, 'revolute')
            theta = q(i+1);
            d = J(i+1).MDH.d;
        elseif strcmp(J(i+1).type, 'prismatic')
            theta = J(i+1).MDH.theta;
            d = q(i+1);
        else 
            theta = J(i+1).MDH.theta;
            d = J(i+1).MDH.d;    
        end
        T = MDH2tr(theta,d,J(i+1).MDH.alpha,J(i+1).MDH.a);
        R = T(1:3,1:3); % matrice di rotazione da i+1 --> i
        % estrazione quantità dinamiche giunto successivo
        if i==n_joints
            [T,~] = FK(rbt,q);
            Tr = T(1:3,1:3);
            fi =  Tr' * (  W * [0;0;1] ); % deve essere verso l'alto poichè è forza imposta da ultimo link su end effector (deve sostenere peso payload)
            ni = cross( h/2*[1;0;0] , fi );
        else
            fi = f(:,i+1);
            ni = n(:,i+1);
        end
        f(:,i) = R*fi + F(:,i);
        n(:,i) = N(:,i) + R * ni + cross( 1/2*J(i+1).MDH.a*[1;0;0] , F(:,i) )...
            + cross(  J(i+1).MDH.a*[1;0;0] , R*fi );
        if strcmp(J(i).type, 'revolute')
            tau(i) = dot( n(:,i) , [0;0;1] );
        else
            tau(i) = dot( f(:,i) , [0;0;1] );
        end    
    end
    
end