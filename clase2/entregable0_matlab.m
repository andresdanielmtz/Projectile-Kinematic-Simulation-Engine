clear all 
close all
clc 

num = 50; % # de pasos
a = -9.81; 

xi = 0;
yi = 0;
vi = 7; % can be changed 
theta = 45;

vxi = vi * cosd(theta); % magnitud * cosd(angulo)
vyi = vi * sind(theta); % magnitud * sind(angulo)
a = -9.81; % aceleracion, gravedad  

ti = 0; %tiempo inicial
tf = 2 * vi * sind(theta) / abs(a); %tiempo final 
dt = (tf-ti)/num; % tiempo entre pasos


xmax = vi^2* sind(2 * theta) ^ 2 / abs(a)
ymax = vi^2 * sind(theta) ^ 2/abs(2*a) % -g 
tmax = (2 * (vi * sind(theta))) / abs(a)
vfinal = abs(vi - abs(a) * tf)
flag_x_max = "false";
flag_y_max = 0; 

figure(1);
hold on;
axis([0 1.2*xmax 0 1.2*ymax])
texttitle = sprintf("Cañón:    v_{inicial} = %2.f m/s // theta = %.0f^{//deg}", vi, theta)
titulo = title(texttitle, 'interpreter', 'tex');
set(titulo, "fontsize", 22); 

% TEXTOS 
text_xmax = sprintf("x_{max} = %.2f m", xmax)
text(1.06 + xmax, 0.1 * ymax, text_xmax)
text_ymax = sprintf("y_{max} = %.2f m", ymax)
text(xmax / 2, 1.1 * ymax, text_ymax)
text_vfinal = sprintf("v_{final} = %.2f m", vfinal)
text(xmax, 0.5, text_vfinal)

text_tfinal = sprintf("t_{max} = %.2f s", tmax)

for n = 0:num
    t(n + 1) = ti + n * dt;
    x = xi + vxi * t(n+1); 
    y = yi + vyi * t(n+1) + 0.5*a*t(n+1)^2; % :D 
    p1 = plot(x,y,"*");
    va = quiver(x,y,0,-0.4);
    a_text = text(x,y - 0.4, "a = -9.8" )
    text_tiempo = sprintf("tiempo = %.2f s", t(n +1));
    w = text(0.1, 0.8 * ymax, text_tiempo);
    pause(0.1); 
    delete(va);
    delete(a_text);
    delete(w);
    
end 
w = text(xmax, 0.1 * ymax, text_tfinal)

t;