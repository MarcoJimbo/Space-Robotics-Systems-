function [env] = setObstacles(T)

% Input:
% T: matrice di trasformazione Station --> Base

% Output:
% env: enviroment of obstacles

    % Rover body
    Rover = collisionBox(1,0.5,0.5);                                     % creazione dell'ostacolo wrt Station
    Rover_Pose = [ 1 , 0 , 0 , 0;...
               0 , 1 , 0 , 0;...
               0 , 0 , 1 , 0;...
               0 , 0 , 0 , 1];
    Rover.Pose = T * Rover_Pose ;                                         % ostacolo wrt Base

    

    % Pavimento

    Suolo = collisionBox(2,1,0.001);                                     % creazione dell'ostacolo wrt Station
    Suolo_Pose = [ 1 , 0 , 0 , 0;...
                   0 , 1 , 0 , 0;...
                   0 , 0 , 1 , -0.9495;...
                   0 , 0 , 0 , 1];
    Suolo.Pose = T * Suolo_Pose ;                                         % ostacolo wrt Base
    
    % creazione dell'enviroment
    env = {Rover,Suolo};
    
   
end