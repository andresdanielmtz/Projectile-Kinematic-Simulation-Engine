close all
clear
clc

g = -9.8; % gravedad m/s² 
m = 10.68; % masa kg 
% r = 1.25 (f vol esfera) 
b= 0.47; 

for i = 1:4
    x(i, 1) = 0; 
    y(i, 1) = 463; 
    angulo(i) = 75 + rand(1) * 10; 
    vi(i) = 111.111 + rand(1) * 2; % 111.111
    vx(i, 1) = vi(i) * cosd(angulo(i));
    vy(i, 1) = vi(i) * sind(angulo(i));
    
end

for k = 1:1
    x(k, 1) = 0; 
    y(k, 1) = 463; 
    angulo(k) = 75; 
    vi(k) = 111.111; % 111.111
    vx(k, 1) = vi(k) * cosd(angulo(k));
    vy(k, 1) = vi(k) * sind(angulo(k));
    ymax = vi(k)^2 * sind(angulo(k)) ^ 2/abs(2*g); % -g 
    xmax = vi(k)^2* sind(2 * angulo(k)) ^ 2 / abs(g);
end 
%------------------
ti = 0; % tiempo inicial 
tf = (2 * vi(i) * sind(angulo(i))/abs(g)) + abs(sqrt(2 * y(i, 1) / g)); % tiempo final 
N = 350; % no. de pasos 
dt = (tf-ti)/N; % % tiempo sobre el numero de pasos 
disp(dt)
vf = sqrt(vx(i).^2 + vy(i).^2);
%------------------


% volcan 
triangX = [-1000 -500 500 1000]; % volcano  
triangY = [0 463 463 0];
plot(triangX, triangY);

% titulo y subtitulo 
texttitle = sprintf("Tiro del Volcán de Fuego en Guatemala");
titulo = title(texttitle, 'interpreter', 'tex');
set(titulo, "fontsize", 18); 

ylim([0,inf])
figure(1) 
hold on
% set(gcf,'position',[1000,1000,1000,1000])
text_xmax = sprintf("x_{max} = %.2f m", 2 * xmax(k) + 100);
text(2 * xmax(k) + 100, 0.1 * ymax(k), text_xmax)
text_ymax = sprintf("y_{max} = %.2f m", ymax(k) + 463);
text(xmax(k) / 2, (1.1 * ymax(k)) + 463, text_ymax)

tb = (2 * vi(k) * sind(angulo(k))/abs(g)) + abs(sqrt(2 * y(k) / g))/2; % tiempo final 
% text_tf = sprintf("t_{final} = %.2f m", tb);
% text(2 * xmax(k) + 100, ymax(k) + 20, text_tf)


disp(tb);


text_altura = sprintf("y_{inicial} = %.2f m", 463);
text(-600, 500, text_altura) % specific altitude


xlabel("X (metros)");
ylabel("Y (metros)");
axis([-1000 1500 0 1500])



t(1)  = ti;
for n = 1:N
  t(n+1)= ti + n*dt;
  
  for i = 1:4
  vx(i, n+1)=vx(i,n) * (1-b*dt/m);
  vy(i, n+1)=vy(i,n)*(1-b*dt/m)+g*dt;
  x(i, n+1) = x(i,n) + vx(i,n+1)*dt;
  y(i, n+1) = y(i,n) + vy(i,n+1)*dt;

  xplot = x(i, n+1);
  yplot = y(i, n+1);
  %symbol = text(xplot ,yplot, "." );
  pause(0.00000000000000000001);
  plot(xplot,yplot, ".");

  
  %delete(symbol); 
  if yplot <= 10
      disp(yplot);
      disp(xplot);
        text_tfinal = sprintf("Posicion_{Final} = (%.2f, %2.f)", 346.2321, 0);
        f = text(- 900, 100, text_tfinal);
      break; 
        
  end

  end 

  for k = 1:1 
  vx(k, n+1)=vx(k, n)*(1-0*dt/m);
  vy(k, n+1)=vy(k, n)*(1-0*dt/m)+g*dt;
  x(k,n+1) = x(k,n) + vx(k,n+1)*dt;
  y(k,n+1) = y(k,n) + vy(k,n+1)*dt;
  
  

  tplot = x(k,n+1);
  pplot = y(k,n+1);
  
  if pplot <= 20
      break
  end 
 
  pause(0.000000000000000001);
  plot(tplot, pplot, "");
  end 
  %plot(xplot,yplot, "*");
%   if pplot <= 20 || yplot <= 20
%       break
%   end 
  
end

text_tfinal = sprintf("Posicion_{Final} = (%.2f, %2.f)", xplot, yplot);
f = text(xplot - 900, yplot + 50, text_tfinal);
