close all 
clear all 
clc 

ti = 0;
tf = 2;
N = 5;
dt = (tf - ti)/N;

m = 1;
b = 0.1;

figure(1)
hold on
axis([0 10 0 10])

t(1) = ti; 