function [env] = setObstacles(T)

% Input:
% T: matrice di trasformazione Station --> Base

% Output:
% env: enviroment of obstacles

    % Rover body
    env(1).name = "Rover";
    env(1).dims = [1, 0.5, 0.5];   % [Lx Ly Lz]
    Rover_Pose = eye(4);
    env(1).Pose = T * Rover_Pose;

    % Suolo
    env(2).name = "Suolo";
    env(2).dims = [2, 1, 0.001];
    Suolo_Pose = [ 1 , 0 , 0 , 0;...
                   0 , 1 , 0 , 0;...
                   0 , 0 , 1 , -0.9495;...
                   0 , 0 , 0 , 1];
    env(2).Pose = T * Suolo_Pose;
   
end