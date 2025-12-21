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
          - (6484277*cos(q2 + q3 + q4))/5000000 - (3994759*cos(q2 + q3 + q4 + q5))/5000000 - (23431867*cos(q2 + q3))/4000000 - (144792711*cos(q2))/10000000;
          - (6484277*cos(q2 + q3 + q4))/5000000 - (3994759*cos(q2 + q3 + q4 + q5))/5000000 - (23431867*cos(q2 + q3))/4000000;
          - (6484277*cos(q2 + q3 + q4))/5000000 - (3994759*cos(q2 + q3 + q4 + q5))/5000000;
          -(3994759*cos(q2 + q3 + q4 + q5))/5000000];
             
end