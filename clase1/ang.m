clear all
close all 
clc 

% from other files 
x_inicial = 0; 

% to be defined ?? 
t = 0:.01:.5;
a = -9.8;
xi = 0;
yi = 0;

v_xi = 3 * cos(32);
v_yi = 3 * sin(32);

x = x_inicial + v_xi * t;
y = yi + v_yi * t + 0.5 * a * t.^2;

disp(x);
disp(y);

ylim([0, inf]) % limit it 

h=animatedline;
for n = 1:length(t)
    axis([0 1 0 0.15])
    addpoints(h,x(n),y(n))
    drawnow; pause(0.09); % to draw
end