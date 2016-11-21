function [ y ] = solver_euler( y_0, dt, t_end,a )
%SOLVER_EULER Explicit Euler Method
%   This function is used find the solution of a differential equation of 
%   the form y'=f(y) using the Explicit Euler Method 

y= zeros(1,t_end/dt);%preallocation to prevent copying again and again while increasing size(improves speed)

y(1)= y_0;

for i=1:(t_end/dt)
    %Defination of Explicit Euler method
    y(i+1)=y(i)+dt*f(y(i));
end

%displays the required vector
sprintf('The required vector y of Euler Method for dt = %.3f is',dt)
y

%This variable stores all calculations for all time steps used to calculate
%errors
global all_solution_euler;
all_solution_euler(a,1:(t_end/dt)+1)=y(1:(t_end/dt)+1);

%plot all the curves for this method
plot_graph( 1, dt,t_end, y )

end

