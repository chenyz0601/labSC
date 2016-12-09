%The given conditions for the solution of the problem

y_0=20; % intial value
t_end= 5; %end time

tic

for i=1:5 
    dt=2^-i; %time steps
    pk_exact= g(dt, t_end);% solves the analytical solution g(t) for a particular t & dt
    
   pk=solver_euler( y_0, dt, t_end,i);%solution by euler method(eplicit)  for a particular t & dt
    E_euler(i)=sqrt((dt/t_end)*sum((pk-pk_exact).^2));%error euler method w.r.t. to analytical solution
    
   pk=solver_heun( y_0, dt, t_end, i); %solution by heuns method  for a particular t & dt
   E_heun(i)=sqrt((dt/t_end)*sum((pk-pk_exact).^2));
     
   pk=solver_imp_euler( y_0, dt, t_end, i); %solution by implicit euler method  for a particular t & dt
   E_imp_euler(i)=sqrt((dt/t_end)*sum((pk-pk_exact).^2));
   
    pk=solver_AM_method( y_0, dt, t_end, i); %solution by 2nd order Adam moulton method  for a particular t & dt
    %E_AM(i)=sqrt((dt/t_end)*sum((pk-pk_exact).^2));
    
    pk=solver_AM_Lin1( y_0, dt, t_end, i); %solution by 2nd order Adam moulton method  for a particular t & dt
    E_AM_Lin1(i)=sqrt((dt/t_end)*sum((pk-pk_exact).^2));
    
    pk=solver_AM_Lin2( y_0, dt, t_end, i); %solution by 2nd order Adam moulton method  for a particular t & dt
    E_AM_lin2(i)=sqrt((dt/t_end)*sum((pk-pk_exact).^2));
    
    
end

 plot_graph (pk_exact, t_end,dt)
  toc  