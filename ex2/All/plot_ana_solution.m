function [ output_args ] = plot_ana_solution( pk_exact, dt, t_end )
%%PLOT This function plots analytical solution

figure(1)
plot(0:dt:t_end,pk_exact,'LineWidth',1.5,'Color',[0 0 0])
legend('dt=1','dt=0.5','dt=0.25','dt=0.125','exact solution','Location','southeast')
 figure(2)
 plot(0:dt:t_end,pk_exact,'LineWidth',1.5,'Color',[0 0 0])
legend('dt=1','dt=0.5','dt=0.25','dt=0.125','exact solution','Location','southeast')
  figure(3)
plot(0:dt:t_end,pk_exact,'LineWidth',1.5,'Color',[0 0 0])
legend('dt=1','dt=0.5','dt=0.25','dt=0.125','exact solution','Location','southeast')

end

