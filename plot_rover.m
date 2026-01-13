function plot_rover
% La function plotta il rover, un parallelepipedo di dimensioni 1 x 0.5 x 0.5

% limiti del rover
x_lim = [-1, 0];      
y_lim = [-0.25, 0.25];
z_lim = [-0.5, 0];    

% vertici del rover
v = [x_lim(1) y_lim(1) z_lim(1); % 1
     x_lim(2) y_lim(1) z_lim(1); % 2
     x_lim(2) y_lim(2) z_lim(1); % 3
     x_lim(1) y_lim(2) z_lim(1); % 4
     x_lim(1) y_lim(1) z_lim(2); % 5
     x_lim(2) y_lim(1) z_lim(2); % 6
     x_lim(2) y_lim(2) z_lim(2); % 7
     x_lim(1) y_lim(2) z_lim(2)];% 8

% facce del rover
f = [1 2 3 4; % Base inferiore
     5 6 7 8; % Base superiore
     1 2 6 5; % Faccia laterale 1
     2 3 7 6; % Faccia frontale (su piano ZY)
     3 4 8 7; % Faccia laterale 2
     4 1 5 8];% Faccia posteriore

% plot rover
hold on
patch('Vertices', v, 'Faces', f, ...
      'FaceColor', [1 0.42 0.42], ...
      'EdgeColor', 'k', ...
      'LineWidth', 1, ...
      'FaceAlpha', 1);

view(3);
grid on;
axis equal;
