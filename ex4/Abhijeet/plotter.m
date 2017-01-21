function [ ] = plotter( a,x,y,ans1,Nx)
%PLOTTER Plot Solution
%   Function plots the Surfae and Contour Plots of the PDEs solved in all
%   the methods

global var;

if a==1
str=sprintf('Surface Plot(Full Matrix)-N=%.0f', Nx);
str1=sprintf('Contour Plot(Full Matrix)-N=%.0f', Nx);
end

if a==2
str=sprintf('Surface Plot(Sparse Matrix)-N=%.0f', Nx);
str1=sprintf('Contour Plot(Sparse Matrix)-N=%.0f', Nx);
end

if a==3
str=sprintf('Surface Plot(Gauss Siedel)-N=%.0f', Nx);
str1=sprintf('Contour Plot(Gauss Siedel)-N=%.0f', Nx);
end

figure(var)
contour(y,x,ans1,'ShowText', 'on');
var=var+1;
title(str1)
ylabel('length along y')
xlabel('length along x')

figure(var)
surf(y,x,ans1);
colorbar;
var=var+1;
title(str)
axis([0,1,0,1,0,1.2 ])      
ylabel('length along y')
xlabel('length along x')
zlabel('Temp')

end

