%define dimensions of the membrane
length = pi;
width = pi;

%making the MATLAB mesh
[x, y] = meshgrid(0:0.1:pi);
z = pass;

mesh(x, y, z)

%making the wave function simulation

%displaying the resulting Chladni patterns

%%LOCAL FUNCTIONS
function [a, b] = define_constants(l, w)
    a = w/l;
    b = 1;
end

function f = init_conditions()
    f = 1;
end

