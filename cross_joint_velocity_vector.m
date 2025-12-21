function[nu] = cross_joint_velocity_vector(qd)

    %%% function che in funzione delle variabili di giunto e della loro 
    %%% derivata temporale prima costruisce il vettore delle cross joint
    %%% velocities. 
    %%% IMPORTANTE va aggiornata l'espressione ogni volta che vengono 
    %%% cambiate le caratteristiche fisiche del manipolatore.

    % INPUT:
    % qd:                   double [nx1] = derivata temporale variabili di giunto

    % OUTPUT:
    % nu:                   double [nx1] = vettore delle velocità di coriolis (cross joint velocities)

    % estrazione componenti input
    % derivata temporale variabili di giunto
    qd1 = qd(1);
    qd2 = qd(2);
    qd3 = qd(3);
    qd4 = qd(4);
    qd5 = qd(5);
    
    % determinazione vettore delle cross joint velocities
    nu = [ qd1*qd2 ; qd1*qd3 ; qd1*qd4 ; qd1*qd5 ; qd2*qd3 ; qd2*qd4 ;...
           qd2*qd5 ; qd3*qd4 ; qd3*qd5 ; qd4*qd5 ];  
    
end