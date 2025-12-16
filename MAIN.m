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
q = [0,-0.5,0,0,0];
color = [1 0 0];
rbt_plot(IDRA,q,color,env)
title('HEIL IDRA');

%% test function
[T,p] = FK(IDRA,q);
alpha = R2eul(T(1:3,1:3),"123");
X = [T(1:3,4);alpha];
[Qn,status] = numerical_IK(IDRA, X, "123",[-2;0;4;0.6;0]);
[T1,p1] = FK(IDRA,Qn);
[tau] = Newton_Euler(IDRA,q,[0,0,0,0,0],[0,0,0,0,0],2,0.1,3.71);