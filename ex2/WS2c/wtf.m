y_0=1;
dt=[1, 0.5, 0.25, 0.125];
t_end= 5;

for(i=1:size(dt,2))
    pk_exact= g(dt(i), t_end);
    
    pk=solver_euler( y_0, dt(i), t_end );
    E_euler(i)=sqrt((dt(i)/t_end)*sum((pk-pk_exact).^2));
    
    pk=solver_heun( y_0, dt(i), t_end );
    E_heun(i)=sqrt((dt(i)/t_end)*sum((pk-pk_exact).^2));
    
    pk=solver_RK4( y_0, dt(i), t_end );
    E_RK4(i)=sqrt((dt(i)/t_end)*sum((pk-pk_exact).^2));   
end


    err_factor_reduction_euler(2:size(dt,2))=E_euler(2:size(dt,2))./E_euler(1:size(dt,2)-1)
    err_factor_reduction_heun(2:size(dt,2))=E_heun(2:size(dt,2))./E_heun(1:size(dt,2)-1)
    err_factor_reduction_RK4(2:size(dt,2))=E_RK4(2:size(dt,2))./E_RK4(1:size(dt,2)-1)
