function [Q] = IK(rbt,X,xyz)
% Questa function risolve analiticamente la cinematica inversa di un
% manipolatore
%
% INPUT
% rbt               modello del manipolatore           (struct)
% X                 vettore di coordinate cartesiane   (6x1)
% xyz               sequenza degli assi di rotazione   (string)
%
% OUTPUT
% Q                 matrice le cui colonne corrispondono alle soluzioni            (matrix NxM)


n_joints = rbt.joints_number;
q = sym('q', [n_joints 1], 'real');
T_fk = FK(rbt,q);

T = sym(eye(4));
switch xyz
    case '123'
        T = rot2tr(X(6),'z') * rot2tr(X(5),'y') * rot2tr(X(4),'x') * translation2tr(X(1:3));
    case '313'
        T = rot2tr(X(6),'z') * rot2tr(X(5),'x') * rot2tr(X(4),'z') * translation2tr(X(1:3));
    case '321'
        T = rot2tr(X(6),'x') * rot2tr(X(5),'y') * rot2tr(X(4),'z') * translation2tr(X(1:3));
end

eq = sym('eq', [6 1]);
for i = 1:3
eq(i) = T(i,4) - T_fk(i,4);
eq(i+3) = T(i,3) - T_fk(i,3);
end
eq = matlabFunction(eq, 'Vars', {q});
q0 = zeros(6,1);
Q = fsolve(eq, q0);

