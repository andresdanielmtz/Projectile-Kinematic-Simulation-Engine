clear all
close all 
clc 

x = 0:1:10; 
y = x.^2 

h = animatedline; 

for i = 1: length(x)
    addpoints(h,x(i),y(i)); 
    drawnow; pause(0.5); 
end 