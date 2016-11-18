function [ output_args ] = solver_euler( y_0, dt, t_end )
%SOLVER_EULER Explicit Euler Method
%   This function is used find the solution of a differential equation of 
%   the form y'=f(y) using the Explicit Euler Method 

y(1)= y_0;

for (i=1:(t_end/dt))
    %Defination of Explicit Euler method
    y(i+1)=y(i)+dt*f(y(i));
end

%displays the required vector
display('The required vector is')
y

%plot the graph

end

