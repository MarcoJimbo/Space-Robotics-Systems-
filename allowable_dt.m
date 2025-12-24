function dt = allowable_dt(ddtheta_max,theta,k)
% La function calcola il minimo intervallo di tempo che assicura compliance
% con le accelerazioni massime dei joint. Si calcola il dt ammissibile per
% ogni joint j e per ogni tratto da i a i+1 e si sceglie il massimo tra
% questi come durata di ogni tratto. (il dt deve ovviamente essere lo
% stesso per ogni joint per assicurare sincronicità dei movimenti).
% INPUT
% 
% ddtheta_max           vettore delle accelerazioni massime dei joint      (vettore Nx1)
% theta                 matrice delle coordinate angolari                  (matrice MxN)
% k                     coefficiente di sicurezza                          (scalare)
%
% OUTPUT
% 
% dt                    durata di tutti i tratti                           (scalare)
%
% In questo modo tutti i giunti per cui inizialmente si era ottenuta una
% durata inferiore a dt, potranno lavorare a coppie più basse di quella
% massima. Si risparmia in potenza pagando in termini di durata delle
% operazioni.

[M,N] = size(theta);
dt_mat = zeros(M,N-1);
for i = 1:N-1
    for j = 1:M
    dt_mat(j,i) = k * sqrt(abs(theta(j,i+1) - theta(j,i))/ddtheta_max(j));
    end
end

dt = max(max(dt_mat));