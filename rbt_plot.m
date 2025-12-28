function rbt_plot(rbt,q,varargin)
% La function fa in modo di visualizzare il manipolatore in una certa
% configurazione
%
% INPUT
% rbt                        struttura che descriva il manipolatore        (struct)
% q                          vettore delle coordinate dei giunti           (vettore nx1)
% varargin{1}                colore del manipolatore                       (stringa)
% varargin{2}                environment del manipolatore                  (cella)
%
% OUTPUT
% plot del manipolatore nella configurazione specificata


n = rbt.joints_number;
pos = zeros(n+1,3);
T = eye(4);
color = 'r';
env = {};

% controllo input
if nargin >= 4, color = varargin{1}; env = varargin{2}; end
if nargin >= 3, color = varargin{1}; end

% plot
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
    pos(i,:) = T(1:3,4)';
end
% End Effector
T = T*MDH2tr(rbt.end_effector.MDH.theta,rbt.end_effector.MDH.d,rbt.end_effector.MDH.alpha,rbt.end_effector.MDH.a);
pos(end,:) = T(1:3,4)';
hold on; grid on; axis equal;
plot3(pos(:,1), pos(:,2), pos(:,3), '-o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerFaceColor', color,'Color',color);

if ~isempty(env), show(env{1}), show(env{2}), end

xlabel('X'); ylabel('Y'); zlabel('Z');
view(3);
