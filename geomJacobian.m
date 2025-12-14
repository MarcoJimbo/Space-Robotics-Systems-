function J = geomJacobian(rbt,q)
% La function calcola la matrice jacobiana del manipolatore. Richiede come
% INPUT
% rbt               modello del manipolatore                               (file .json)
% q                 vettore delle variabili dei giunti                     (vector nx1)
%
% OUTPUT
% J                 matrice jacobiana corrispondente alla configurazione q (matrice 6xn)
%
% Nel caso in cui la configurazione non venga fornita, la funzione
% restituisce la jacobiana come funzione delle variabili dei giunti q.


robot = jsondecode(fileread(rbt));
n_joints = length(robot.joints);
j = robot.joints;
Jp = zeros(3,n_joints);
Jo = zeros(3,n_joints);

% calcolo posizione dell'EE rispetto alla base
L = robot.end_effector.MDH.a;
pEE = L * [1;0;0];
[T,p_last] = FK(rbt,q,j(n_joints).name);
T = translation2tr(pEE) * T;
pe = T*p_last;

% jacobian computation
for i = 2:n_joints+1  
    [Ti,p] = FK(rbt,q,j(i-1).name);
    z = Ti(1:3,1:3) * [0;0;1];
    if strcmp(j(i).type,'revolute')
       Jp(:,i) = cross(z,(pe-p));
       Jo(:,i) = z;
    else
        Jp(:,i) = z;
        Jo(:,i) = zeros(3,1);
    end
end

J = [Jp(:,2:end); Jo(:,2:end)];

end

