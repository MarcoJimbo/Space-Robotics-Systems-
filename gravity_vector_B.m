function[G] = gravity_vector_B(q)

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
          - (2*cos(q2 + q3 + q4))/5 - cos(q2 + q3 + q4 + q5)/2 - cos(q2 + q3) - (7*cos(q2))/5 - (501963*pi*cos(q2 + q3 + q4 + q5))/4000000 - (6525519*pi*cos(q2 + q3))/3200000 - (3513741*pi*cos(q2))/640000 - (1505889*pi*cos(q2 + q3 + q4))/4000000;
          - (2*cos(q2 + q3 + q4))/5 - cos(q2 + q3 + q4 + q5)/2 - cos(q2 + q3) - (501963*pi*cos(q2 + q3 + q4 + q5))/4000000 - (6525519*pi*cos(q2 + q3))/3200000 - (1505889*pi*cos(q2 + q3 + q4))/4000000;
          - (2*cos(q2 + q3 + q4))/5 - cos(q2 + q3 + q4 + q5)/2 - (501963*pi*cos(q2 + q3 + q4 + q5))/4000000 - (1505889*pi*cos(q2 + q3 + q4))/4000000;
          -cos(q2 + q3 + q4 + q5)*((501963*pi)/4000000 + 1/2)];
              
end