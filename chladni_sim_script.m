%define dimensions of square membrane
l = pi;
%define a
%a = width/length;
%constants
m = 2;
n = 7;
kx = m*pi/l;
ky = n*pi/l;
A = 1;
B = -1;
%define initial velocity
v = 1;
w = v * sqrt(kx^2+ky^2);
%characteristic frequency
%gamma_mn = c*pi*sqrt((m^2/length^2)+(n^2/width^2));

%making the MATLAB mesh
[X, Y] = meshgrid(-l:0.01:l);

%making the wave function simulation
t_final = 10;

for t = 0:0.05:t_final
    Z = (A*sin(X*kx).*sin(Y*ky))+(B*sin(kx*Y).*sin(ky*X)*sin(w*t));

    %regular view
    %figure(f1);
    subplot(1,2,1)
    p1 = surf(X, Y, Z, "EdgeColor","none");
    xlabel('x')
    ylabel('y')
    zlabel('z')
    axis ([0 4 0 4 -4 4]);
    
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


