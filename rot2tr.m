function [T] = rot2tr(phi,axis)
% The function computes the transformation matrix from link i to i-1
% if the relation between the two reference frames is that of pure
% rotation about one axis.
%
% INPUT
% the rotation angle phi (scalar)
% the rotation axis x,y,z (string)
%
% OUTPUT
% The transformation matrix from i to i-1

T = zeros(4,4);
T(4,4) = 1;
R = rotm(phi,axis);
T(1:3,1:3) = R;