function [ output_args ] = solver_heun( y_0, dt, t_end)
%SOLVER_HEUN Method of Heun
%   This function is used find the solution of a differential equation of 
%   the form y'=f(y) using the Method of Heun

y(1)= y_0;

for (i=1:(t_end/dt))
    %Defination of Method of Heun
    y(i+1)=y(i)+dt*f(y(i));
    y(i+1)=y(i)+dt*0.5*(f(y(i))+f(y(i+1)));
end

%displays the required vector
display('The required vector is')
y

%plot the graph
figure()
plot(0:dt:t_end, y,'LineWidth',1.5,'Color',[.6 0 0])
grid on
title('Plot of y` vs y')
ylabel('y`')
xlabel('y')
end

