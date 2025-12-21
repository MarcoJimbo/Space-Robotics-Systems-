function[M,G,V,B,C,mu,nu,status] = decompose_tau(tau_sym,qd_sym,qdd_sym)
%%% function che dato in input il vettore tau in simbolico e la derivata
%%% temporale prima e seconda delle variabili di giunto decompone tau nelle
%%% varie componenti in cui può scomporsi il momento ai giunti.

% INPUT:
% tau_sym:                     sym [nx1] = espressione simbolica delle forze/momenti ai giunti non considerando attriti e contributo inerziale motore
% qd_sym:                      sym [nx1] = derivata temporale prima delle variabili di giunto
% qdd_sym:                     sym [nx1] = derivata temporale seconda delle variabili di giunto

% OUTPUT:
% M:                           sym [nxn] = matrice di massa               
% G:                           sym [nx1] = vettore delle forze gravitazionali
% V:                           sym [nx1] = vettore dei coefficienti delle forze di coriolis e centrifughe 
% B:                           sym [nxn(n-1)/2] = matrice dei coefficienti delle forze di coriolis
% C:                           sym [nxn] = matrice dei coefficienti delle forze centrifughe
% mu:                          sym [nx1] = vettore delle velocità^2 centrifughe (joint squared velocities)
% nu:                          sym [n(n-1)/2X1] = vettore delle velocità^2 di coriolis (joint crossed velocities)
% status:                      string    = decomposition status

    % number of joints
    n_joints = size(tau_sym,1);
    % estrarre matrice di massa 
    M = simplify( jacobian(tau_sym,qdd_sym) );
    % estrarre vettore forza gravitazionale
    b = simplify(subs(tau_sym, qdd_sym, sym(zeros(n_joints,1))));
    G = simplify(subs(b, qd_sym, sym(zeros(n_joints,1))));
    % estrarre vettore forza coriolis + centrifuga
    V = simplify(b - G);
    % verifica correttezza
    tau_rec = simplify(M*qdd_sym + V + G);
    err1 = simplify(tau_sym - tau_rec);   % deve dare vettore nullo 
    % estrarre B e C 
    % mu = [qd1^2; ...; qdn^2]
    qd0  = sym(zeros(n_joints,1));
    mu = qd_sym.^2;   % n x 1
    
    % nu = [qd1*qd2; ...; qd1*qdn; qd2*qd3; ...; qd(n-1)*qdn]
    npairs = n_joints*(n_joints-1)/2;
    nu = sym(zeros(npairs,1));
    pairs = zeros(npairs,2);
    
    k = 0;
    for i = 1:n_joints-1
        for j = i+1:n_joints
            k = k+1;
            nu(k) = qd_sym(i)*qd_sym(j);
            pairs(k,:) = [i j];   % traccia coppie, utile per debug
        end
    end
    % C(q): n x n, colonna i = coefficiente vettoriale di qd_i^2
    C = sym(zeros(n_joints,n_joints));
    for i = 1:n_joints
        C(:,i) = subs( diff(V, qd_sym(i), 2)/2, qd_sym, qd0 );
    end
    C = simplify(C);
    
    % B(q): n x npairs, colonna k = coefficiente vettoriale del monomio nu(k)=qd_i*qd_j
    B = sym(zeros(n_joints,npairs));
    k = 0;
    for i = 1:n_joints-1
        for j = i+1:n_joints
            k = k+1;
            B(:,k) = subs( diff(diff(V, qd_sym(i)), qd_sym(j)), qd_sym, qd0 );
        end
    end
    B = simplify(B);
    tau_rec = simplify(M*qdd_sym + B*nu + C*mu + G);
    err2 = simplify(tau_sym - tau_rec);  % deve essere vettore nullo 
    
    ok1 = all(isAlways(err1(:) == 0));
    ok2 = all(isAlways(err2(:) == 0));
    
    if ~ok1 || ~ok2
        status = "fail decomposition";
    else
        status = "successful decomposition";
    end

end