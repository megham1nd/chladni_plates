%define dimensions of the membrane
length = pi;
width = pi;
%define a
a = width/length;

%making the MATLAB mesh
[X, Y] = meshgrid(0:0.1:pi);

%initial conditions u(x, y, 0) = func_init(x, y)
%% must be a periodic function - maybe we can manipulate this too
%% and see what happens?
func_init = sin(a*X).*sin(Y);

%mesh(x, y, z)

%making the wave function simulation

%displaying the resulting Chladni patterns

%%LOCAL FUNCTIONS
function bnm = define_bnm(n, m)
    %define b
    func = func_init.*sin(a*n*X).*sin(m*Y); %MAKE THIS MESHGRID
    bnm = (4*a/(pi^2))*integral2(func, 0, (pi/n), 0, pi);
end

function z = wave(t)
    %wave as a function of time
    syms n m;
    z = symsum(symsum(define_bnm(n, m)*sin(a*n.*X)*sin(m.*Y)*cos(sqrt(a^2*n^2+m^2*t)), m, 1, inf), n, 1, inf);
end

