close all
clear all
clc
%------------------
ti = 0; % tiempo inicial 
tf = 20; % tiempo final 
N = 1500; % no. de pasos (?) 
dt = (tf-ti)/N; % % tiempo sobre el numero de pasos 
%------------------
angulo = 75;
vi=100; % velocidad inicial 
vx(1) = vi*cosd(angulo); % velocidad x 
vy(1) = vi*sind(angulo); % velocidad en y 
x(1)=0; % las posiciones en (x)
y(1)=0; % y en (y) 
g=-9.8; %gravedad m/s² 
m = 1; %masa kg
b=0;% sepa que unidades

figure(1) 
hold on
texttitle = sprintf("Tiro:    v_{inicial} = %2.f m/s", vi);
titulo = title(texttitle, 'interpreter', 'tex');
set(titulo, "fontsize", 22); 
set(gcf,'position',[1000,1000,1000,1000])

xlabel("Posición en X");
ylabel("Posición en Y");


% figure(1)
% hold on 
% axis([0 10 0 10])

% t(1)  = ti;

% for i = 1:3
%     x ( i, 1) = 0; 
%     y ( i, 1) = 0; 
% 
%     angulo(i) = 75 + rand(1) * 10;
%     vi(i) = 10 + rand(1) * 2; 
%     vx(i, 1) = vi(i) * cos(angulo/i)
%     vy(i, 1) = vi(i) * sind(angulo/i)
% 
%     
% 
% end

for n = 0:N
  t(n+1)= ti + n*dt;
  vx(n+2)=vx(n+1)*(1-b*dt/m);
  vy(n+2)=vy(n+1)*(1-b*dt/m)+g*dt;
  x(n+2) = x(n+1) + vx(n+1)*dt;
  y(n+2) = y(n+1) + vy(n+1)*dt;

  xplot = x(n+2);
  yplot = y(n+2);
  a_text = text(xplot + 1 ,yplot - 0.4, "a = -9.8" );
  symbol = text(xplot ,yplot, "o" );

  plot(xplot,yplot, "*");
  pause(0.001)

  delete(a_text);
  delete(symbol); 
  
end
text_tfinal = sprintf("Posicion_{Final} = (%.2f, %2.f)", xplot, yplot);
f = text(xplot, yplot, text_tfinal);


t