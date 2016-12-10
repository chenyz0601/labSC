function [ y] = solver_AM_Lin1( y_0, dt, t_end)
%SOLVER_AM_LIN1 Adams Moulton method(2nd order)
%   This function is used find the solution of a differential equation of 
%   the form y'=f(y) using the Adams Moulton method(2nd order) with
%   Linearisation 1 where solution doesnt exist 

y= zeros(1,t_end/dt);%preallocation to prevent copying again and again while increasing size(improves speed)

y(1)= y_0;
a=0;
for i=1:(t_end/dt)
     y(i+1)=newton_AM(y(i),dt,1);
       if y(i+1) <10
          a=a+1;
       end
end

%displays the required vector
%sprintf('The required vector y of Adams Moulton Method with Lin1 for dt = %.5f is',dt)
%disp(y)

if a>0
    disp(sprintf('dt= %f unstable for Adams Moulton Linearisation 1 \n ',dt))
end

%plot all the curves for this method
figure(5)
plot(0:dt:dt*i, y,'LineWidth',1.5,'Color',[rand() rand() rand()])
hold on
end

