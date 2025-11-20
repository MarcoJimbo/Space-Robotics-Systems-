function [L] = invTr(T)
% This function computes the inverse transformation matrix starting from
% the matrix T.
% 
% INPUT
% Transformation matrix T from i to i-1
% 
% OUTPUT
% inverse of the transformation matrix T that will go from i-1 to i

X = T(1:3,4);
R = T(1:3,1:3);

L(1:3,1:3) = R';
L(1:3,4) = -R' * X;
L(4,4) = 1;

end