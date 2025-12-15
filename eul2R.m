function R = eul2R(eul, xyz)

% La funzione calcola la matrice di rotazione dati in input i tre angoli
% di rotazione e la sequenza di assi di rotazione
% INPUT
% phi           vettore contenente i tre angoli di rotazione               (vector 3x1)
% xyz           sequenza di assi di rotazione specificata come codice             
%               numerico (es. 123)                                         (stringa)
%       
% OUTPUT       
% R             matrice di rotazione 3x3                                   (matrix 3x3)


a = eul(1); b = eul(2); c = eul(3);
Rx = [1 0 0; 0 cos(a) -sin(a); 0 sin(a) cos(a)];
Ry = [cos(b) 0 sin(b); 0 1 0; -sin(b) 0 cos(b)];
Rz = [cos(c) -sin(c) 0; sin(c) cos(c) 0; 0 0 1];

switch xyz
    case '123' % x-y-z
        R = Rz*Ry*Rx; % se X=[roll pitch yaw]
    case '321'
        R = Rx*Ry*Rz;
    case '313'
        R = Rz*Rx*Rz;
    otherwise
        error('Sequenza non supportata');
end
end
