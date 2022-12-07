%define dimensions of the membrane
length = pi;
width = pi;
%define a
a = width/length;

%making the MATLAB mesh
[X, Y] = meshgrid(0:0.1:3.2);

%mesh(x, y, z)
%making the wave function simulation
for t = 0:0.1:100
    mesh(X, Y, wave(X, Y, a, t))
    xlabel('x')
    ylabel('y')
    zlabel('z')
    axis ([0 3.2 0 3.2 -1 1]);
    pause(0.1);
end

%displaying the resulting Chladni patterns

%%LOCAL FUNCTIONS
function bnm = define_bnm(x, y, a, n, m)
    %define b 
    %func_init = sin(a*x).*sin(y);
    %func = func_init.*sin(a*n*x).*sin(m*y); 
    bnm = (4*a/(pi^2))*integral2((sin(a*x).*sin(y).*sin(a*n*x).*sin(m*y)), 0, (pi/n), 0, pi);
end

function Z = wave(x, y, a, t)
    %wave as a function of time
    %syms n m;
    %Z = symsum(symsum(define_bnm(X, Y, a, n, m)*sin(a*n*X).*sin(m*Y)*cos(sqrt((a^2*n^2)+(m^2*t))), m, 1, inf), n, 1, inf);
    Z = sin(a*x).*sin(y)*cos(sqrt(a^2+1)*t);
end

