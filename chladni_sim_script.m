%define dimensions of the membrane
length = pi;
width = pi;
%define a
a = width/length;
%define initial velocity
v = 1;

%making the MATLAB mesh
[X, Y] = meshgrid(0:0.01:3.2);

%making the wave function simulation
%two figure windows for two views
%f1 = figure;
%f2 = figure;

t_final = 10;

for t = 0:0.1:t_final
    Z = wave(X, Y, a, t);

    %regular view
    %figure(f1);
    subplot(1,2,1)
    p1 = surf(X, Y, Z, "EdgeColor","none");
    xlabel('x')
    ylabel('y')
    zlabel('z')
    axis ([0 4 0 4 -1 1]);
    
    %top down view
    %figure(f2);
    subplot(1,2,2)
    p2 = surf(X, Y, Z, "EdgeColor","none");
    view(0, 90);
    axis([0 pi 0 pi]);
    
    hold on
    pause(0.01);

    if(t ~= t_final)
       delete(p1);
       delete(p2);
    end
end

%resulting Chladni patterns will be displayed in top-down view!

%bypass complicated constants by using Runge-Kutta approximation of second
%order PDE



%%LOCAL FUNCTIONS
function bnm = define_bnm(x, y, a, n, m)
    %define b 
    %func_init = sin(a*x).*sin(y);
    %func = func_init.*sin(a*n*x).*sin(m*y); 
    bnm = (4*a/(pi^2))*integral2((sin(a*x).*sin(y).*sin(a*n*x).*sin(m*y)), 0, (pi/n), 0, pi);
end

%for f(init) = sin(anx)*sin(y), m=n=1
function Z = wave(x, y, a, t)
    %wave as a function of time
    %syms n m;
    %Z = symsum(symsum(define_bnm(X, Y, a, n, m)*sin(a*n*X).*sin(m*Y)*cos(sqrt((a^2*n^2)+(m^2*t))), m, 1, inf), n, 1, inf);
    Z = sin(a*x).*sin(y)*cos(sqrt(a^2+1)*t);
end

