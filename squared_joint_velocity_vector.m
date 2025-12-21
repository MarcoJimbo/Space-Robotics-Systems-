function[mu] = squared_joint_velocity_vector(qd)

    %%% function che in funzione delle variabili di giunto e della loro 
    %%% derivata temporale prima costruisce il vettore delle squared joint
    %%% velocities. 
    %%% IMPORTANTE va aggiornata l'espressione ogni volta che vengono 
    %%% cambiate le caratteristiche fisiche del manipolatore.

    % INPUT:
    % qd:                   double [nx1] = derivata temporale variabili di giunto

    % OUTPUT:
    % mu:                   double [nx1] = vettore delle velocità centrifughe (squared joint velocities)

    % estrazione componenti input
    % derivata temporale variabili di giunto
    qd1 = qd(1);
    qd2 = qd(2);
    qd3 = qd(3);
    qd4 = qd(4);
    qd5 = qd(5);
    
    % determinazione vettore delle squared joint velocities
    mu = [ qd1^2 ; qd2^2 ; qd3^2 ; qd4^2 ; qd5^2 ]; 
    
end