%define dimensions of the membrane
length = pi;
width = pi;

%define conditions of the wave function
%% later on we can try and loop through multiple different m and n
%% and find different patterns
n = 1;
m = 1;
a, bnm = define_constants(length, width, n, m);

%initial conditions u(x, y, 0) = func_init(x, y)
%% specific initial displacements result in Chladni patterns
%% and nodal lines
func_init = @(x, y) sin(a*x)*sin(y);

%making the MATLAB mesh
[x, y] = meshgrid(0:0.1:pi);
z = pass;

mesh(x, y, z)

%making the wave function simulation

%displaying the resulting Chladni patterns

%%LOCAL FUNCTIONS
function [a, bnm] = define_constants(l, w, n, m)
    %define constants
    a = w/l;
    bnm = 1;
end

function u = wave(t)
    %wave as a function of time
    u = 1;
end

