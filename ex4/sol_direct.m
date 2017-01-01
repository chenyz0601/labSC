function [ ] = sol_direct(U,T,Nx,a,x,y)
%SOL_DIRECT Summary of this function goes here
%   Detailed explanation goes here
global var;
ans1= zeros(Nx+2,Nx+2);
tic
midway=inv(U)*(T');
toc
for i=0:Nx-1
ans1(2:Nx+1,i+2)=midway(i*Nx+1:(i+1)*Nx,1);
end
if a==1
disp(sprintf('Total of entries involved =%.0f',size(U,1)*size(U,2)+size(T,2)))
figure(var)
surf(y,x,ans1); % 3-D surface plot
var=var+1;

else if a==2
disp(sprintf('Total of entries involved =%.0f',Nx*(Nx+2*(Nx-1))+Nx*Nx*2+size(T,2)))
figure(var)
surf(y,x,ans1); % 3-D surface plot
var=var+1;
    end
    
figure(a)
surf(y,x,ans1); % 3-D surface plot


end

