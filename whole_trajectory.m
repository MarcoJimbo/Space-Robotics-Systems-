function [q,dq,ddq] = whole_trajectory(theta,dtheta,ddtheta,t,t_b,t_jk,show)
% la funzione ricostruisce l'andamento della traiettoria nel tempo
% assumendo un profilo trapezoidale per la velocità e la plotta
% INPUT
%
% theta              vettore delle coordinate angolari nel tempo           (vettore Nx1)          
% dtheta             vettore delle velocità nelle fasi lineari             (vettore N-1x1)
% ddtheta            vettore delle accelerazioni nei tratti parabolici     (vettore Nx1)        
% t                  vettore dei nodi temporali                            (vettore Nx1)
% t_b                vettore contenente le durate dei periodi di blend     (vettore Nx1)
% t_kj               vettore contenente le durate dei periodi lineari      (vettore N-1x1)
% show               valore logico, se 1 la funzione plotta i risultati    (logico, 1 o 0)
%
% OUTPUT
% q, dq, ddq         vettori di angoli, velocità e accelerazione del giunto
%                    il numero di elementi dipende dalla variabile n_plot
%                    che per il momento è 'hard coded' (va modificata da
%                    dentro la function)


N = length(theta);
n_plot = 100;
q = [];
dq = [];
ddq = [];
t_span = [];
% Primo tratto
% blending period
tb1_start = t(1);
tb1_end = tb1_start + t_b(1);
tb1_span = linspace(tb1_start,tb1_end,n_plot);
ddq_b1 = ddtheta(1) * ones(1,n_plot);
dq_b1 = ddq_b1 .* (tb1_span - tb1_start);
q_b1 = theta(1) + ddtheta(1) * (tb1_span - tb1_start).^2 * 0.5;
% periodo lineare
tl1_start = tb1_end;
tl1_end = tl1_start + t_jk(1);
tl1_span = linspace(tl1_start,tl1_end,n_plot);
ddq_l1 = zeros(1,n_plot);
dq_l1  = dtheta(1) * ones(1,n_plot);
q_l1 = q_b1(end) + dtheta(1) * (tl1_span - tl1_start);

q = [q q_b1 q_l1]; dq = [dq dq_b1 dq_l1]; ddq = [ddq ddq_b1 ddq_l1];
t_span = [tb1_span tl1_span];

% punti intermedi
for i = 2:N-1
    % blending period
    tb_start = t_span(end);
    tb_end = tb_start + t_b(i);
    tb_span = linspace(tb_start,tb_end,n_plot);
    ddq_b = ddtheta(i) * ones(1,n_plot);
    dq_b = dtheta(i-1) + ddq_b .* (tb_span - tb_start);
    q_b = q(end) + dtheta(i-1) * (tb_span-tb_start) + ddtheta(i) * (tb_span-tb_start).^2 * 0.5;
    % periodo lineare
    tl_start = tb_end;
    tl_end = tl_start + t_jk(i);
    tl_span = linspace(tl_start,tl_end,n_plot);
    ddq_l = zeros(1,n_plot);
    dq_l  = dtheta(i)*ones(1,n_plot);
    q_l = q_b(end) + dtheta(i) * (tl_span-tl_start);
    
    q = [q q_b q_l]; dq = [dq dq_b dq_l]; ddq = [ddq ddq_b ddq_l];
    t_span = [t_span tb_span tl_span];
end

% ultimo tratto
tbN_start = t_span(end);
tbN_end = tbN_start + t_b(N);
tbN_span = linspace(tbN_start,tbN_end,n_plot);
ddq_bN = ddtheta(N) * ones(1,n_plot);
dq_bN = dtheta(N-1) + ddq_bN .* (tbN_span - tbN_start);
q_bN = q(end) + dtheta(N-1) * (tbN_span - tbN_start) + ddtheta(N) * (tbN_span - tbN_start).^2 * 0.5;

q = [q q_bN]; dq = [dq dq_bN]; ddq = [ddq ddq_bN];
t_span = [t_span tbN_span];

if show
   subplot(1,3,1)
   plot(t_span,q,'LineWidth',3,'Color','b')
   subplot(1,3,2)
   plot(t_span,dq,'LineWidth',3,'Color','r')
   subplot(1,3,3)
   plot(t_span,ddq,'LineWidth',3,'Color','g')
end

end