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

% plot Start Configuration
q_start = [0; -2.4435; 1.5708; 1.5708; 1.5708];
color = [1 0 0];
rbt_plot(IDRA,q_start,color,env)
title('HEIL IDRA');

%% Inverse Kinematics

% sample configuration wrt STation
X_sample = [1; 0; -0.25];
Phi_Sample_Station = deg2rad([0; 90; 0]);
% target configuration wrt Sation
X_target = [0 ; 0; -0.25];
Phi_Target_Station = deg2rad([0; -90; 0]);

% matrice trasformazione Sample --> Station
T_Sample_Station = [ 1 , 0 , 0 , 1 ;...
                   0 , 1 , 0 , 0 ; ...
                   0 , 0 , 1 , -0.25;...
                   0 , 0 , 0 , 1 ];

T_Sample_Station(1:3,1:3) = eul2R(Phi_Sample_Station,'123');                 % matrice rotazione sample ---> station

% matrice di trasformazione Target-->Station
T_Target_Station = [ 1 , 0 , 0 , 0 ;...
                   0 , 1 , 0 , 0 ; ...
                   0 , 0 , 1 , -0.25;...
                   0 , 0 , 0 , 1 ];
T_Target_Station(1:3,1:3) = eul2R(Phi_Target_Station,'123');                 % matrice rotazione target ---> station

% matrice di trasformazione Sample ---> Base
T_Sample_Base = T_Station_Base * T_Sample_Station;

% matrice di trasformazione Target-->Base
T_Target_Base = T_Station_Base * T_Target_Station;

% vettore posizione Base wrt Sample
X_Sample_Base = T_Sample_Base(1:3,4);
% angoli di eulero di Base wrt Sample
Phi_Sample_Base = R2eul(T_Sample_Base(1:3,1:3),'123');

% vettore posizione Base wrt Target
X_Target_Base = T_Target_Base(1:3,4);
% angoli di eulero di Base wrt Target
Phi_Target_Base = R2eul(T_Target_Base(1:3,1:3),'123');

% j = 1;
% for i = 1:50
% q0 = rand(5,1)*pi;
% [sol,status] = numerical_IK(IDRA,[X_Sample_Base; Phi_Sample_Base],'123',q0);
%    if strcmp(status,'success')
%       q(:,j) = sol;
%       j = j+1;
%    end
% end


% analitical IK Sample 
[Qn_Sample, info_Sample] = IK_num(IDRA, [X_Sample_Base;Phi_Sample_Base], "123", ...
    'q0', zeros(5,1), ...
    'Nstarts', 500, ...
    'RequireForward', true, ...
    'DotMin', 0, ...          % no flip (angolo <= 90°)
    'wPos', 1, 'wOri', 0.2, 'wDot', 0.2, ...
    'KeepN', 20, ...
    'MaxFunEvals', 20000);
Qcand_Sample = info_Sample.bestListQ;   % 20 migliori candidati

disp(Qn_Sample)
disp(info_Sample.bestResidual)
disp(info_Sample.bestPosErr)   % metri
disp(info_Sample.bestOriErr)   % radianti

% analitical IK Target
[Qn_Target, info_Target] = IK_num(IDRA, [X_Target_Base;Phi_Target_Base], "123", ...
    'q0', zeros(5,1), ...
    'Nstarts', 500, ...
    'RequireForward', true, ...
    'DotMin', 0, ...          % no flip (angolo <= 90°)
    'wPos', 1, 'wOri', 0.2, 'wDot', 0.2, ...
    'KeepN', 20, ...
    'MaxFunEvals', 20000);
Qcand_Target = info_Target.bestListQ;   % 20 migliori candidati

disp(Qn_Target)
disp(info_Target.bestResidual)
disp(info_Target.bestPosErr)   % metri
disp(info_Target.bestOriErr)   % radianti

% scelta di configurazione sample e target dai rispettivi 20 migliori
% candidati (compliance with collision) 
% LOAD delle configurazioni scelte
q_Sample = load("q_Sample.mat");
q_Sample = q_Sample.q_Sample_chosen;
q_Target = load("q_Target.mat");
q_Target = q_Target.q_Target_chosen;

%% Trajectory generation
theta_A = [q_start q_Sample q_Sample q_Sample];
ddtheta_max = ones(5,1) * deg2rad(10);
dtA = allowable_dt(ddtheta_max,theta_A,1.2);
[qA,dqA,ddqA,t_bA,t_jkA] = trapz_traj(theta_A,dtA);
[q_trajA,dq_trajA,ddq_trajA] = whole_trajectory(qA,dqA,ddqA,dtA,t_bA,t_jkA,200,0);
q_trajA = cell2mat(q_trajA);
dq_trajA = cell2mat(dq_trajA);
ddq_trajA = cell2mat(ddq_trajA);


theta_B = [q_Sample q_Target q_Target q_Target];
dtB = allowable_dt(ddtheta_max,theta_B,1.2);
[qB,dqB,ddqB,t_bB,t_jkB] = trapz_traj(theta_B,dtB);
[q_trajB,dq_trajB,ddq_trajB] = whole_trajectory(qB,dqB,ddqB,dtB,t_bB,t_jkB,200,0);
q_trajB = cell2mat(q_trajB);
dq_trajB = cell2mat(dq_trajB);
ddq_trajB = cell2mat(ddq_trajB);

dt_sample = 1/200;
t_end = dtA * 3 + dtB * 3 + 3*dt_sample;
t_vec = 0:dt_sample:t_end;
q_traj = [q_trajA, q_trajB];
dq_traj = [dq_trajA, dq_trajB];
ddq_traj = [ddq_trajA, ddq_trajB];
for i = 1:5
        figure
        subplot(1,3,1)
        plot(t_vec(1:end),rad2deg(q_traj(i,:)),'r')
        xlabel('t [s]')
        ylabel('$\theta$ [deg]','Interpreter','latex')
        subplot(1,3,2)
        plot(t_vec(1:end),rad2deg(dq_traj(i,:)),'b')
        xlabel('t [s]')
        ylabel('$\dot{\theta}$ [deg/s]','Interpreter','latex')
        subplot(1,3,3)
        plot(t_vec(1:end),rad2deg(ddq_traj(i,:)),'g') 
        xlabel('t [s]')
        ylabel('$\dot{\dot{\theta}}\,[\mathrm{deg/s^{2}}]$','Interpreter','latex')
end


for i = 1:200:length(t_vec)
    figure(7)
    rbt_plot(IDRA,q_traj(:,i),color,env)
    pause(0.5)
    clf
end

%% test function
% FK
[T,p] = FK(IDRA,Qn_Sample);
alpha1 = R2eul(T(1:3,1:3),"123");
[T1,p1] = FK(IDRA,Qn_Target);
alpha2 = R2eul(T1(1:3,1:3),"123");
%X = [T(1:3,4);alpha];
% num IK
[Qn2,status] = numerical_IK(IDRA, [X_Sample_Base;Phi_Sample_Base], "123",[0;0;0;0;0]);
[T1,p1] = FK(IDRA,Qn2);
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







