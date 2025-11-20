function [Ni] = velTr(X,R)
% The function computes the velocity transformation matrix from link i to i+1
% starting from the position of frame i+1 expressed in frame i and the
% rotation matrix from frame i+1 to frame i.
%
% INPUT
% R from i+1 to i
% X position of frame i+1 wrt frame i
%
% OUTPUT
% The transformation matrix from i+1 to i

Xvec = [0 -X(3) X(2); X(3) 0 -X(1); -X(2) X(1) 0];
Ni = zeros(6,6);
Ni(1:3,1:3) = R;
Ni(3:6,3:6) = R;
Ni(1:3,3:6) = -R*Xvec;

end