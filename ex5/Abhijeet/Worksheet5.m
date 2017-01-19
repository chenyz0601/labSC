clc;
clear

% Boundary of the PDE 
x_l=0;
x_r= 1;

y_d=0;
y_u= 1;

global var;
global j;
var=1;
j=1;

N =[3,7,15,31]; % number of division for x
dt_all=[1/64, 1/128, 1/256, 1/512, 1/1024, 1/2048, 1/4096];
tic;
for i=1:size(N,2)
Nx=N(i);
Ny = Nx;

dx = (x_r-x_l) / (Nx+1);
dy = dx;

%space discredisation
[U]=discreditisation(Nx,Ny,dx);

%init conditions
T=ones(Ny*Ny,1);

for l=1:size(dt_all,2)
    dt=dt_all(l);
    
    %explicit Euler solver
    explicit_euler(sparse(U),T,dt,Nx);
    
    %implicit euler Solver
   % implicit_euler(sparse(U),T,dt,Nx);
    
    
end


end
toc;