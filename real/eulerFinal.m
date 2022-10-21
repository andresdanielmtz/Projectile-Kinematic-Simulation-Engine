close all
clear all
clc
%------------------
ti = 0; % tiempo inicial 
tf = 2000; % tiempo final 
N = 2000; % no. de pasos (?) 
dt = (tf-ti)/N; % % tiempo sobre el numero de pasos 
disp(dt)
%------------------
% angulo = 75;
% vi=100; % velocidad inicial 
% vx(1) = vi*cosd(angulo); % velocidad x 
% vy(1) = vi*sind(angulo); % velocidad en y 
% x(1)=0; % las posiciones en (x)
% y(1)=0; % y en (y) 
g = -9.8; % gravedad m/s² 
m = 10.68; % masa kg 
% r = 1.25 (f vol esfera) 

b= 0.47; 

triangX = [-4000 -1250 1250 4000]; % volcano  
triangY = [0 3763 3763 0];

texttitle = sprintf("Tiro del Volcán de Fuego en Guatemala");
titulo = title(texttitle, 'interpreter', 'tex');
set(titulo, "fontsize", 18); 

ylim([0,inf])
figure(1) 
hold on
% set(gcf,'position',[1000,1000,1000,1000])

xlabel("Posición en X");
ylabel("Posición en Y");
axis([-5000 8000 0 15000])


% figure(1)
% hold on 

% t(1)  = ti;

for i = 1:3
    x(i, 1) = 0; 
    y(i, 1) = 3763; 
    angulo(i) = 75 + rand(1) * 10; 
    vi(i) = 400 + rand(1) * 2; % 111.111
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
  pause(0.000000001)
  plot(xplot,yplot, "*");

  delete(symbol); 
  end 
  vx(n+1)=vx(n)*(1-0*dt/m);
  vy(n+1)=vy(n)*(1-0*dt/m)+g*dt;
  x(n+1) = x(n) + vx(n+1)*dt;
  y(n+1) = y(n) + vy(n+1)*dt;

  tplot = x(n+1);
  pplot = y(n+1);

  plot(tplot, pplot, "o");

  %plot(xplot,yplot, "*");

end

text_tfinal = sprintf("Posicion_{Final} = (%.2f, %2.f)", xplot, yplot);
f = text(xplot, yplot, text_tfinal);
