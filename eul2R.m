function R = eul2R(eul, xyz)
% eul2R  Matrice di rotazione da angoli di Eulero, coerente con:
%   R = R_axis3(eul(3)) * R_axis2(eul(2)) * R_axis1(eul(1))
%
% dove axis1-axis2-axis3 sono i tre assi indicati da xyz (es. '123' = x-y-z).
%
% eul = [a;b;c] con:
%   a = angolo attorno al primo asse di xyz
%   b = angolo attorno al secondo asse di xyz
%   c = angolo attorno al terzo asse di xyz

eul = eul(:);
if numel(eul) ~= 3
    error('eul deve essere un vettore 3x1.');
end

a = eul(1); b = eul(2); c = eul(3);

Rx = @(t)[1 0 0; 0 cos(t) -sin(t); 0 sin(t) cos(t)];
Ry = @(t)[cos(t) 0 sin(t); 0 1 0; -sin(t) 0 cos(t)];
Rz = @(t)[cos(t) -sin(t) 0; sin(t) cos(t) 0; 0 0 1];

rot = @(ax,t) ...
    (ax=='1')*Rx(t) + (ax=='2')*Ry(t) + (ax=='3')*Rz(t);

if ~ischar(xyz) && ~isstring(xyz)
    error('xyz deve essere una stringa tipo ''123'', ''321'', ''313''.');
end
xyz = char(xyz);

if numel(xyz) ~= 3 || any(xyz<'1' | xyz>'3')
    error('xyz non valido. Usa stringhe come ''123'', ''321'', ''313''.');
end

R1 = rot(xyz(1), a);
R2 = rot(xyz(2), b);
R3 = rot(xyz(3), c);

R = R3 * R2 * R1;
end
