%%%  dynamical properties of IDRA

% script che determina le espressioni simboliche delle componenti in cui è
% possibile decomporre il modello dinamico di IDRA. NB sono necessarie per
% generare le function numeriche specifiche di ogni componente dinamica 
% che vanno usate in fase di controllo del manipolatore.

clear; close all; format long; clc

%% IMPORT ROBOT

IDRA = jsondecode(fileread("IDRA.json"));
IDRA_modified = jsondecode(fileread("IDRA_modified.json"));
%% modellazione della dinamica

% parametri missione
g = 3.71; % [m/s^2] costante gravitazionale
h = 0.1; % [m] sample height
% fase A (no payload)
W_payload_A = 0; % [N] peso payload in fase A
% fase B (payload=sample)
W_payload_B = 2; % [N] peso payload in fase B
W_payload_B_modified = 2*1.5;
% numero di giunti
n_joints = IDRA.joints_number;

% inizializzazione simbolica variabili di giunto e derivate 
q_sym   = sym('q'  , [n_joints 1], 'real');
qd_sym = sym('qd'  , [n_joints 1], 'real');
qdd_sym  = sym('qdd'  , [n_joints 1], 'real');

% derivazione simbolica espressione delle forze/momenti di giunto
% fase A
[tau_sym_A] = Newton_Euler_symbolic(IDRA,q_sym,qd_sym,qdd_sym,W_payload_A,h,g);
[tau_sym_A_mod] = Newton_Euler_symbolic(IDRA_modified,q_sym,qd_sym,qdd_sym,W_payload_A,h,g);
% fase B
[tau_sym_B] = Newton_Euler_symbolic(IDRA,q_sym,qd_sym,qdd_sym,W_payload_B,h,g);
[tau_sym_B_mod] = Newton_Euler_symbolic(IDRA_modified,q_sym,qd_sym,qdd_sym,W_payload_B_modified,h,g);

% NB!! non si conta di attriti e di inerzia motori al momento!!
% come valutare tau_sym per specifici q qd qdd
% tau_fun = matlabFunction(tau_sym, 'Vars', {q_sym, qd_sym, qdd_sym});
% tau_num = tau_fun(q_val, qd_val, qdd_val);

% decomposizione del modello dinamico
% fase A
[M,G_A,V,B,C,mu,nu,status_A] = decompose_tau(tau_sym_A,qd_sym,qdd_sym);
[M_mod,G_A_mod,V_mod,B_mod,C_mod,mu_mod,nu_mod,status_A_mod] = decompose_tau(tau_sym_A_mod,qd_sym,qdd_sym);

% fase B
[~,G_B,~,~,~,~,~,status_B] = decompose_tau(tau_sym_B,qd_sym,qdd_sym);
[~,G_B_mod,~,~,~,~,~,status_B_mod] = decompose_tau(tau_sym_B_mod,qd_sym,qdd_sym);








