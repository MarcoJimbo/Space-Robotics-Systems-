function [q,dq,ddq] = whole_trajectory(theta,dtheta,ddtheta,dt,t_b,t_jk)
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


N = length(theta);
f_sample = 200;
dt_sample = 1/f_sample;
t_end = (N-1)*dt;
t_vec = 0:dt_sample:t_end;
L = length(t_vec);

q = zeros(1,L);
dq = zeros(1,L);
ddq = zeros(1,L);

i = 1;
tic = 0;
ti_start = 0;
q(end) = theta(1);
while tic < t_end
    ti_blend = ti_start + t_b(i);
    ti_end = ti_start + t_b(i) + t_jk(i);
    if tic > ti_end
        i = i+1;
        ti_start = tic;
    end
    if tic < ti_blend
        ddqb = ddtheta(i);
        dqb =  ddqb * (tic - ti_start);
        qb =  q(end) + ddtheta(i) * (tic - ti_start).^2 * 0.5;
        q = [q qb];    dq = [dq dqb];   ddq = [ddq ddqb];
        tic = tic + dt_sample;
    elseif tic > ti_start + t_b(i) && tic < ti_end
        ddql =  0;
        dql  =  dtheta(i);
        ql =  q(end) + dtheta(i) * (t- ti_blend);
        q = [q ql];    dq = [dq dql];   ddq = [ddq ddql];
        tic = tic + dt_sample;
    end
 end
end