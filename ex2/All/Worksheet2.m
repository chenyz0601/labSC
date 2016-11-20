%The given conditions for the solution of the problem
y_0=1;
dt=[1,  0.25,0.5, 0.125];
t_end= 5;

%These variables are reqired for the calculation of ~E 
dt= sort(dt,'descend');
global all_solution_euler;
global all_solution_heun;
global all_solution_RK4;

%preallocations to prevent copying again and again while increasing size
E_euler=zeros(1,size(dt,2));
E_heun=zeros(1,size(dt,2));
E_RK4=zeros(1,size(dt,2));

E_euler_new=zeros(1,size(dt,2));
E_heun_new=zeros(1,size(dt,2));
E_RK4_new=zeros(1,size(dt,2));

for i=1:size(dt,2)
    pk_exact= g(dt(i), t_end);% solves the analytical solution g(t) for a particular t & dt
    
    [pk]=solver_euler( y_0, dt(i), t_end,i );%solution by euler method  for a particular t & dt
    E_euler(i)=sqrt((dt(i)/t_end)*sum((pk-pk_exact).^2));%error euler method w.r.t. to analytical solution
    
    pk=solver_heun( y_0, dt(i), t_end, i ); %solution by heuns method  for a particular t & dt
    E_heun(i)=sqrt((dt(i)/t_end)*sum((pk-pk_exact).^2));%error euler method w.r.t. to analytical solution
    
    pk=solver_RK4( y_0, dt(i), t_end, i );%solution by runge kutta method  for a particular t & dt
    E_RK4(i)=sqrt((dt(i)/t_end)*sum((pk-pk_exact).^2)); %error euler method w.r.t. to analytical solution  
end

%this for loop finds the error w.r.t to last element of dt as it is smallest
%due to sort.
for i=1:size(dt,2)
    E_euler_new(i) = sqrt((dt(i)/t_end)*sum((all_solution_euler(i,1:(t_end/dt(i)))-all_solution_euler(size(dt,2), 1 : dt(i)/dt(size(dt,2)):(t_end/dt(size(dt,2))))).^2));
    E_heun_new(i) = sqrt((dt(i)/t_end)*sum((all_solution_heun(i,1:(t_end/dt(i)))-all_solution_heun(size(dt,2), 1 : dt(i)/dt(size(dt,2)):(t_end/dt(size(dt,2))))).^2));
    E_RK4_new(i) = sqrt((dt(i)/t_end)*sum((all_solution_RK4(i,1:(t_end/dt(i)))-all_solution_RK4(size(dt,2), 1 : dt(i)/dt(size(dt,2)):(t_end/dt(size(dt,2))))).^2));
end

%These lines find the reduction in error with refinement of dt as dt is in
%descending order
err_factor_reduction_euler(2:size(dt,2))=E_euler(2:size(dt,2))./E_euler(1:size(dt,2)-1);
err_factor_reduction_heun(2:size(dt,2))=E_heun(2:size(dt,2))./E_heun(1:size(dt,2)-1);
err_factor_reduction_RK4(2:size(dt,2))=E_RK4(2:size(dt,2))./E_RK4(1:size(dt,2)-1);
    
%Dispaly the home work table
disp('          EXPLICIT EULER METHOD (q=1)')
T1=table(dt', E_euler', err_factor_reduction_euler',E_euler_new','VariableNames',{'dt' 'error' 'error_red' 'error_app'});
disp(T1)

disp('              METHOD OF HEUN (q=2)')
T2=table(dt', E_heun', err_factor_reduction_heun',E_heun_new','VariableNames',{'dt' 'error' 'error_red' 'error_app'});
disp(T2)

disp('           RUNGE-KUTTA METHOD (q=4)')
T3=table(dt', E_RK4', err_factor_reduction_RK4',E_RK4_new','VariableNames',{'dt' 'error' 'error_red' 'error_app'});
disp(T3)