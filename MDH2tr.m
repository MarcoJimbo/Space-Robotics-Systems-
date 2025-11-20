function [T] = MDH2tr(theta,d,alpha,a)
% The function computes the transformation matrix from link i to i-1
% starting from the Modified Denavit-Hartenberg parameters. The vectors
% multiplied by this transformation matrix are expressed in the r.f. i-1 as
% a result.
%
% INPUT
% the modified DH parameters theta_i, d_i, alpha_(i-1) and a_(i-1)
%
% OUTPUT
% The transformation matrix from i to i-1

T = [cos(theta)           -sin(theta)            0           a;            ...
    sin(theta)*cos(alpha) cos(theta)*cos(alpha) -sin(alpha) -sin(alpha)*d; ...
    sin(theta)*sin(alpha) cos(theta)*sin(alpha)  cos(alpha)  cos(alpha)*d; ...
    0                     0                      0                      1];

end