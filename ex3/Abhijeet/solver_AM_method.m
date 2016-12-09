function [ y ] = solver_AM_method( y_0, dt, t_end, a )
%SOLVER_AM_METHOD Adams Moulton method(2nd order)
%   This function is used find the solution of a differential equation of 
%   the form y'=f(y) using the Adams Moulton method(2nd order)

%y= zeros(1,(t_end/dt)+1);%preallocation to prevent copying again and again while increasing size(improves speed)

y(1)= y_0;

for i=1:(t_end/dt)
   
    if ((3.5*dt-1)^2+7*dt*(y(i)+0.5*dt*f(y(i)))/5 )< 0 || y(i)==0
        
        break;
        
    else
        y(i+1)=newton_AM(y(i),dt,0);
        
    end
  
end

%displays the required vector
sprintf('The required vector y of Adams Moulton Method for dt = %.5f is',dt)
disp(y)

%plot all the curves for this method
figure(4)
plot(0:dt:i*dt, y,'LineWidth',1.5,'Color',[rand() rand() rand()])
hold on
end

