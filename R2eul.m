function eul = R2eul(R,xyz)
% La funzione calcola i tre angoli di rotazione dati in input la matrice di
% rotazione e la sequenza di assi di rotazione
% INPUT
% R             matrice di rotazione 3x3                                   (matrix 3x3)
% xyz           sequenza di assi di rotazione specificata come codice             
%               numerico (es. 123)                                         (stringa)
%       
% OUTPUT       
% phi           vettore contenente i tre angoli di rotazione               (vector 3x1)

switch xyz
    case '123'
        theta = asin(-R(3,1));
        phi = atan2(R(2,1),R(1,1));
        psi = atan2(R(3,2),R(3,3));
    case '313'
        theta = atan2(sqrt(R(3,1)^2 + R(3,2)^2),R(3,3));
        phi = atan2(R(2,3),R(1,3));
        psi = atan2(R(3,2),-R(3,1));
    case '321'
        theta = asin(R(1,3));
        phi = atan2(-R(2,3),R(3,3));
        psi = atan2(-R(1,2),R(1,1));
    case '323'
        theta = atan2(sqrt(R(1,3)^2 + R(2,3)^2),R(3,3));
        phi = atan2(R(2,3),R(1,3));
        psi = atan2(R(3,2),-R(3,1));
end

eul = [psi; theta; phi];