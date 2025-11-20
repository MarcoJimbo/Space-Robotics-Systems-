function [R] = rotm(phi,axis)
% The function computes the rotation matrix from link i to i-1
%
% INPUT
% the rotation angle phi (scalar)
% the rotation axis x,y,z (string)
%
% OUTPUT
% The transformation matrix from i to i-1

switch axis
    case 'x'
        R = [1 0 0; ...
             0 cos(phi) -sin(phi);...
             0 sin(phi) cos(phi)];
    case 'y'
        R = [cos(phi) 0 -sin(phi);...
                 0    1     0;    ...
             sin(phi) 0  cos(phi)]; 
    case 'z'
        R = [cos(phi) -sin(phi) 0;...
             sin(phi)  cos(phi) 0;...
               0       0        1];
end

end