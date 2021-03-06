function plot_graph( a, dt ,t_end, y)
%PLOT Summary of this function goes here
%   Detailed explanation goes here

%plot the graph
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
    plot(0:dt:t_end, y,'LineWidth',1.5,'Color',[rand() rand() rand()])
    warning ('off','all')
    hold on
    grid on
    
    ylabel('y`')
    xlabel('y')
    legend('dt=1','dt=0.5','dt=0.25','dt=0.125','Location','southeast')
    
    warning

end

