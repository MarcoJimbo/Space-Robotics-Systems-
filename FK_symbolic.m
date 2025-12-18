function [T,p] = FK_symbolic(rbt,q,varargin)
% Questa function permette di calcolare la cinematica diretta per un
% manipolatore con n giunti a partire dal vettore delle coordinate dei
% giunti. 
%
% INPUT
% rbt                            modello del manipolatore                               (struct)
% q                              vettore delle variabili dei giunti                     (vector nx1)
% varargin{1} = joint_name       nome del giunto di cui si vole calcolare T             (stringa)
%
% OUTPUT
% T                              matrice di trasformazione joint ---> base              (matrice 4x4)                 
% p                              vettore posizione del giunto selezionato               (vettore 3x1)

n_joints = rbt.joints_number;
j = [rbt.joints; rbt.end_effector];
T = sym(eye(4));

if isempty(varargin)
   n = n_joints+1;
else
    joint_name = varargin{1};
    for i = 1:n_joints+1
        if strcmp(j(i).name,joint_name)
            n = i;
        end
    end
end

for i = 1:n
    if strcmp(j(i).type, 'revolute')
       theta = q(i);
       d = sym(j(i).MDH.d);
    elseif strcmp(j(i).type, 'prismatic')
       d = q(i);
       theta = sym(j(i).MDH.theta);
    else
        d = sym(0);
        theta = sym(0);
    end
    T = T * MDH2tr(theta,d,sym(j(i).MDH.alpha),sym(j(i).MDH.a));
end
p = T(1:3,4);