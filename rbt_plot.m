function rbt_plot(rbt,q,color)
% La function fa in modo di visualizzare il manipolatore in una certa
% configurazione
%
% INPUT
% file .json che descriva il manipolatore
% vettore delle coordinate dei giunti
% colore del manipolatore
%
% OUTPUT
% plot del manipolatore nella configurazione specificata

rbt = jsondecode(fileread(rbt));
n = rbt.joints_number;
j = rbt.joints;
joint_pos = zeros(n,3);
T = eye(4);
for i = 1:n
    j = rbt.joints(i);
    if strcmp(j.type, 'revolute')
       theta = q(i);
       d = j.MDH.d;
    else
       d = q(i);
       theta = j.MDH.theta;
    end
    T = T * MDH2tr(theta,d,j.MDH.alpha,j.MDH.a);
    joint_pos(i,:) = T(1:3,4)';
end

figure; hold on; grid on; axis equal;
plot3(joint_pos(:,1), joint_pos(:,2), joint_pos(:,3), '-o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerFaceColor', 'r','Color',color);

xlabel('X'); ylabel('Y'); zlabel('Z');
title('Manipolatore 3D');
view(3);
