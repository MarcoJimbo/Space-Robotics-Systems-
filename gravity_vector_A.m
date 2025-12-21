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
          - (4484277*cos(q2 + q3 + q4))/5000000 - (1494759*cos(q2 + q3 + q4 + q5))/5000000 - (19431867*cos(q2 + q3))/4000000 - (130792711*cos(q2))/10000000;
          - (4484277*cos(q2 + q3 + q4))/5000000 - (1494759*cos(q2 + q3 + q4 + q5))/5000000 - (19431867*cos(q2 + q3))/4000000;
          - (4484277*cos(q2 + q3 + q4))/5000000 - (1494759*cos(q2 + q3 + q4 + q5))/5000000;
          -(1494759*cos(q2 + q3 + q4 + q5))/5000000];
            
end