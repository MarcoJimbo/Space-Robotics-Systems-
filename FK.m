function [T,p] = FK(rbt,q,varargin)
% Questa function permette di calcolare la cinematica diretta per un
% manipolatore con n giunti a partire dal vettore delle coordinate dei
% giunti. 
%
% INPUT
% rbt                            modello del manipolatore                               (file .json)
% q                              vettore delle variabili dei giunti                     (vector nx1)
% varargin{1} = joint_name       nome del giunto di cui si vole calcolare T             (stringa)
%
% OUTPUT
% T                              matrice di trasformazione joint ---> base              (matrice 4x4)                 
% p                              vettore posizione del giunto selezionato               (vettore 3x1)

rbt = jsondecode(fileread(rbt));
n_joints = length(rbt.joints);
j = rbt.joints;
T = eye(4);

if isempty(varargin)
   n = n_joints;
else
    joint_name = varargin{1};
    for i = 1:n_joints
        if strcmp(j(i).name,joint_name)
            n = i;
        end
    end
end

for i = 1:n
    j = rbt.joints(i);
    if strcmp(j.type, 'revolute')
       theta = q(i);
       d = j.MDH.d;
    else
       d = q(i);
       theta = j.MDH.theta;
    end
    T = T * MDH2tr(theta,d,j.MDH.alpha,j.MDH.a);
end
p = T(1:3,4);