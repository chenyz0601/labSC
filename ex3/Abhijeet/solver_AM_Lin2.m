function [ y] = solver_AM_Lin2( y_0, dt, t_end)
%SOLVER_AM_LIN2 Adams Moulton method(2nd order)
%   This function is used find the solution of a differential equation of 
%   the form y'=f(y) using the Adams Moulton method(2nd order) with
%   Linearisation 2 where solutio does not exist

y= zeros(1,t_end/dt);%preallocation to prevent copying again and again while increasing size(improves speed)

y(1)= y_0;
for i=1:(t_end/dt)
  
       y(i+1)=newton_AM(y(i),dt,2);
         
   
end

%displays the required vector
%sprintf('The required vector y of Adams Moulton Method with Lin2 for dt = %.5f is',dt)
%disp(y)

%plot all the curves for this method
figure(6)
plot(0:dt:t_end, y,'LineWidth',1.5,'Color',[rand() rand() rand()])
hold on
end

