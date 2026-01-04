function[G] = gravity_vector_A(q)

    %%% function che in funzione delle variabili di giunto costruisce il 
    %%% vettore della forza gravitazionale del manipolatore. 
    %%% IMPORTANTE va aggiornata l'espressione ogni volta che vengono 
    %%% cambiate le caratteristiche fisiche del manipolatore.

    % INPUT:
    % q:                    double [nx1] = variabili di giunto
   
    % OUTPUT:
    % G:                    double [nxn] = vettore delle forze gravitazionali

    % estrazione componenti input
    % variabili di giunto
    q1 = q(1);
    q2 = q(2);
    q3 = q(3);
    q4 = q(4);
    q5 = q(5);
    
    % determinazione vettore delle forze di gravità
    G = [ 0; 
         -(501963*pi*(12*cos(q2 + q3 + q4) + 4*cos(q2 + q3 + q4 + q5) + 65*cos(q2 + q3) + 175*cos(q2)))/16000000;
         -(501963*pi*(12*cos(q2 + q3 + q4) + 4*cos(q2 + q3 + q4 + q5) + 65*cos(q2 + q3)))/16000000;
         -(501963*pi*(3*cos(q2 + q3 + q4) + cos(q2 + q3 + q4 + q5)))/4000000;
         -(501963*pi*cos(q2 + q3 + q4 + q5))/4000000];
    
end