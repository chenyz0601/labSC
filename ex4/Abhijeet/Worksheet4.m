clc;
clear

% Boundary of the PDE 
x_l=0;
x_r= 1;

y_d=0;
y_u= 1;

global var;
var=1;

N =[7,15,31,63,127]; % J: number of division for x
error=zeros(1,size(N,2));

for i=1:size(N,2)
Nx=N(i);
Ny = Nx;

dx = (x_r-x_l) / (Nx+1);
dy = dx;

%generate grid points
x=x_l:dx:x_r;
y=x;

[U,T]=discreditisation(Nx,Ny,dx);

%MATLAB direct solver
if (Nx<100)
fprintf('\nMATLAB Full Matrix Solver Nx=%.0f\n',Nx)
sol_direct(U,T,Nx,1,x,y);
end

%MATLAB direct solver sparse
if (Nx<100)
fprintf('\nMATLAB Sparse Matrix Solver Nx=%.0f\n',Nx)
sol_direct(sparse(U),T,Nx,2,x,y);
end

%Gauss Siedel solver 
fprintf('\nMATLAB Gauss Seidel Matrix Solver Nx=%.0f\n',Nx)
ans1=sol_gauss_siedel(sparse(U),T,Nx,x,y);

%analytical solution
analytical=zeros(Nx+2,Nx+2);
for a=1:Nx+1
analytical(a,1:Nx+1)=sin(pi*(a-1)/(Nx+1))*sin(pi*(0:Nx)./(Nx+1));
end

%error analysis Gauss Seidel
error(i)=sqrt((sum(sum((ans1-analytical).^2),2))/(Nx*Ny));
end
error_reduction(2:size(error,2))=error(1:size(error,2)-1)./error(2:size(error,2));

%print gauss table
fprintf('\n\n')
disp('      GAUSS SEIDEL ERROR ANALYSIS')
disp(table(N', error', error_reduction','VariableNames',{'Division' 'error' 'error_red'}))
