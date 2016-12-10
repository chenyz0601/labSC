function [ y ] = solver_euler( y_0, dt, t_end)
%SOLVER_EULER Explicit Euler Method
%   This function is used find the solution of a differential equation of 
%   the form y'=f(y) using the Explicit Euler Method 

y= zeros(1,t_end/dt);%preallocation to prevent copying again and again while increasing size(improves speed)

y(1)= y_0;
a=0;
for i=1:(t_end/dt)
    %Defination of Explicit Euler method
    y(i+1)=y(i)+dt*f(y(i));
     if y(i+1) <10
          a=a+1;
       end
end

%displays the required vector
%sprintf('The required vector y of Euler Method for dt = %.5f is',dt)
%disp(y)

if a>0
    disp(sprintf('dt= %f unstable for Explicit Euler Method \n ',dt))
end

%plot all the curves for this method
figure(1)
plot(0:dt:t_end, y,'LineWidth',1.5,'Color',[rand() rand() rand()])
hold on

end

