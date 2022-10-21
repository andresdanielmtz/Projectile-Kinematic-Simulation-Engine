close all
clear all
clc
%------------------
ti = 0; % tiempo inicial 
tf = 20; % tiempo final 
N = 1500; % no. de pasos (?) 
dt = (tf-ti)/N; % % tiempo sobre el numero de pasos 
%------------------
% angulo = 75;
% vi=100; % velocidad inicial 
% vx(1) = vi*cosd(angulo); % velocidad x 
% vy(1) = vi*sind(angulo); % velocidad en y 
% x(1)=0; % las posiciones en (x)
% y(1)=0; % y en (y) 
g=-9.8; %gravedad m/s² 
m = 1; %masa kg
b=0.1;% sepa que unidades

triangX = [-1 -0.5 0.5 1];
triangY = [-1 0 0 -1];

ylim([0,inf])
figure(1) 
hold on
% texttitle = sprintf("Tiro:    v_{inicial} = %2.f m/s", vi);
% titulo = title(texttitle, 'interpreter', 'tex');
% set(titulo, "fontsize", 22); 
% set(gcf,'position',[1000,1000,1000,1000])

xlabel("Posición en X");
ylabel("Posición en Y");
axis([-1 6 -1 8])


% figure(1)
% hold on 

% t(1)  = ti;

for i = 1:3
    x(i, 1) = 0; 
    y(i, 1) = 0; 
    angulo(i) = 75 + rand(1) * 10;
    vi(i) = 10 + rand(1) * 2; 
    vx(i, 1) = vi(i) * cosd(angulo(i));
    vy(i, 1) = vi(i) * sind(angulo(i)) + g * dt;
end

plot(triangX, triangY);


for n = 1:N
  t(n+1)= ti + n*dt;
  for i = 1:3
  vx(i, n+1)=vx(i,n)*(1-b*dt/m);
  vy(i, n+1)=vy(i,n)*(1-b*dt/m)+g*dt;
  x(i, n+1) = x(i,n) + vx(i,n+1)*dt;
  y(i, n+1) = y(i,n) + vy(i,n+1)*dt;

  xplot = x(i, n+1);
  yplot = y(i, n+1);

  %disp(y)
%   if y < 0
%       disp("they did it...")
%       break;
%   end 
  %objeto(i) = rectangle('Position', [x (i, n+1) - .5, 1, 1], 'curvature', [1 1]);
  symbol = text(xplot ,yplot, "*" );

  plot(xplot,yplot, "*");
  pause(0.001)

  delete(symbol); 
  end 
end

text_tfinal = sprintf("Posicion_{Final} = (%.2f, %2.f)", xplot, yplot);
f = text(xplot, yplot, text_tfinal);


t