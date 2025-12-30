%%% MAIN da pre runnare prima di run simulink (salva i parametri necessari a run simulink)

clear; close all; format long; clc

%% IMPORT ROBOT

IDRA = jsondecode(fileread("IDRA.json"));

%% parametri necessari al run
 
% numero joint
N_joints = IDRA.joints_number;

% stato iniziale 
load('q_trajA.mat');
load('dq_trajA.mat');
load('ddq_trajA.mat');
q0 = q_trajA(2:end,1); % da prendere da generazione traiettoria
qd0 = dq_trajA(2:end,1); % da prendere da generazione traiettoria
qdd0 = ddq_trajA(2:end,1); % da prendere da generazione traiettoria

% quantità dinamiche attrito
[M_m,A_v,A_c] = motors_effect(IDRA);

% frequenze caratteristiche schema di controllo
f_s = 100; % [Hz] frequenze sensori = aggiornamento nu,mu,errors
f_u = 50; % [Hz] frequenze aggiornamento M,B,C,G
f_c = 50; % [Hz] frequenza del controllore
f_gt = 200; % [Hz] frequenza generazione della traiettoria

% sample time blocchi schema di controllo
T_s = 1/f_s; % [s]
T_u = 1/f_u; % [s]
T_c = 1/f_c; % [s]
T_gt = 1/f_gt; % [s]

% tempo di simulazione
T_sim = q_trajA(1,end);
% sample time simulazione
t_sim = min([T_s,T_u,T_c,T_gt]);

% GAINS
ki = 5; % da sostituire con  gain scelto
kp = 10; % da sostituire con  gain scelto
kd = 5; % da sostituire con  gain scelto
Ki = eye(IDRA.joints_number) * ki;
Kp = eye(IDRA.joints_number) * kp;
Kd = eye(IDRA.joints_number) * kd;

% parametri quantizzazione 
steps_encoder = 4096;
DELTA = 2*pi / steps_encoder; % [rad] step angolare quantizzazione encoder
t_const = 2e-2;