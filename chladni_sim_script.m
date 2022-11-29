%define dimensions of the membrane
length = pi;
width = pi;

%define conditions of the wave function
%% later on we can try and loop through multiple different m and n
%% and find different patterns
n = 1;
m = 1;
%initial conditions u(x, y, 0) = func_init(x, y)
%% must be a periodic function - maybe we can manipulate this too
%% and see what happens?
func_init = @(x, y) sin(a*x)*sin(y);
%resulting constants
a, bnm = define_constants(length, width, n, m);

%making the MATLAB mesh
[x, y] = meshgrid(0:0.1:pi);
z = pass;

mesh(x, y, z)

%making the wave function simulation

%displaying the resulting Chladni patterns

%%LOCAL FUNCTIONS
function [a, bnm] = define_constants()
    %define a
    a = w/l;
    %define b
    func = @(x,y) func_init*sin(a*n*x)*sin(m*y);
    bnm = (4*a/(pi^2))*integral2(func, 0, (pi/n), 0, pi);
end

function u = wave(t)
    %wave as a function of time
    u = 1;
end

