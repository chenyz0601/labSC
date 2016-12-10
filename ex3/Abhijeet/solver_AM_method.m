function [ y ] = solver_AM_method( y_0, dt, t_end)
%SOLVER_AM_METHOD Adams Moulton method(2nd order)
%   This function is used find the solution of a differential equation of 
%   the form y'=f(y) using the Adams Moulton method(2nd order)

y= zeros(1,(t_end/dt)+1);%preallocation to prevent copying again and again while increasing size(improves speed)

y(1)= y_0;

for i=1:(t_end/dt)
   
    y(i+1)=newton_AM(y(i),dt,0);
   if y(i+1)==69
       y(i+1)=Inf;
       disp(sprintf('dt= %f unstable for Adams Moulton \n ',dt))
        break;
    end
end

%displays the required vector
%sprintf('The required vector y of Adams Moulton Method for dt = %.5f is',dt)
%disp(y)

%plot all the curves for this method
if (i < (t_end/dt)-1)
    figure(4)
   plot(0:dt:(i-1)*dt, y(1:i),'*','Color',[rand() rand() rand()]) 
   hold on
else
 figure(4)
 plot(0:dt:t_end, y,'LineWidth',1.5,'Color',[rand() rand() rand()])
 hold on
end
end

