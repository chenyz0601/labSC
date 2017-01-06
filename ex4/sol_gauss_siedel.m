function [ ] = sol_gauss_siedel(U,T,Nx,x,y)
%SOL_GAUSS_SIEDEL Summary of this function goes here
%   Detailed explanation goes here
global var;

midway= zeros(Nx^2,1) ;

residual = norm(T'-U*midway);

midway_1 = zeros(Nx^2,1);
ans1= zeros(Nx+2,Nx+2);
tic;
while residual > 1.e-4
    for i=1:Nx^2
        
         sum1 = 0;
         sum1 = sum1 + U(i,1:i-1)*midway_1(1:i-1);
              
         sum2 = 0;
         sum2 = sum2 +U(i,i+1:Nx^2)*midway(i+1:Nx^2);
      
        % sum1 = 0;
         %if mod((i-1),Nx)~=0
              %  if (i-Nx)>=1
              %  sum1 = sum1 +midway_1(i-Nx);
              %  end
               % if (i-1)>=1
               % sum1 = sum1 + midway_1(i-1);
               % end
         %else
                 %if (i-Nx)>=1
                %sum1 = sum1 +midway_1(i-Nx);
                % end
                
        % end
          %sum1   
             
        % sum2 = 0;
         %if mod((i),Nx)~=0
          %   if (i+Nx)<= Nx^2
           %     sum2 = sum2 +midway(i+Nx);
           %  end
           %  if i+1< Nx^2
             %     sum2 = sum2 +midway(i+1);
           %  end
             
        % else
             % if (i+Nx)<= Nx^2
              %  sum2 = sum2 +midway(i+Nx);
            %  end
        % end
        
         midway_1(i) = (T(i) - sum1 - sum2)/(-4);
%sum2 
     end
    
     residual = norm(T'-U*midway_1);
   
     midway = midway_1;

end
toc;
for i=0:Nx-1
ans1(2:Nx+1,i+2)=midway(i*Nx+1:(i+1)*Nx,1);
end
disp(sprintf('Total of entries involved =%.0f',size(U,1)*size(U,2)+size(T,2)))
figure(var)
surf(y,x,ans1); % 3-D surface plot
str=sprintf('Surface Plot(Full Matrix)-N=%.0f', Nx);
title(str)
var=var+1;
end



