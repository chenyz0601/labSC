function [ y ] = solver_imp_euler( y_0, dt, t_end)
%SOLVER_IMP_EULER Implicit Euler Method
%   This function is used find the solution of a differential equation of 
%   the form y'=f(y) using the implicit Euler Method 

y= zeros(1,t_end/dt+1);%preallocation to prevent copying again and again while increasing size(improves speed)

y(1)= y_0;
a=0;
for i=1:(t_end/dt)
    y(i+1)=newton_imp_euler(y(i),dt);
   
   if y(i+1) <10
          a=a+1;
       end
end

%displays the required vector
%sprintf('The required vector y of Implicit Euler Method for dt = %.5f is',dt)
%disp(y)

if a>0
    disp(sprintf('dt= %f unstable for Implicit Euler Method\n ',dt))
end

%plot all the curves for this method
figure(3)
plot(0:dt:t_end, y,'LineWidth',1.5,'Color',[rand() rand() rand()])
hold on
end

