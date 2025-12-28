%%% MAIN da pre runnare prima di run simulink (salva i parametri necessari a run simulink)

clear; close all; format long; clc

%% IMPORT ROBOT

IDRA = jsondecode(fileread("IDRA.json"));

%% parametri necessari al run
 
% stato iniziale 

 q0 = []; % da prendere da generazione traiettoria
 qd0 = []; % da prendere da generazione traiettoria
 qdd0 = []; % da prendere da generazione traiettoria

% frequenze caratteristiche schema di controllo

f_s = 1000; % [Hz] frequenze sensori = aggiornamento nu,mu,errors
f_u = 100; % [Hz] frequenze aggiornamento M,B,C,G
f_c = 100; % [Hz] frequenze aggiornamento M,B,C,G

T_s = 1/f_s; % [s]
T_u = 1/f_u; % [s]
T_c = 1/f_c; % [s]
% GAINS
ki = 1; % da sostituire con  gain scelto
kp = 1; % da sostituire con  gain scelto
kd = 1; % da sostituire con  gain scelto
Ki = eye(IDRA.joints_number) * ki;
Kp = eye(IDRA.joints_number) * kp;
Kd = eye(IDRA.joints_number) * kd;

% parametri quantizzazione 
steps_encoder = 4096;
DELTA = 2*pi / steps_encoder; % [rad] step angolare quantizzazione encoder
t_const = 2e-2;