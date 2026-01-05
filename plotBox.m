function h = plotBox(dims, Pose, varargin)
% plotBox: disegna un box 3D con patch
% dims = [Lx Ly Lz]
% Pose = 4x4 (box frame -> world)
% varargin: coppie 'FaceAlpha', 'FaceColor', ecc.

Lx = dims(1); Ly = dims(2); Lz = dims(3);

% 8 vertici nel frame locale (centrato in 0)
V = 0.5 * [
   -Lx -Ly -Lz;
    Lx -Ly -Lz;
    Lx  Ly -Lz;
   -Lx  Ly -Lz;
   -Lx -Ly  Lz;
    Lx -Ly  Lz;
    Lx  Ly  Lz;
   -Lx  Ly  Lz
];

% omogenee
Vh = [V, ones(8,1)];
Vw = (Pose * Vh')';       % 8x4
Vw = Vw(:,1:3);           % 8x3

% facce (indici vertici)
F = [
    1 2 3 4;  % bottom
    5 6 7 8;  % top
    1 2 6 5;  % side
    2 3 7 6;
    3 4 8 7;
    4 1 5 8
];

h = patch('Vertices', Vw, 'Faces', F, ...
          'FaceAlpha', 0.2, 'EdgeColor', 'k', varargin{:});
end
