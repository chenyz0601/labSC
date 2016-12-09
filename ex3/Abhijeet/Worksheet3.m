%The given conditions for the solution of the problem

y_0=20; % intial value
t_end= 5; %end time
deltaT=[1/2, 1/4, 1/8, 1/16, 1/32];
tic

for i=1:5 
    dt=deltaT(i); %time steps
    pk_exact= g(dt, t_end);% solves the analytical solution g(t) for a particular t & dt
    
    pk=solver_euler( y_0, dt, t_end);%solution by euler method(eplicit)  for a particular t & dt
    E_euler(i)=sqrt((dt/t_end)*sum((pk-pk_exact).^2));%error euler method w.r.t. to analytical solution
    
    pk=solver_heun( y_0, dt, t_end); %solution by heuns method  for a particular t & dt
    E_heun(i)=sqrt((dt/t_end)*sum((pk-pk_exact).^2));
     
    pk=solver_imp_euler( y_0, dt, t_end); %solution by implicit euler method  for a particular t & dt
    E_imp_euler(i)=sqrt((dt/t_end)*sum((pk-pk_exact).^2));
   
    pk=solver_AM_method( y_0, dt, t_end); %solution by 2nd order Adam moulton method  for a particular t & dt
    E_AM(i)=sqrt((dt/t_end)*sum((pk-pk_exact).^2));
    
    pk=solver_AM_Lin1( y_0, dt, t_end); %solution by 2nd order Adam moulton method  for a particular t & dt
    E_AM_Lin1(i)=sqrt((dt/t_end)*sum((pk-pk_exact).^2));
    
    pk=solver_AM_Lin2( y_0, dt, t_end); %solution by 2nd order Adam moulton method  for a particular t & dt
    E_AM_Lin2(i)=sqrt((dt/t_end)*sum((pk-pk_exact).^2));
    
    
end

%plot functions lengends titles etc
 plot_graph (pk_exact, t_end,dt)
 
 %error reduction calculation
 err_red_euler(2:5)=E_euler(1:4)./E_euler(2:5);
 err_red_heun(2:5)=E_heun(1:4)./E_heun(2:5);
 err_red_imp(2:5)=E_imp_euler(1:4)./E_imp_euler(2:5);
 err_red_AM(2:5)=E_AM(1:4)./E_AM(2:5);
 err_red_Lin1(2:5)=E_AM_Lin1(1:4)./E_AM_Lin1(2:5);
 err_red_Lin2(2:5)=E_AM_Lin2(1:4)./E_AM_Lin2(2:5);
 
 %Dispaly the home work table
disp('          EXPLICIT EULER METHOD (q=1)')
disp(table(deltaT', E_euler', err_red_euler','VariableNames',{'dt' 'error' 'error_red'}))

disp('              METHOD OF HEUN (q=2)')
disp(table(deltaT', E_heun', err_red_heun','VariableNames',{'dt' 'error' 'error_red'}))

disp('          IMPLICIT EULER METHOD (q=1)')
disp(table(deltaT', E_imp_euler', err_red_imp','VariableNames',{'dt' 'error' 'error_red'}))


disp('          ADAMS MOULTON METHOD (q=2)')
disp(table(deltaT', E_AM', err_red_AM','VariableNames',{'dt' 'error' 'error_red'}))

disp('          ADAMS MOULTON METHOD- Lin 1 (q=2)')
disp(table(deltaT', E_AM_Lin1', err_red_Lin1','VariableNames',{'dt' 'error' 'error_red'}))

disp('          ADAMS MOULTON METHOD- Lin 2 (q=2)')
disp(table(deltaT', E_AM_Lin2', err_red_Lin2','VariableNames',{'dt' 'error' 'error_red'}))

toc  