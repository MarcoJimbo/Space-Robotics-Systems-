function [q,status] = numericalIK(rbt,X,xyz,q0,varargin)
% Questa function risolve numericamente la cinematica inversa di un
% manipolatore. Si parte da un guess iniziale q0, si calcola il vettore di
% coordinate cartesiane corrispondente X0 e l'errore X - X0. Tramite la
% Jacobiana si ricava l'errore q - q0, con q soluzione della IK. Si
% aggiorna q0 come q0 + deltaq e si ripete il procedimento fino a
% convergenza.
%
% INPUT
% rbt               modello del manipolatore                               (struct)
% X                 vettore di coordinate cartesiane                       (6x1)
% q0                first guess                                            (string)
% xyz               sequenza degli assi di rotazione                       (string)
% varargin{1}       tolleranza su l'errore (1e-5 di default)               (scalar)
% varargin{2}       numero massimo di iterazioni (500 di default)          (scalar)
% varargin{3}       numero di smorzamento (0.1 di default)                 (scalar)
%
% OUTPUT
% q                 soluzione numerica della cinematica inversa            (matrix NxM)

tol = 1e-5;
max_iter = 500;
k = 0.1;
n_joints = rbt.joints_number;
% controllo input
if nargin >= 5, tol = varargin{1}; end
if nargin >= 6, tol = varargin{1}; max_iter = varargin{2}; end
if nargin >= 7, tol = varargin{1}; max_iter = varargin{2}; k = varargin{3}; end

i = 0;
e = 1000;
while norm(e) > tol && i < max_iter
[T,p] = FK(rbt,q0);
X0(1:3) = p;
X0(4:6) = R2eul(T(1:3,1:3),xyz);
e = X - X0';
J = geomJacobian(rbt,q0);
dq = inv(J' * J + k^2 * eye(n_joints))* J' * e;
q0 = q0 + dq;
i = i + 1;
end
q = q0;

if norm(e) < tol, status = 'success'; else, status = 'fail'; end
