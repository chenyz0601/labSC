function plot_graph( a, dt,t_end, y )
%PLOT This function plots all the results obtained by the solvers

%The variable 'a' acts as an identifier for for where is the call
% made and plot in the respective figure

if (a==1)
    figure(1)
    title('Plot of y` vs y (Explicit Euler Method)')
end

if(a==2)
    figure(2)
    title('Plot of y` vs y (Method of Heun)')
end

if(a==3)
    figure(3)
    title('Plot of y` vs y (The Runge-Kutta Method)')
end
 
%plot the graph 
plot(0:dt:t_end, y,'Color',[rand() rand() rand()])
hold on
grid on
    
ylabel('y`')
xlabel('y')
    
end

