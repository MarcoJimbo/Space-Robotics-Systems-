function [theta,dtheta,ddtheta] = trapz_traj(theta,t)
% TRAPZ_TRAJ: questa funzione calcola la traiettoria per andare da un punto
% theta_i a uno theta_i+1 nel tempo t_i con un profilo di velocità trapezoidale.
% Si assume che tutti i giunti siano di tipo rotative.
%
% INPUT
% theta              matrice delle coordinate angolari nel tempo, 
%                    ogni riga corrisponde a un giunto                     matrix [MxN]
% t                  vettore dei nodi temporali                            vector [Nx1]
% k                  fattore di sicurezza su ddtheta (maggiore di 1)       scalare
% 
%
% OUTPUT
% theta              matrice delle coordinate angolari nel tempo           vector [MxN]
% dtheta             matrice delle velocità angolari nel tempo             vector [MxN]
% ddtheta            matrice delle accelerazioni angolari nel tempo        vector [MxN]

N = size(theta,2);
dt = diff(t);
dtheta = zeros(N,1);
ddtheta = zeros(N,1);

% primo tratto
ddt =  k .* 4 .* (theta(:,2)- theta(:,1))./dt(1)^2;
ddtheta(1) = sign(theta(:,2) - theta(:,1)) .* ddt;
t1 = dt(1) - sqrt(dt(1)^2 - 2 .* (theta(:,2) - theta(:,1))./ddtheta(1));
dtheta(1) = (theta(:,2) - theta(:,1))/(dt(1) - 0.5*t1);
% punti interni
for i = 2:N-2
    dtheta1 = (theta(:,i+1) - theta(:,i))./dt(i);
    dtheta2 = (theta(:,i+2) - theta(:,i+1))./dt(i+1);
    ddt = k .* 4 .* (theta(:,i+1)- theta(:,i))./dt(i)^2;
    ddtheta = sign(dtheta2-dtheta1) * ddt;

    dtheta(i) = dtheta1;
    dtheta(i+1) = dtheta2;
    ddtheta(i+1) = ddtheta;
end
% ultimo tratto
ddt =  k * 4 .* (theta(:,N)- theta(:,N-1))./dt(N-1)^2;
ddtheta(N) = sign(theta(:,N) - theta(:,N-1)) .* ddt;
tN = dt(N-1) - sqrt(dt(N-1)^2 - 2 .* (theta(:,N) - theta(:,N-1))./ddtheta(N));
dtheta(N) = (theta(:,N) - theta(:,N-1))./(dt(N-1) - 0.5*tN);

