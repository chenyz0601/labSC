function [ ] = plotter(ans1,Nx, dt, k,str1,a)
%PLOTTER Summary of this function goes here
%   Detailed explanation goes here

global j;

x=linspace(0,1,Nx+2);
y=x;

str=sprintf('Nx=%.0f dt=%f',Nx,dt);
var=k*8*dt+a;
figure(var)
if a == 0
    subplot(4, 7, j )
end
if a==4
        subplot(2, 2, j )
end
surf(y,x,ans1);
title(str)
ylabel('y')
xlabel('x')
zlabel('T')
%suptitle(str1)


if var ==4 || var== 8
    j=j+1;
    if j>28 && a ==0 
        j=1;
    end
    if j>4 && a==4
        j=1;
    end
 end
end
