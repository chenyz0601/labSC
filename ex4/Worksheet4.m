clc;
clear
global var;
var=1;
% Boundary of the PDE 
x_l=0;
x_r= 1;

y_d=0;
y_u= 1;

N =[7]; % J: number of division for x
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
disp(sprintf('\nMATLAB Full Matrix Solver Nx=%.0f',Nx))
sol_direct(U,T,Nx,1,x,y);

%MATLAB direct solver sparse
disp(sprintf('\nMATLAB Sparse Matrix Solver Nx=%.0f',Nx))
sol_direct(sparse(U),T,Nx,2,x,y);


%Gauss Siedel solver 
disp(sprintf('\nMATLAB Sparse Matrix Solver Nx=%.0f',Nx))
sol_gauss_siedel(U,T,Nx,x,y);




end