function [theta,dtheta,ddtheta,t_b,t_jk] = trapz_traj(theta,t,k)
% TRAPZ_TRAJ: questa funzione calcola la traiettoria per andare da una
% configurazione theta_start a una theta_goal nel tempo t con un profilo di
% velocità trapezoidale, passando per una serie di configurazioni intermedie 
% (viapoints). Si assume che tutti i giunti siano di tipo rotative.
%
% INPUT
% theta              vettore delle coordinate angolari nel tempo           (vettore Nx1)
% t                  vettore dei nodi temporali                            (vettore Nx1)
% k                  fattore di sicurezza su ddtheta (maggiore di 1)       scalare
% 
%
% OUTPUT
% theta              vettore delle coordinate angolari nel tempo           (vettore Nx1)          
% dtheta             vettore delle velocità nelle fasi lineari             (vettore N-1x1)
% ddtheta            vettore delle accelerazioni nei tratti parabolici     (vettore Nx1)        
% t_b                vettore contenente le durate dei periodi di blend     (vettore Nx1)
% t_kj               vettore contenente le durate dei periodi lineari      (vettore N-1x1)

N = length(t);
dt = diff(t);
dtheta = zeros(N-1,1);
ddtheta = zeros(N,1);
t_b = zeros(N,1);
% primo tratto
ddth =  k * 4 * (theta(2)- theta(1))/dt(1)^2;
ddtheta(1) = sign(theta(2) - theta(1)) * ddth;
t_b(1) = dt(1) - sqrt(dt(1)^2 - 2 * (theta(2) - theta(1))/ddtheta(1));
dtheta(1) = (theta(2) - theta(1))/(dt(1) - 0.5*t_b(1));

% punti interni
for i = 2:N-2
    dtheta1 = (theta(i+1) - theta(i))/dt(i);
    dtheta2 = (theta(i+2) - theta(i+1))/dt(i+1);
    ddth = k * 4 * (theta(i+1) - theta(i))/dt(i)^2;
    ddtheta(i+1) = sign(dtheta2-dtheta1) * ddth;
    
    dtheta(i) = dtheta1;
    ddtheta(i+1) = sign(dtheta2-dtheta1) * ddth;
    t_b(i) = (dtheta2 - dtheta1)/ddtheta(i+1);
end
% ultimo tratto
ddth =  k * 4 * (theta(N) - theta(N-1))/dt(N-1)^2;
ddtheta(N) = sign(theta(N) - theta(N-1)) * ddth;
t_b(N) = dt(N-1) - sqrt(dt(N-1)^2 - 2 * (theta(N) - theta(N-1))/ddtheta(N));
dtheta(N-1) = (theta(N) - theta(N-1))/(dt(N-1) - 0.5*t_b(N));

t_jk =  dt' - 0.5*t_b(1:N-1,:) - 0.5*t_b(2:N,:);

