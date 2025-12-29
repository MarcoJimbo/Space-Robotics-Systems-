function [q,dq,ddq] = whole_trajectory(theta,dtheta,ddtheta,dt,t_b,t_jk,f_sample,plt)
% la funzione ricostruisce l'andamento della traiettoria nel tempo
% assumendo un profilo trapezoidale per la velocità e la plotta
% INPUT
%
% theta              matrice delle coordinate angolari nel tempo           (matrice MxN)          
% dtheta             matrice delle velocità nelle fasi lineari             (matrice MxN-1)
% ddtheta            matrice delle accelerazioni nei tratti parabolici     (matrice MxN)        
% dt                 durata dei tratti                                     (scalare)
% t_b                matrice contenente le durate dei periodi di blend     (matrice MxN)
% t_kj               matrice contenente le durate dei periodi lineari      (matrice MxN-1)
% f_sample           frequenza di campionamento della traiettoria          (scalare)
% plt                valore logico, se 1 la funzione plotta i risultati
%
% OUTPUT
% q, dq, ddq         matrici di angoli, velocità e accelerazione del giunto

[M,N] = size(theta);
dt_sample = 1/f_sample;
t_end = (N-1)*dt;
qb0 = theta(:,1);
dqb0 = zeros(M,1);
ql0 = qb0 + dqb0 .* t_b(:,1) + ddtheta(:,1) .* t_b(:,1).^2 * 0.5;
q = cell(M,1);
dq = cell(M,1);
ddq = cell(M,1);
for j = 1:M
    i = 1;
    t_curr = 0;
    ti_start = 0;
    while i < N
        ti_blend = ti_start + t_b(j,i);
        ti_end = ti_start + t_b(j,i) + t_jk(j,i);
        if t_curr < ti_blend
            ddqb = ddtheta(j,i);
            dqb =  dqb0(j) + ddqb * (t_curr - ti_start); 
            qb =  qb0(j) + dqb0(j) * (t_curr - ti_start) + ddqb * (t_curr - ti_start)^2 * 0.5;
            q{j} = [q{j} qb];    dq{j} = [dq{j} dqb];   ddq{j} = [ddq{j} ddqb];
            t_curr = t_curr + dt_sample;
        elseif t_curr >= ti_blend && t_curr < ti_end
            ddql =  0;
            dql  =  dtheta(j,i);
            ql =  ql0(j) + dql * (t_curr- ti_blend);
            q{j} = [q{j} ql];    dq{j} = [dq{j} dql];   ddq{j} = [ddq{j} ddql];
            t_curr = t_curr + dt_sample;
        else
            qb0(j)  = ql0(j) + dql * t_jk(j,i);
            dqb0(j) = dtheta(j,i);
            ql0(j)  = qb0(j) + dqb0(j) * t_b(j,i+1) + ddtheta(j,i+1) * t_b(j,i+1)^2 * 0.5;
            i = i+1;
            ti_start = t_curr;        
        end
    end
end
% ultimo tratto di blend
for j = 1:M
    while t_curr < t_end
    ddqb = ddtheta(j,N);
    dqb =  dqb0(j) + ddqb * (t_curr - ti_start);                         
    qb =  qb0(j) + dqb0(j) * (t_curr - ti_start) + ddqb * (t_curr - ti_start).^2 * 0.5;    
    q{j} = [q{j} qb];    dq{j} = [dq{j} dqb];   ddq{j} = [ddq{j} ddqb];
    t_curr = t_curr + dt_sample;
    end
end
t_vec = 0:dt_sample:t_curr;
if plt
    for i = 1:M
        figure(i)
        subplot(1,3,1)
        plot(t_vec(1:end),q{i},'r')
        subplot(1,3,2)
        plot(t_vec(1:end),dq{i},'b')
        subplot(1,3,3)
        plot(t_vec(1:end),ddq{i},'g') 
    end
end