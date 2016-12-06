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
sprintf('The required vector y of Euler Method for dt = %.5f is',dt)
disp(y)

%plot all the curves for this method
figure(1)
plot(0:dt:t_end, y,'LineWidth',1.5,'Color',[rand() rand() rand()])
hold on

end

