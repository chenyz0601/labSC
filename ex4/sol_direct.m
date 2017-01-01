function [ ans1] = sol_direct(U,T,Nx)
%SOL_DIRECT Summary of this function goes here
%   Detailed explanation goes here
ans1= zeros(Nx+2,Nx+2);
midway=inv(U)*(T');
for i=0:Nx-1
ans1(2:Nx+1,i+2)=midway(i*Nx+1:(i+1)*Nx,1);
end

end

