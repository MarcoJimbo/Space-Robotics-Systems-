function[M_m,A_v,A_c] = motors_effect(rbt)

    %%% function che preso in input il modello del braccio robotico
    %%% restituisce in output la matrice di massa dei motori e la
    %%% componente di attrito viscoso e di coulomb dovuta ai motori 

    % INPUT:
    % rbt:                  struct [1x1] = modello manipolatore

    % OUTPPUT:
    % M_m :                 double [nxn] = matrice di massa motori [kg*m^2]
    % A_v:                  double [nxn] = matrice dei coefficienti attrito viscoso [N*m*s] 
    % A_c:                  double [nxn] = vettore degli attriti di Coulomb [N*m]

    % informazioni joint
    n_joints = rbt.joints_number;

    % inizializzazione matrici
    M_m = zeros(n_joints,n_joints);
    A_v = M_m;
    A_c = zeros(n_joints,1);

    for i = 1:n_joints
        M_m(i,i) = rbt.joints(i).DC_motor.I * (rbt.joints(i).DC_motor.gear_ratio)^2;
        A_v(i,i) = (rbt.joints(i).DC_motor.gear_ratio)^2 * rbt.joints(i).DC_motor.b;
        A_c(i) = (rbt.joints(i).DC_motor.gear_ratio)^2 * rbt.joints(i).DC_motor.tc;
    end

end