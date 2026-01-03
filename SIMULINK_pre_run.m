%%% MAIN da pre runnare prima di run simulink (salva i parametri necessari a run simulink)

clear; close all; format long; clc

%% IMPORT ROBOT

IDRA = jsondecode(fileread("IDRA.json"));

%% parametri necessari al run
 
% numero joint
N_joints = IDRA.joints_number;

% stato iniziale 
% fase A
load('q_trajA.mat');
load('dq_trajA.mat');
load('ddq_trajA.mat');

q0_A = q_trajA(2:end,1); % da prendere da generazione traiettoria
qd0_A = dq_trajA(2:end,1); % da prendere da generazione traiettoria
qdd0_A = ddq_trajA(2:end,1); % da prendere da generazione traiettoria

% fase B
load('q_trajB.mat');
load('dq_trajB.mat');
load('ddq_trajB.mat');

q0_B = q_trajB(2:end,1); % da prendere da generazione traiettoria
qd0_B = dq_trajB(2:end,1); % da prendere da generazione traiettoria
qdd0_B = ddq_trajB(2:end,1); % da prendere da generazione traiettoria

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
% fase A
T_in_sim_A = q_trajA(1,1);
T_sim_A = q_trajA(1,end);
T_moto_A = 9.56; % [s]
% fase B
T_in_sim_B = q_trajB(1,1);
T_sim_B = q_trajB(1,end);
T_moto_B = 34.085; % [s]

% sample time simulazione
t_sim = min([T_s,T_u,T_c,T_gt]);


% GAINS
ki = 5; % da sostituire con  gain scelto
kp = 10; % da sostituire con  gain scelto
kd = 5; % da sostituire con  gain scelto
Ki = eye(N_joints) * ki;
Kp = eye(N_joints) * kp;
Kd = eye(N_joints) * kd;

% parametri quantizzazione 
steps_encoder = 4096;
DELTA = 2*pi / steps_encoder; % [rad] step angolare quantizzazione encoder

% parametri differenziazione
K = 5; % numero di misure utilizzate per ricostruzione velocità
t_LPF = 10; % [s] durata tempo LPF
t_fade = 0.5; % [s] durata fade da LPF a raw
t_const = 2e-2; % costante di tempo LPF

% parametri dei motori
% inizializzazione
km = zeros(N_joints,1);
ke = km;
Ra = km;
gear_ratio = km;
% riempimento
for i = 1:N_joints
    km(i) = IDRA.joints(i).DC_motor.km;
    ke(i) = IDRA.joints(i).DC_motor.ke;
    Ra(i) = IDRA.joints(i).DC_motor.R;
    gear_ratio(i) = IDRA.joints(i).DC_motor.gear_ratio;
end
