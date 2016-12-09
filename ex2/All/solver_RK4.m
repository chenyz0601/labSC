function [y ] = solver_RK4( y_0, dt, t_end,a  )
%SOLVER_RK4 Fourth Order Runge-Kutta Method
%   This function is used find the solution of a differential equation of 
%   the form y'=f(y) using the Fourth Order RungeKutta Method

y= zeros(1,t_end/dt);%preallocation to prevent copying again and again while increasing size(improves speed)
y(1)= y_0;

for i=1:(t_end/dt)
   %Defination of Fourth Order Runge-Kutta Method
   y1 = f(y(i));
   y2 = f(y(i)+dt*0.5*y1);
   y3 = f(y(i)+dt*0.5*y2);
   y4 = f(y(i)+dt*y3);
   
    y(i+1)=y(i)+dt*(1/6)*(y1+2*y2+2*y3+y4);
end

%displays the required vector
sprintf('The required vector y of Runge-Kutta Method for dt = %.3f is',dt)
y

%This variable stores all calculations for all time steps used to calculate
%errors
global all_solution_RK4;
all_solution_RK4(a,1:(t_end/dt)+1)=y(1:(t_end/dt)+1);

%plot all the curves for this method
plot_graph( 3, dt,t_end, y )
end

