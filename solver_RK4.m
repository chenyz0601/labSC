function [ output_args ] = solver_RK4( y_0, dt, t_end  )
%SOLVER_RK4 Fourth Order Runge-Kutta Method
%   This function is used find the solution of a differential equation of 
%   the form y'=f(y) using the Fourth Order RungeKutta Method

y(1)= y_0;

for (i=1:(t_end/dt))
   %Defination of Fourth Order Runge-Kutta Method
   y1 = f(y(i));
   y2 = f(y(i)+dt*0.5*y1);
   y3 = f(y(i)+dt*0.5*y2);
   y4 = f(y(i)+dt*y3);
   
    y(i+1)=y(i)+dt*(1/6)*(y1+2*y2+2*y3+y4);
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

