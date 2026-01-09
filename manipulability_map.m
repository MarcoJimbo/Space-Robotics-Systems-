function manipulability_map(rbt,n,varargin)
%% MANIPULABILITY MAP %%
if nargin > 2, plot_robot = varargin{1}; conf = varargin{2}; end 
% limits
q1 = linspace(-pi, pi, n);
q2 = linspace(-pi, pi, n);
q3 = linspace(-pi, pi, n);
q4 = linspace(-pi, pi, n);
q5 = linspace(-pi, pi, n);

W = [];
X = [];
Z = [];

for i = 1:15
    for j = 1:15
        for k = 1:15
            for l = 1:15
                
                q = [q1; q2(i); q3(j); q4(k); q5(l)];
                % Cinematica diretta
                [~,p] = FK(rbt,q);
                % Jacobiano
                J = geomJacobian(rbt,q);
                Jp = J(1:3,:);
            
                % Manipolabilità
                sv = svd(Jp);
                w = prod(sv);
                if p(1) > 0 || p(1) < -1 || p(3) > 0 || p(3) < -0.5
                X(end+1) = p(1);
                Z(end+1) = p(3);
                W(end+1) = w;
                end
            end
        end
    end
end
Y = zeros(1,length(X));
scatter3(X, Y, Z, 15, W, 'filled')
colormap jet
colorbar
axis equal
if plot_robot
hold on
% plot robot
rbt_plot(rbt,conf,'k');
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