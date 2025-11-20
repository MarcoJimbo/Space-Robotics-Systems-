function [T] = FK(rbt,q)
% Questa function permette di calcolare la cinematica diretta per un
% manipolatore con n giunti a partire dal vettore delle coordinate dei
% giunti.
%
% INPUT
% rbt               modello del manipolatore           (file .json)
% q                 vettore delle variabili dei giunti (vector nx1)
%
% OUTPUT
% X                 vettore di coordinate cartesiane   (6x1)

rbt = jsondecode(fileread(rbt));
n_joints = length(rbt.joints);
T = eye(4);
for i = 1:n_joints
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