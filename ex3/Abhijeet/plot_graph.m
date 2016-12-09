function [ output_args ] = plot_graph(p_t, t_end,dt )
%PLOT_GRAPH Plots the required graphs
%   plots the the analytical solution in each graph and also does the
%   settings for each of the graphs

figure(1)%(Explicit_Euler_Method)
title('Plot of y` vs y (Explicit Euler Method)')
plot(0:dt:t_end,p_t,'LineWidth',1.5,'Color',[0 0 0])
legend('dt=0.5','dt=0.25','dt=0.125','dt=0.0625','dt=0.03125','exact solution','Location','southeast')
hold on
grid on
axis([0,5,0,20])      
ylabel('y`')
xlabel('y')

figure(2)%(Explicit_Heun_Method)
title('Plot of y` vs y (Heun Method)')
plot(0:dt:t_end,p_t,'LineWidth',1.5,'Color',[0 0 0])
legend('dt=0.5','dt=0.25','dt=0.125','dt=0.0625','dt=0.03125','exact solution','Location','southeast')
hold on
grid on
axis([0,5,0,20])      
ylabel('y`')
xlabel('y')

figure(3)%(Implicit_Euler_Method)
title('Plot of y` vs y (Implicit Euler Method)')
plot(0:dt:t_end,p_t,'LineWidth',1.5,'Color',[0 0 0])
legend('dt=0.5','dt=0.25','dt=0.125','dt=0.0625','dt=0.03125','exact solution','Location','southeast')
hold on
grid on
axis([0,5,0,20])      
ylabel('y`')
xlabel('y')

figure(4)%(Adams_Moulton_Method)
title('Plot of y` vs y (Adams Moulton Method(2nd order))')
plot(0:dt:t_end,p_t,'LineWidth',1.5,'Color',[0 0 0])
legend('dt=0.5','dt=0.25','dt=0.125','dt=0.0625','dt=0.03125','exact solution','Location','southeast')
hold on
grid on
axis([0,5,0,20])      
ylabel('y`')
xlabel('y')

figure(5)%(Adams_Moulton_Method-Lin1)
title('Plot of y` vs y (Adams Moulton Lin1)')
plot(0:dt:t_end,p_t,'LineWidth',1.5,'Color',[0 0 0])
legend('dt=0.5','dt=0.25','dt=0.125','dt=0.0625','dt=0.03125','exact solution','Location','southeast')
hold on
grid on
axis([0,5,0,20])      
ylabel('y`')
xlabel('y')

figure(6)%(Adams_Moulton_Method-Lin2)
title('Plot of y` vs y (Adams Moulton Lin2)')
plot(0:dt:t_end,p_t,'LineWidth',1.5,'Color',[0 0 0])
legend('dt=0.5','dt=0.25','dt=0.125','dt=0.0625','dt=0.03125','exact solution','Location','southeast')
hold on
grid on
axis([0,5,0,20])      
ylabel('y`')
xlabel('y')
end

