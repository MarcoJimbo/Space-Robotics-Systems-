%%% MAIN HOMEWORK 1


clear; close all; format long; clc

%% IMPORT ROBOT

IDRA = jsondecode(fileread("IDRA.json"));

%% enviroment

% matrice di trasformazione Station --> Base
T_Station_Base = [ 1 , 0 , 0 , -0.5 ;...
                   0 , 1 , 0 , 0 ; ...
                   0 , 0 , 1 , -0.25;...
                   0 , 0 , 0 , 1 ];

% obstacles wrt Base
env = setObstacles(T_Station_Base);

% plot HEILConfiguration
q_start = [0; -2.4435; 1.5708; 1.5708; 1.5708];
color = [1 0 0];
rbt_plot(IDRA,q_start,color,env)
title('HEIL IDRA');

%% Inverse Kinematics
X_sample = [1; 0; -0.25];
Phi_Sample_Station = deg2rad([0; 90; 0]);
T_Sample_Station = [ 1 , 0 , 0 , 1 ;...
                   0 , 1 , 0 , 0 ; ...
                   0 , 0 , 1 , -0.25;...
                   0 , 0 , 0 , 1 ];

T_Sample_Station(1:3,1:3) = eul2R(Phi_Sample_Station,'123');                 % matrice di trasformazione sample ---> station
T_Sample_Base = T_Station_Base * T_Sample_Station;

X_Sample_Base = T_Sample_Base(1:3,4);
Phi_Sample_Base = R2eul(T_Sample_Base(1:3,1:3),'123');
% j = 1;
% for i = 1:50
% q0 = rand(5,1)*pi;
% [sol,status] = numerical_IK(IDRA,[X_Sample_Base; Phi_Sample_Base],'123',q0);
%    if strcmp(status,'success')
%       q(:,j) = sol;
%       j = j+1;
%    end
% end




%% test function
% FK
[T,p] = FK(IDRA,q_val);
alpha = R2eul(T(1:3,1:3),"123");
X = [T(1:3,4);alpha];
% num IK
[Qn,status] = numerical_IK(IDRA, X, "123",[0;0;0;0;0]);
[T1,p1] = FK(IDRA,Qn);
% num Newton_Euler
qd_val = [0,0,0,0,0]';
qdd_val = [0,0,0,0,0]';
% sym Newton_Euler
n_joints = IDRA.joints_number;
q_sym   = sym('q'  , [n_joints 1], 'real');
qd_sym = sym('qd'  , [n_joints 1], 'real');
qdd_sym  = sym('qdd'  , [n_joints 1], 'real');
[tau_sym] = Newton_Euler_symbolic(IDRA,q_sym,qd_sym,qdd_sym,2,0.1,3.71);
% how to value tau_fun for q qd qdd choices
tau_fun = matlabFunction(tau_sym, 'Vars', {q_sym, qd_sym, qdd_sym});
tau_num = tau_fun(q_val, qd_val, qdd_val);
% i risultati ottenuti in numerico o sym coincidono :)
[M,G,V,B,C,mu,nu,status_decompose_tau] = decompose_tau(tau_sym,qd_sym,qdd_sym);
% TO DO creare diverse function che valutano separatamente M C G B V







