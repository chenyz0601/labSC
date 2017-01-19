function [ output_args ] = plotter(T,Nx, dt, k)
%PLOTTER Summary of this function goes here
%   Detailed explanation goes here
global var;
global j;

x=linspace(0,1,Nx+2);
y=x;

ans1= zeros(Nx+2,Nx+2);
for i=0:Nx-1
    ans1(2:Nx+1,i+2)=T(i*Nx+1:(i+1)*Nx,1);
end

str=sprintf('t=%.3f',k*dt);
str1=sprintf('Explicit Euler Nx=%0.f for dt=%f', Nx,dt);


figure(var)
subplot(2,2,j)
surf(y,x,ans1);
title(str)
ylabel('length along y')
xlabel('length along x')
zlabel('Temp')
suptitle(str1)

j=j+1;
if j>4
    j=1;
end
end

