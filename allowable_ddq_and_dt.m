function [ddtheta_max,dt] = allowable_ddq_and_dt(ddtheta_max,theta)

N = lenght(ddtheta_max);
for i = 1:N
    dt =