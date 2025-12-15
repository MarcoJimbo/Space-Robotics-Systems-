function J = geomJacobian(rbt,q)
% La function calcola la matrice jacobiana del manipolatore. Richiede come
% INPUT
% rbt               modello del manipolatore                               (struct)
% q                 vettore delle variabili dei giunti                     (vector nx1)
%
% OUTPUT
% J                 matrice jacobiana corrispondente alla configurazione q (matrice 6xn)
%
% Nel caso in cui la configurazione non venga fornita, la funzione
% restituisce la jacobiana come funzione delle variabili dei giunti q.


n_joints = rbt.joints_number;
j = rbt.joints;
Jp = zeros(3,n_joints);
Jo = zeros(3,n_joints);
[~,pe] = FK(rbt,q);

% jacobian computation
for i = 1:n_joints  
    [Ti,p] = FK(rbt,q,j(i).name);
    z = Ti(1:3,1:3) * [0;0;1];
    if strcmp(j(i).type,'revolute')
       Jp(:,i) = cross(z,(pe-p));
       Jo(:,i) = z;
    else
        Jp(:,i) = z;
        Jo(:,i) = zeros(3,1);
    end
end

J = [Jp; Jo];

end

