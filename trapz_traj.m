function [theta,dtheta,ddtheta,t_b,t_jk] = trapz_traj(theta,dt)
% TRAPZ_TRAJ: questa funzione calcola la traiettoria per andare da una
% configurazione theta_start a una theta_goal nel tempo t con un profilo di
% velocità trapezoidale, passando per una serie di configurazioni intermedie 
% (viapoints). Si assume che tutti i giunti siano di tipo rotative.
%
% INPUT
% theta              matrice delle coordinate angolari nel tempo           (matrice MxN)
% ddtheta_max        massima accelerazione possibile                       (scalare)
% dt                 durata del tratto theta_i --> theta_i+1               (scalare)
%
% OUTPUT
% theta              matrice delle coordinate angolari nel tempo           (matrice MxN)          
% dtheta             matrice delle velocità nelle fasi lineari             (matrice MxN-1)
% ddtheta            matrice delle accelerazioni nei tratti parabolici     (matrice MxN)        
% t_b                matrice contenente le durate dei periodi di blend     (matrice MxN)
% t_kj               matrice contenente le durate dei periodi lineari      (vettore MxN-1)

[M,N] = size(theta);
dtheta = zeros(M,N-1);
ddtheta = zeros(M,N);
t_b = zeros(M,N);
t_jk = zeros(M,N-1);
% primo tratto
ddtheta_max = 4 * abs(theta(:,2) - theta(:,1)) / dt^2;
ddtheta(:,1) = sign(theta(:,2) - theta(:,1)) .* ddtheta_max;
t_b(:,1) = dt - sqrt(dt^2 - 2 * (theta(:,2) - theta(:,1))./ddtheta(:,1));
dtheta(:,1) = (theta(:,2) - theta(:,1))./(dt - 0.5*t_b(:,1));
% punti interni
for i = 2:N-1
    ddtheta_max = 4 * abs(theta(:,i) - theta(:,i-1)) / dt^2;
    dtheta(:,i) = (theta(:,i+1) - theta(:,i))/dt;
    ddtheta(:,i) = sign(dtheta(:,i) - dtheta(:,i-1)) .* ddtheta_max;
    t_b(:,i) = (dtheta(:,i) - dtheta(:,i-1))./ddtheta(:,i);
end
% ultimo tratto
ddtheta_max = 4 * abs(theta(:,N) - theta(:,N-1)) / dt^2;
ddtheta(:,N) = sign(theta(:,N) - theta(:,N-1)) .* ddtheta_max;
t_b(:,N) = dt - sqrt(dt^2 - 2 * (theta(:,N) - theta(:,N-1))./ddtheta(:,N));
dtheta(:,N-1) = (theta(:,N) - theta(:,N-1))./(dt - 0.5*t_b(:,N));

% calcolo durate tratti lineari
t_jk(:,1) = dt - t_b(:,1) - 0.5 * t_b(:,2);
for i = 2:N-2
    t_jk(:,i) = dt - 0.5 * t_b(:,i) - 0.5 * t_b(:,i+1);
end
t_jk(:,N-1) = dt - t_b(:,N) - 0.5 * t_b(:,N-1);