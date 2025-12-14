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
rbt_plot("IDRA.json",q,color,env)
title('HEIL IDRA');