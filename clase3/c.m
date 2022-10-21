close all;
clear all; 
clc
 
% -----------
ti = 0;
tf = 10;
N = 0; 
dt = (tf-ti)/N;
% -----------
angulo = 75; 
vi = 100;
vx(1) = vi*cosd(angulo);
vy(1) = vi*sind(angulo);
x(1) = 0; 
y(1) = 0; 
g = -9.8;
m = 1; 
b = 0.5;  % Ns / m 

figure(1)
hold on 

for n = 0:N
    t(n+1)= ti + n * dt;
    vx(n+2)= vx(n+1)*(1-b*dt/m);
    vy(n+2)= vy(n+1)*(1-b*dt/m)+ g*dt;
    x(n+2)= x(n+1) + vx(n+1)*dt;
    y(n+2)= y(n+1) + vy(n+1)*dt; 
    x_plot = x(n+2);
    y_plot = y(n+2);
    plot(x_plot,y_plot, "o");
    pause(0.1)

end

t
