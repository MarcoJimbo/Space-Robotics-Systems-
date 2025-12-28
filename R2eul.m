function eul = R2eul(R, xyz)
%R2eul  Conversione robusta Rotazione->Euler (solo reale) con proiezione su SO(3)
%
% INPUT:
%   R   : 3x3 (quasi-rotazione)
%   xyz : '123','313','321','323'
%
% OUTPUT:
%   eul : [psi; theta; phi] coerente con la tua implementazione originale

% --- 1) Proietta R alla rotazione più vicina (robustezza numerica)
R = projectToSO3(R);

% --- helper clamp
clamp = @(x) min(1, max(-1, x));

switch xyz
    case '123'
        % Convenzione tua: theta = asin(-R31)
        s = clamp(-R(3,1));
        theta = asin(s);

        % gimbal lock quando cos(theta) ~ 0
        cth = cos(theta);
        if abs(cth) < 1e-10
            % in singolarità: phi e psi non sono univoci.
            % scelta comune: set psi = 0 e ricava phi da un'altra relazione
            psi = 0;
            phi = atan2(-R(1,2), R(2,2));
        else
            phi = atan2(R(2,1), R(1,1));
            psi = atan2(R(3,2), R(3,3));
        end

    case '321'
        % tua: theta = asin(R13)
        s = clamp(R(1,3));
        theta = asin(s);

        cth = cos(theta);
        if abs(cth) < 1e-10
            psi = 0;
            % qui (gimbal lock) puoi ricavare phi in modo stabile
            phi = atan2(R(2,1), R(2,2));
        else
            phi = atan2(-R(2,3), R(3,3));
            psi = atan2(-R(1,2), R(1,1));
        end

    case '313'
        % qui non usi asin: è già abbastanza robusto se R è in SO(3)
        theta = atan2( sqrt(R(3,1)^2 + R(3,2)^2), R(3,3) );
        if abs(sin(theta)) < 1e-10
            % singolarità: theta ~ 0 o pi
            psi = 0;
            phi = atan2(R(2,1), R(1,1));
        else
            phi = atan2(R(2,3), R(1,3));
            psi = atan2(R(3,2), -R(3,1));
        end

    case '323'
        % attenzione: formula originale tua sembra "copiata" da 313 ma con indici non coerenti
        % qui faccio una versione standard per 323 (Z-Y-Z con assi 3-2-3)
        % theta = atan2(sqrt(R31^2+R32^2), R33)
        theta = atan2( sqrt(R(3,1)^2 + R(3,2)^2), R(3,3) );
        if abs(sin(theta)) < 1e-10
            psi = 0;
            phi = atan2(R(2,1), R(1,1));
        else
            % per 3-2-3:
            phi = atan2(R(2,3), R(1,3));   % rotazione iniziale attorno a z
            psi = atan2(R(3,2), -R(3,1));  % rotazione finale attorno a z
        end

    otherwise
        error('Sequenza xyz non supportata. Usa: 123, 313, 321, 323');
end

% come nel tuo codice: [psi; theta; phi]
eul = [psi; theta; phi];

end

% =========================================================
function R = projectToSO3(R)
% Proietta una matrice 3x3 alla rotazione più vicina in norma di Frobenius
% (polar decomposition via SVD). Garantisce det(R)=+1.
[U,~,V] = svd(R);
R = U*V';
if det(R) < 0
    U(:,3) = -U(:,3);
    R = U*V';
end
end
