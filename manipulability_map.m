function manipulability_map(rbt,n,varargin)
%% MANIPULABILITY MAP %%
if nargin > 2, plot_robot = varargin{1}; conf = []; end
if nargin > 3, plot_robot = varargin{1}; conf = varargin{2}; end 
% limits
q1 = linspace(-pi, pi, n);
q2 = linspace(-pi, pi, n);
q3 = linspace(-pi, pi, n);
q4 = linspace(-pi, pi, n);
q5 = linspace(-pi, pi, n);

W = [];
X = [];
Z = [];

for i = 1:n
    for j = 1:n
        for k = 1:n
            for l = 1:n
                for m = 1:n
                q = [q1(m); q2(i); q3(j); q4(k); q5(l)];
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
end
Y = zeros(1,length(X));
scatter3(X, Y, Z, 15, W, 'filled')
colormap jet
colorbar
axis equal
if plot_robot
hold on
% plot robot
if ~isempty(conf)
rbt_plot(rbt,conf,'k');
end
% plot rover
plot_rover
end