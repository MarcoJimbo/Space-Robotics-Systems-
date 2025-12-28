function [T,p] = FK_symbolic2(rbt,q,varargin)

n_joints = rbt.joints_number;
j = [rbt.joints; rbt.end_effector];
T = sym(eye(4));

if isempty(varargin)
    n = n_joints + 1;
else
    joint_name = varargin{1};
    n = n_joints + 1;
    for i = 1:n_joints+1
        if strcmp(j(i).name,joint_name)
            n = i;
            break;
        end
    end
end

for i = 1:n
    a     = toSym(j(i).MDH.a);
    alpha = toSym(j(i).MDH.alpha);

    if strcmp(j(i).type,'revolute')
        theta = q(i);
        d     = toSym(j(i).MDH.d);
    elseif strcmp(j(i).type,'prismatic')
        theta = toSym(j(i).MDH.theta);
        d     = q(i);
    else % fixed
        theta = sym(0);
        d     = sym(0);
    end

    T = T * MDH2tr(theta,d,alpha,a);
end

p = T(1:3,4);

end



function y = toSym(x)
    if isa(x,'sym')
        y = x;
    elseif isnumeric(x)
        y = sym(x);
    elseif isstring(x) || ischar(x)
        y = str2sym(x);   % gestisce "-pi/2", "L2", "0.7", ecc.
    else
        error("toSym: tipo non gestito (%s)", class(x));
    end
end
