function [ ] = sol_direct(U,T,Nx,a,x,y)
%SOL_DIRECT Inbuilt Solver
%   The solver to solve the system of linear equation for sparse and full using the inbuilt
%   matlab solvers

ans1= zeros(Nx+2,Nx+2);

tic
midway=U\(T');
toc

for i=0:Nx-1
    ans1(2:Nx+1,i+2)=midway(i*Nx+1:(i+1)*Nx,1);
end

plotter(a,x,y,ans1,Nx);

if a==1%Full Matrix
    fprintf('Total matrix/vector entries=%.0f\n',size(ans1,2)*size(ans1,1)+size(U,1)*size(U,2)+size(T,2))
end

if a==2%sparse Matrix
    fprintf('Total matrix/vector =%.0f\n',size(ans1,2)*size(ans1,1)+Nx*(Nx+2*(Nx-1))+(Nx-1)*Nx*2+size(T,2))
end

end

