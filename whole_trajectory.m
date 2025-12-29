function [q,dq,ddq] = whole_trajectory(theta,dtheta,ddtheta,dt,t_b,t_jk,plt)
% la funzione ricostruisce l'andamento della traiettoria nel tempo
% assumendo un profilo trapezoidale per la velocità e la plotta
% INPUT
%
% theta              vettore delle coordinate angolari nel tempo           (vettore Nx1)          
% dtheta             vettore delle velocità nelle fasi lineari             (vettore N-1x1)
% ddtheta            vettore delle accelerazioni nei tratti parabolici     (vettore Nx1)        
% dt                 durata dei tratti                                     (scalare)
% t_b                vettore contenente le durate dei periodi di blend     (vettore Nx1)
% t_kj               vettore contenente le durate dei periodi lineari      (vettore N-1x1)
%
% OUTPUT
% q, dq, ddq         vettori di angoli, velocità e accelerazione del giunto

[M,N] = size(theta);
f_sample = 200;
dt_sample = 1/f_sample;
t_end = (N-1)*dt;
t_vec = 0:dt_sample:t_end;

q = [];
dq = [];
ddq = [];

i = 1;
tic = 0;
ti_start = 0;
qb0 = theta(:,1);
dqb0 = zeros(M,1);
ql0 = qb0 + dqb0 * t_b(1) + ddtheta(:,1) * t_b(1)^2 * 0.5;
while tic <= t_end && i < N
    ti_blend = ti_start + t_b(i);
    ti_end = ti_start + t_b(i) + t_jk(i);
    if tic < ti_blend
        ddqb = ddtheta(:,i);
        dqb =  dqb0 + ddqb * (tic - ti_start); 
        qb =  qb0 + dqb0 * (tic - ti_start) + ddqb * (tic - ti_start)^2 * 0.5;
        q = [q qb];    dq = [dq dqb];   ddq = [ddq ddqb];
        tic = tic + dt_sample;
    elseif tic >= ti_blend && tic < ti_end
        ddql =  zeros(M,1);
        dql  =  dtheta(:,i);
        ql =  ql0 + dql * (tic- ti_blend);
        q = [q ql];    dq = [dq dql];   ddq = [ddq ddql];
        tic = tic + dt_sample;
    else
        qb0  = ql0 + dql * t_jk(i);
        dqb0 = dtheta(:,i);
        ql0  = qb0 + dqb0 * t_b(i+1) + ddtheta(:,i+1) * t_b(i+1)^2 * 0.5;
        i = i+1;
        ti_start = tic;        
    end
end
% ultimo tratto di blend

while tic < t_end
ddqb = ddtheta(:,N);
dqb =  dqb0 + ddqb * (tic - ti_start);                         
qb =  qb0 + dqb0 * (tic - ti_start) + ddqb * (tic - ti_start).^2 * 0.5;    
q = [q qb];    dq = [dq dqb];   ddq = [ddq ddqb];
tic = tic + dt_sample;
end
if plt
    for i = 1:size(theta,1)
        figure(i)
        subplot(1,3,1)
        plot(t_vec,q(i,:),'r')
        subplot(1,3,2)
        plot(t_vec,dq(i,:),'b')
        subplot(1,3,3)
        plot(t_vec,ddq(i,:),'g') 
    end
end