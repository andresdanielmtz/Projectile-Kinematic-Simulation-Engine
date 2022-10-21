clc
close all
clear all

t_inicial = 0; 
t_final = 9; 
N = 72;
t = linspace(t_inicial, t_final, N);

g = -9.8;


figure(1);



axis([-1 15 -0 25], "equal");
hold on;
triangX = [-6.25 -2.083 2.083 6.25];
triangY = [0 3.763 3.763 0];

m = 1 ;
b = 0.1;  

plot(triangX, triangY) % plot the volcano 

% theta = pi/4
figure(1)
hold on 

% t(1) = ti; 
% 
% for i = 1:3
%     x(i, 1) = 0;
%     y(1, 1) = 0;
% 
%     angulo(i) = 75 + rand(1) * 10;
%     vi(i) = 10;
% end 
