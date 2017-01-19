function [ans1] = sol_gauss_siedel(U,T,Nx,x,y)
%SOL_GAUSS_SIEDEL Gauss Seidel Solver
%   The solver to solve the system of linear equation using the iterativ
%   Gauss Seidel Solver

residual =1;

%init for prev and cuurent iterartions
midway= zeros(Nx^2,1) ;
midway_1 = zeros(Nx^2,1);

ans1= zeros(Nx+2,Nx+2);

tic;
while residual > 1*10^-4
    for i=1:Nx*Nx
        
         sum1 = 0;        
         sum2 = 0;
         
        if(i-1>0 && mod((i-1),Nx)~=0)
            
            sum1 = midway_1(i-1);
        end
        if(i+1<=Nx*Nx && mod((i),Nx)~=0)
            sum2=midway(i+1);
        end
       if(i+Nx<=Nx*Nx)
            sum2=sum2+midway(i+Nx);
        end
        if(i-Nx>0)
             sum1 = sum1 + midway_1(i-Nx);
        end
         midway_1(i) = (T(1,i) - sum1 - sum2)/(-4);
        end

    %residual=sqrt(sumsqr(T'-U*midway_1));
     residual=sqrt(sum((sum(T'-U*midway_1).^2),2));
 
     midway = midway_1;

end
toc;

for i=0:Nx-1
    ans1(2:Nx+1,i+2)=midway(i*Nx+1:(i+1)*Nx,1);
end

plotter(3,x,y,ans1,Nx);

fprintf('Total matrix/vector entries=%.0f\n',size(ans1,2)*size(ans1,1)+size(T,2))
end