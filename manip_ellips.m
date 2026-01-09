function semi_axes = manip_ellips(rbt,q,type,plot_robot)

Jfull = geomJacobian(rbt, q);
switch type
    case 'linear'
          J = Jfull(1:3, :); 
    case 'angular'
          J = Jfull(4:6,:);
end
[U, S, ~] = svd(J);
semi_axes_lengths = diag(S);
semi_axes = U * S(1:3, 1:3);

% Generazione punti dell'ellissoide per il plot
[xe, ye, ze] = sphere(30);
points = [xe(:), ye(:), ze(:)] * S(1:3, 1:3);
rotated_points = points * U';

[~, p] = FK(rbt, q);
Ex = reshape(rotated_points(:,1), size(xe)) + p(1);
Ey = reshape(rotated_points(:,2), size(ye)) + p(2);
Ez = reshape(rotated_points(:,3), size(ze)) + p(3);

hold on;
surf(Ex, Ey, Ez,'FaceColor', 'cyan', 'EdgeColor', 'none', 'FaceAlpha', 0.3);

% Plot degli assi principali
colors = ['r', 'g', 'b'];
for i = 1:3
    axis_vec = U(:,i) * semi_axes_lengths(i);
    quiver3(p(1), p(2), p(3), axis_vec(1), axis_vec(2), axis_vec(3), ...
            'Color', colors(i), 'LineWidth', 2, 'MaxHeadSize', 0.5);
end
grid on; axis equal;

if plot_robot
% plot robot
rbt_plot(rbt,q,'k');
% plot rover
vx = [-1; 0; 0; -1];
vy = [0; 0; 0; 0];
vz = [0; 0; -0.5; -0.5];
patch('XData', vx, 'YData', vy, 'ZData', vz, ...
      'FaceColor', [0.5 0.5 0.5], ...
      'EdgeColor', 'k', ...
      'LineWidth', 1, ...
      'FaceAlpha', 1); 
view(3); 
grid on;
axis equal;
end
end