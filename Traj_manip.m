% Analisi manipolabilità nella traiettoria
load('q_trajA.mat'); q_A = q_trajA(2:end,:);
load('q_trajB.mat'); q_B = q_trajB(2:end,:);
plot_ellipse = false;
IDRA = jsondecode(fileread("IDRA.json"));  
a = size(q_trajA,2);
b = size(q_trajB,2);
w = zeros(a + b,1);
q_C = [q_A q_B];
for i = 1:a + b
    [~,w(i)] = manip_ellips(IDRA,q_C(:,i),'linear',false);
end
title('Manipulability w along trajectory')
plot([q_trajA(1,:) q_trajB(1,:)],w,'LineWidth',2,'Color','g')
xlabel('time [s]')
ylabel('w')
grid on


if plot_ellipse
    q_traj = [q_A q_B];
    type = 'linear';
    idx = [1, 3];
    theta = linspace(0, 2*pi, 100);
    circle = [cos(theta); sin(theta)];
    n = size(q_traj,2);
    for i = 1:1180:n
        q = q_traj(:,i);
        semi_axes = manip_ellips(IDRA, q, type, false);
        M = semi_axes * semi_axes';   
        M_xz = M(idx, idx);
        [V, D] = eig(M_xz);
        ellipse_2d = V * sqrt(D) * circle;
        [~, p] = FK(IDRA, q);
        hold on;
        fill3(ellipse_2d(1,:) + p(1), ...
              zeros(size(theta)), ...
              ellipse_2d(2,:) + p(3), ...
              'c', 'FaceAlpha', 0.2, 'EdgeColor', 'k', 'LineWidth', 2);
        rbt_plot(IDRA,q,'r');
    end 
plot_rover
end
