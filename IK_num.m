function [Qbest, info] = IK_num(rbt, X, xyz, varargin)
%IK_num  IK numerica 5DOF-friendly con least-squares + multistart.
% Asse puntante: X dell'end-effector (colonna 1 della R).
%
% Residual (PESATO):
%   r = [ wPos*(p_fk - p_des) ;
%         wOri*cross(x_fk, x_des) ;
%         wDot*(1 - dot(x_fk, x_des)) ]
%
% HARD REJECT:
%   se RequireForward=true e dot(x_fk,x_des) < DotMin => scarta soluzione
%
% Errori separati (NON pesati):
%   ePos  = norm(p_fk - p_des)
%   eOri  = atan2(norm(cross(x_fk,x_des)), dot(x_fk,x_des))   [rad]
%   d     = dot(x_fk,x_des)
%
% NAME-VALUE extra:
%   'RequireForward' : true/false (default true)
%   'DotMin'         : soglia su dot, default 0 (no flip, max 90°)
%   'EarlyStopRes'   : se bestResidual < EarlyStopRes interrompe (default 0)
%   'KeepN'          : numero di migliori soluzioni UNICHE da salvare (default 10)
%   'MinSep'         : separazione minima (rad) per deduplicare (default 1e-3)
%   'SaveAll'        : salva tutte le soluzioni (default true)
%
% OUTPUT:
%   Qbest : migliore (wrap in [-pi,pi])
%   info  : diagnostica completa + lista soluzioni

% ---- parse inputs
n = rbt.joints_number;

p = inputParser;
p.addParameter('q0', zeros(n,1), @(v)isnumeric(v) && numel(v)==n);
p.addParameter('Nstarts', 30, @(v)isnumeric(v) && isscalar(v) && v>=1);
p.addParameter('UseSeedFirst', true, @(v)islogical(v) && isscalar(v));
p.addParameter('wPos', 1, @(v)isnumeric(v) && isscalar(v) && v>0);
p.addParameter('wOri', 0.2, @(v)isnumeric(v) && isscalar(v) && v>=0);
p.addParameter('wDot', 0.2, @(v) isempty(v) || (isnumeric(v) && isscalar(v) && v>=0));
p.addParameter('Tol', 1e-10, @(v)isnumeric(v) && isscalar(v) && v>0);
p.addParameter('MaxIter', 200, @(v)isnumeric(v) && isscalar(v) && v>=1);
p.addParameter('MaxFunEvals', 4000, @(v)isnumeric(v) && isscalar(v) && v>=1);
p.addParameter('Seed', [], @(v) isempty(v) || (isnumeric(v) && isscalar(v)));

% hard reject options
p.addParameter('RequireForward', true, @(v)islogical(v) && isscalar(v));
p.addParameter('DotMin', 0, @(v)isnumeric(v) && isscalar(v) && v>=-1 && v<=1);
p.addParameter('EarlyStopRes', 0, @(v)isnumeric(v) && isscalar(v) && v>=0);

% saving / selection options
p.addParameter('KeepN', 10, @(v)isnumeric(v) && isscalar(v) && v>=1);
p.addParameter('MinSep', 1e-3, @(v)isnumeric(v) && isscalar(v) && v>=0);
p.addParameter('SaveAll', true, @(v)islogical(v) && isscalar(v));

p.parse(varargin{:});
opt = p.Results;

if isempty(opt.wDot)
    opt.wDot = opt.wOri;   % default sensato
end
if ~isempty(opt.Seed)
    rng(opt.Seed);
end

% ---- desired position
pdes = X(1:3);

% ---- desired orientation (COERENTE con xyz)
Rdes = eul2R(X(4:6), xyz);

% asse puntante desiderato = X
xdes = Rdes(:,1);
xdes = xdes / max(norm(xdes), eps);

% ---- bounds (stabilità numerica)
lb = -pi*ones(n,1);
ub =  pi*ones(n,1);

% ---- solver options
haveLSQ = exist('lsqnonlin','file') == 2;
if haveLSQ
    opts = optimoptions('lsqnonlin', ...
        'Display','off', ...
        'FunctionTolerance', opt.Tol, ...
        'StepTolerance', opt.Tol, ...
        'OptimalityTolerance', opt.Tol, ...
        'MaxIterations', opt.MaxIter, ...
        'MaxFunctionEvaluations', opt.MaxFunEvals, ...
        'Algorithm','trust-region-reflective');
end

% ---- multistart initial guesses
qStarts = zeros(n, opt.Nstarts);
if opt.UseSeedFirst
    qStarts(:,1) = opt.q0(:);
    for k = 2:opt.Nstarts
        qStarts(:,k) = (2*rand(n,1)-1)*pi;
    end
else
    for k = 1:opt.Nstarts
        qStarts(:,k) = (2*rand(n,1)-1)*pi;
    end
end

% ---- storage (tutte le soluzioni)
qAll       = nan(n, opt.Nstarts);
allRes     = nan(1, opt.Nstarts);
allExit    = nan(1, opt.Nstarts);
allPosErr  = nan(1, opt.Nstarts);
allOriErr  = nan(1, opt.Nstarts);
allDot     = nan(1, opt.Nstarts);
allRejected= false(1, opt.Nstarts);

% ---- run starts, keep best
bestRes = inf;
Qbest = nan(n,1);
bestExitflag = NaN;
bestIdx = NaN;

for k = 1:opt.Nstarts
    q0k = qStarts(:,k);

    if haveLSQ
        try
            [qk, resnorm, ~, exitflag] = lsqnonlin(@residual, q0k, lb, ub, opts);
        catch
            [qk, resnorm, exitflag] = fallback_fminsearch(q0k);
        end
    else
        [qk, resnorm, exitflag] = fallback_fminsearch(q0k);
    end

    % wrap subito per coerenza e dedup
    qk = atan2(sin(qk), cos(qk));

    % errori separati + dot
    [ePos_k, eOri_k, d_k] = errors_separati(qk);

    % HARD REJECT
    rejected = false;
    if opt.RequireForward && (d_k < opt.DotMin)
        rejected = true;
        resnorm = inf; % non può diventare best
    end

    % salva sempre (se SaveAll=true; altrimenti salva comunque minimi per ranking)
    if opt.SaveAll
        qAll(:,k) = qk;
    end

    allRes(k)      = resnorm;
    allExit(k)     = exitflag;
    allPosErr(k)   = ePos_k;
    allOriErr(k)   = eOri_k;
    allDot(k)      = d_k;
    allRejected(k) = rejected;

    if resnorm < bestRes
        bestRes = resnorm;
        Qbest = qk;
        bestExitflag = exitflag;
        bestIdx = k;

        if opt.EarlyStopRes > 0 && bestRes < opt.EarlyStopRes
            break;
        end
    end
end

allFailed = isinf(bestRes) || any(isnan(Qbest));

% ---- costruisci lista migliori soluzioni UNICHE (tra quelle non rifiutate)
accepted = (~allRejected) & isfinite(allRes);

idxAcc = find(accepted);
[~, ord] = sort(allRes(idxAcc), 'ascend');
idxSorted = idxAcc(ord);

% Dedup con distanza angolare (periodica)
keepIdx = [];
keepQ   = [];

for ii = 1:numel(idxSorted)
    k = idxSorted(ii);

    if ~opt.SaveAll
        % se SaveAll=false, qAll non è piena: rigenera qk “al volo” non possibile.
        % quindi in quel caso forziamo SaveAll=true (oppure salviamo sempre qk).
        % Qui facciamo semplice: salviamo comunque qAll sempre.
    end

    qk = qAll(:,k);
    if any(isnan(qk))
        continue
    end

    if isempty(keepQ)
        keepIdx = k;
        keepQ = qk;
    else
        % distanza minima da tutte le già tenute
        isFar = true;
        for jj = 1:size(keepQ,2)
            dq = angdiff(qk, keepQ(:,jj));
            if norm(dq) < opt.MinSep
                isFar = false;
                break
            end
        end
        if isFar
            keepIdx(end+1) = k; %#ok<AGROW>
            keepQ(:,end+1) = qk; %#ok<AGROW>
        end
    end

    if numel(keepIdx) >= opt.KeepN
        break
    end
end

% se non c’è Qbest (tutto rejected), lascia NaN
if ~allFailed
    Qbest = atan2(sin(Qbest), cos(Qbest));
end

% best errors separati (se valido)
if ~allFailed
    [bestPosErr, bestOriErr, bestDot] = errors_separati(Qbest);
else
    bestPosErr = NaN; bestOriErr = NaN; bestDot = NaN;
end

% ---- info
info = struct();
info.bestResidual    = bestRes;
info.bestExitflag    = bestExitflag;
info.bestIdxStart    = bestIdx;
info.bestPosErr      = bestPosErr;
info.bestOriErr      = bestOriErr;
info.bestDot         = bestDot;

info.qStarts         = qStarts;

info.qAll            = qAll;          % tutte le soluzioni (wrap), size n x Nstarts
info.allResiduals    = allRes;
info.allExitflags    = allExit;
info.allPosErrs      = allPosErr;
info.allOriErrs      = allOriErr;
info.allDots         = allDot;
info.allRejected     = allRejected;

info.acceptedMask    = accepted;

% lista migliori (ordinate, uniche)
info.bestListIdx     = keepIdx;       % indici dei multistart corrispondenti
info.bestListQ       = keepQ;         % size n x Nkeep
info.bestListRes     = allRes(keepIdx);
info.bestListPosErr  = allPosErr(keepIdx);
info.bestListOriErr  = allOriErr(keepIdx);
info.bestListDot     = allDot(keepIdx);
info.bestListExit    = allExit(keepIdx);

info.Nstarts         = opt.Nstarts;
info.wPos            = opt.wPos;
info.wOri            = opt.wOri;
info.wDot            = opt.wDot;
info.xyz             = xyz;
info.RequireForward  = opt.RequireForward;
info.DotMin          = opt.DotMin;
info.KeepN           = opt.KeepN;
info.MinSep          = opt.MinSep;
info.allFailed       = allFailed;

% =================== nested functions ===================

    function r = residual(q)
        [Tfk,~] = FK(rbt, q);
        pfk = Tfk(1:3,4);

        xfk = Tfk(1:3,1);
        xfk = xfk / max(norm(xfk), eps);

        d = max(-1, min(1, dot(xfk, xdes)));

        rpos = opt.wPos * (pfk - pdes);
        rori = opt.wOri * cross(xfk, xdes);
        rdot = opt.wDot * (1 - d);

        r = [rpos; rori; rdot];
    end

    function [ePos, eOri, d] = errors_separati(q)
        [Tfk,~] = FK(rbt, q);
        pfk = Tfk(1:3,4);

        xfk = Tfk(1:3,1);
        xfk = xfk / max(norm(xfk), eps);

        ePos = norm(pfk - pdes);

        c = cross(xfk, xdes);
        d = max(-1, min(1, dot(xfk, xdes)));
        eOri = atan2(norm(c), d);
    end

    function [qsol, resnorm, exitflag] = fallback_fminsearch(q0)
        f = @(qq) sum(residual(qq).^2);
        optsFS = optimset('Display','off', ...
                          'MaxIter', opt.MaxIter, ...
                          'MaxFunEvals', opt.MaxFunEvals);
        [qsol, fval, exitflag] = fminsearch(f, q0, optsFS);
        resnorm = fval;
    end

    function d = angdiff(a, b)
        % differenza angolare per giunti rotativi (periodica)
        d = atan2(sin(a-b), cos(a-b));
    end

end
