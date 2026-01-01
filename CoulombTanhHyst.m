function [tau_c, s] = CoulombTanhHyst(qd, tauC, vs, v_on, v_off)
% CoulombTanhHyst
%   Coulomb smussato (tanh) + isteresi sul segno (Schmitt trigger).
%
% INPUT:
%   qd    : [n x 1] velocità di giunto (rad/s)
%   tauC  : [n x 1] o scalar, Coulomb (N*m)
%   vs    : [n x 1] o scalar, scala tanh (rad/s)
%   v_on  : [n x 1] o scalar, soglia per AGGANCIARE il segno (rad/s)
%   v_off : [n x 1] o scalar, soglia per andare a ZERO (rad/s)  (v_off <= v_on)
%
% OUTPUT:
%   tau_c : [n x 1] coppia attrito Coulomb smussata (N*m)
%   s     : [n x 1] stato segno con isteresi (-1,0,+1)

% --- espansione scalari -> vettori
n = numel(qd);
if isscalar(tauC),  tauC  = repmat(tauC,  n, 1); end
if isscalar(vs),    vs    = repmat(vs,    n, 1); end
if isscalar(v_on),  v_on  = repmat(v_on,  n, 1); end
if isscalar(v_off), v_off = repmat(v_off, n, 1); end

% --- protezioni minime
vs    = max(vs,    1e-12);
v_on  = max(v_on,  0);
v_off = max(v_off, 0);
% garantisci v_off <= v_on
v_off = min(v_off, v_on);

% --- memoria dello stato segno (Simulink-friendly)
persistent s_prev init
if isempty(init)
    s_prev = zeros(n,1);
    init = true;
end
if ~isequal(size(s_prev), [n 1])
    s_prev = zeros(n,1);
end

% --- aggiornamento isteresi (per ogni giunto)
s = s_prev;

for i = 1:n
    if qd(i) >= v_on(i)
        s(i) = 1;
    elseif qd(i) <= -v_on(i)
        s(i) = -1;
    elseif abs(qd(i)) <= v_off(i)
        s(i) = 0;
    else
        % zona di isteresi: mantieni il segno precedente
        s(i) = s_prev(i);
    end
end

s_prev = s;

% --- tanh sulla magnitudine, segno deciso dall'isteresi
tau_c = s .* tauC .* tanh(abs(qd) ./ vs);

end