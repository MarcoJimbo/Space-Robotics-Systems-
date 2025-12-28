function [T] = translation2tr(X)
% The function computes the transformation matrix from link i to i-1
% when the relation between the two frames is one of pure translation
%
% INPUT
% Translation vector X (it's the position of frame i wrt frame i-1)
%
% OUTPUT
% The transformation matrix from i to i-1

T = eye(4);

if size(X,2) == 1
   T(1:3,4) = X;
else
   T(1:3,4) = X';
end