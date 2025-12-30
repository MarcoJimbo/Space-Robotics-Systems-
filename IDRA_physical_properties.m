%%% physical properties of IDRA


clear; close all; clc; format long

% density [kg/m^3] Alluminio
density = 2700;

%% Link 1 (fictitious null link)

L1 = 0;
M1 = 0;
I1_x = 0;
I1_y = 0;
I1_z = 0;


%% Link 2

% radii [m]
R2_e = 5*10^-2; 
R2_i = 4.5*10^-2;
% lenght [m]
L2 = 70*10^-2;

%% Link 3

% radii [m]
R3_e = 5*10^-2; 
R3_i = 4.5*10^-2;
% lenght [m]
L3 = 50*10^-2;

%% Link 4

% radii [m]
R4_e = 5*10^-2; 
R4_i = 4.5*10^-2;
% lenght [m]
L4 = 20*10^-2;

%% Link 5

% radii [m]
R5_e = 5*10^-2; 
R5_i = 4.5*10^-2;
% lenght [m]
L5 = 20*10^-2;

%% volumes [m^3]

V2 = pi*(R2_e^2 - R2_i^2) * L2;
V3 = pi*(R3_e^2 - R3_i^2) * L3;
V4 = pi*(R4_e^2 - R4_i^2) * L4;
V5 = pi*(R5_e^2 - R5_i^2) * L5;

%% masses [kg]
M2 = V2 * density;
M3 = V3 * density;
M4 = V4 * density;
M5 = V5 * density;
M = M1 + M2 + M3 + M4 + M5

%% Inertia [kg*m^2]
I2_x = M2 / 2 * ( R2_e^2 - R2_i^2 );
I3_x = M3 / 2 * ( R3_e^2 - R3_i^2 );
I4_x = M4 / 2 * ( R4_e^2 - R4_i^2 );
I5_x = M5 / 2 * ( R5_e^2 - R5_i^2 );

I2_y = pi*L2*density / 12 * ( 3*R2_e^4 + R2_e^2*L2^2 - 3*R2_i^4 - R2_i^2*L2^2 );
I3_y = pi*L3*density / 12 * ( 3*R3_e^4 + R3_e^2*L3^2 - 3*R3_i^4 - R3_i^2*L3^2 );
I4_y = pi*L4*density / 12 * ( 3*R4_e^4 + R4_e^2*L4^2 - 3*R4_i^4 - R4_i^2*L4^2 );
I5_y = pi*L5*density / 12 * ( 3*R5_e^4 + R5_e^2*L5^2 - 3*R5_i^4 - R5_i^2*L5^2 );

I2_z = I2_y;
I3_z = I3_y;
I4_z = I4_y;
I5_z = I5_y;