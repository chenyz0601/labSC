function [ y] = solver_heun( y_0, dt, t_end, a)
%SOLVER_HEUN Method of Heun
%   This function is used find the solution of a differential equation of 
%   the form y'=f(y) using the Method of Heun

y= zeros(1,t_end/dt);%preallocation to prevent copyimng again and agin while increasing size
y(1)= y_0;

for i=1:(t_end/dt)
    %Defination of Method of Heun
    y(i+1)=y(i)+dt*f(y(i));
    y(i+1)=y(i)+dt*0.5*(f(y(i))+f(y(i+1)));
end

%displays the required vector
sprintf('The required vector y of Method of Heun for dt = %.3f is',dt)
y

%This variable stores all calculations for all time steps used to calculate
%errors
global all_solution_heun;
all_solution_heun(a,1:(t_end/dt)+1)=y(1:(t_end/dt)+1);

%plot all the curves for this method
plot_graph( 2, dt,t_end, y )

end

