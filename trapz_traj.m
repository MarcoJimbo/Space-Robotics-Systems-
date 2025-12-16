function [theta,dtheta,ddtheta,t_b,t_jk] = trapz_traj(theta,t,ddtheta_max)
% TRAPZ_TRAJ: questa funzione calcola la traiettoria per andare da una
% configurazione theta_start a una theta_goal nel tempo t con un profilo di
% velocità trapezoidale, passando per una serie di configurazioni intermedie 
% (viapoints). Si assume che tutti i giunti siano di tipo rotative.
%
% INPUT
% theta              vettore delle coordinate angolari nel tempo           (vettore Nx1)
% t                  vettore dei nodi temporali                            (vettore Nx1)
% ddtheta_max        massima accelerazione possibile                       (scalare)
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
t_jk = zeros(N-1,1);
% primo tratto
ddtheta(1) = sign(theta(2) - theta(1)) * ddtheta_max;
t_b(1) = dt(1) - sqrt(dt(1)^2 - 2 * (theta(2) - theta(1))/ddtheta(1));
dtheta(1) = (theta(2) - theta(1))/(dt(1) - 0.5*t_b(1));
% punti interni
for i = 2:N-1
    dtheta(i) = (theta(i+1) - theta(i))/dt(i);
    ddtheta(i) = sign(dtheta(i)-dtheta(i-1)) * ddtheta_max;
    t_b(i) = (dtheta(i) - dtheta(i-1))/ddtheta(i);
end
% ultimo tratto
ddtheta(N) = sign(theta(N) - theta(N-1)) * ddtheta_max;
t_b(N) = dt(N-1) - sqrt(dt(N-1)^2 - 2 * (theta(N) - theta(N-1))/ddtheta(N));
dtheta(N-1) = (theta(N) - theta(N-1))/(dt(N-1) - 0.5*t_b(N));

% calcolo durate tratti lineari
t_jk(1) = dt(1) - t_b(1) - 0.5 * t_b(2);
for i = 2:N-2
    t_jk(i) = dt(i) - 0.5 * t_b(i) - 0.5 * t_b(i+1);
end
t_jk(N-1) = dt(N-1) - t_b(N) - 0.5 * t_b(N-1);