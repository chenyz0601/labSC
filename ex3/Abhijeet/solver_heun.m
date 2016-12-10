function [ y] = solver_heun( y_0, dt, t_end)
%SOLVER_HEUN Method of Heun
%   This function is used find the solution of a differential equation of 
%   the form y'=f(y) using the Method of Heun

y= zeros(1,t_end/dt);%preallocation to prevent copyimng again and agin while increasing size(improves speed)
y(1)= y_0;
a=0;
for i=1:(t_end/dt)
    %Defination of Method of Heun
    y(i+1)=y(i)+dt*f(y(i));
    y(i+1)=y(i)+dt*0.5*(f(y(i))+f(y(i+1)));
    
     if y(i+1) <10
         a=a+1;
       end
end

%displays the required vector
%sprintf('The required vector y of Method of Heun for dt = %.5f is',dt)
%disp(y)

if a>0
    disp(sprintf('dt= %f unstable for Method of Heun \n ',dt))
end


%plot all the curves for this method
figure(2)
plot(0:dt:t_end, y,'LineWidth',1.5,'Color',[rand() rand() rand()])
hold on

end

