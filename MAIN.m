%%% MAIN HOMEWORK 1


clear; close all; format long; clc

%% IMPORT ROBOT

IDRA = jsondecode(fileread("IDRA.json"));
IDRA_sym = jsondecode(fileread("IDRA_sym.json"));

%% enviroment

% matrice di trasformazione Station --> Base
T_Station_Base = [ 1 , 0 , 0 , -0.5 ;...
                   0 , 1 , 0 , 0 ; ...
                   0 , 0 , 1 , -0.25;...
                   0 , 0 , 0 , 1 ];

% obstacles wrt Base
env = setObstacles(T_Station_Base);

% plot HEILConfiguration
q_val = [0,-0.5,0,0,0]';
color = [1 0 0];
rbt_plot(IDRA,q_val,color,env)
title('HEIL IDRA');

%% test function
% FK
[T,p] = FK(IDRA,q_val);
alpha = R2eul(T(1:3,1:3),"123");
X = [T(1:3,4);alpha];
% num IK
[Qn,status] = numerical_IK(IDRA, X, "123",[-2;0;4;0.6;0]);
[T1,p1] = FK(IDRA,Qn);
% num Newton_Euler
qd_val = [0,0,0,0,0]';
qdd_val = [0,0,0,0,0]';
[tau] = Newton_Euler(IDRA,q_val,qd_val,qdd_val,2,0.1,3.71);
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
% estrarre matrice di massa 
M = simplify( jacobian(tau_sym,qdd_sym) );
% estrarre vettore forza gravitazionale
b = simplify(subs(tau_sym, qdd_sym, sym(zeros(n_joints,1))));
G = simplify(subs(b, qd_sym, sym(zeros(n_joints,1))));
% estrarre vettore forza coriolis + centrifuga
V = simplify(b - G);
% verifica correttezza
tau_rec = simplify(M*qdd_sym + V + G);
simplify(tau_sym - tau_rec);   % deve dare vettore nullo --> lo fa :)
% estrarre B e C 
% mu = [qd1^2; ...; qdn^2]
qd0  = sym(zeros(n_joints,1));
mu = qd_sym.^2;   % n x 1

% nu = [qd1*qd2; ...; qd1*qdn; qd2*qd3; ...; qd(n-1)*qdn]
npairs = n_joints*(n_joints-1)/2;
nu = sym(zeros(npairs,1));
pairs = zeros(npairs,2);

k = 0;
for i = 1:n_joints-1
    for j = i+1:n_joints
        k = k+1;
        nu(k) = qd_sym(i)*qd_sym(j);
        pairs(k,:) = [i j];   % traccia coppie, utile per debug
    end
end
% C(q): n x n, colonna i = coefficiente vettoriale di qd_i^2
C = sym(zeros(n_joints,n_joints));
for i = 1:n_joints
    C(:,i) = subs( diff(V, qd_sym(i), 2)/2, qd_sym, qd0 );
end
C = simplify(C);

% B(q): n x npairs, colonna k = coefficiente vettoriale del monomio nu(k)=qd_i*qd_j
B = sym(zeros(n_joints,npairs));
k = 0;
for i = 1:n_joints-1
    for j = i+1:n_joints
        k = k+1;
        B(:,k) = subs( diff(diff(V, qd_sym(i)), qd_sym(j)), qd_sym, qd0 );
    end
end
B = simplify(B);
tau_rec = simplify(M*qdd_sym + B*nu + C*mu + G);
err = simplify(tau_sym - tau_rec);  % deve essere vettore nullo --> lo è :)
% TO DO creare diverse function che valutano separatamente M C G B V







