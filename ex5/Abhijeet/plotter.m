
function [ ] = plotter(ans1,Nx, dt, k,str1)
%PLOTTER Summary of this function goes here
%   Detailed explanation goes here

global j;

x=linspace(0,1,Nx+2);
y=x;

str=sprintf('Nx=%.0f dt=%.3f',Nx,dt);
var=k*8*dt;
figure(var)
subplot(7, 4, j )
surf(y,x,ans1);
title(str)
ylabel('y')
xlabel('x')
zlabel('T')
suptitle(str1)


if var ==4
    j=j+1;
    if j>28
        j=1;
    end
 end
end

