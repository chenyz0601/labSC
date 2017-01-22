clc;
clear;

%Boundary of the PDE 
x_l=0;
x_r= 1;

y_d=0;
y_u= 1;


global j;
j=1;

N =[3,7,15,31]; % number of division for x
dt_all=[1/64, 1/128, 1/256, 1/512, 1/1024, 1/2048, 1/4096];


fprintf('Von Nuemann Stability Analysis\n\n')
%Explicit Method
for i=1:size(N,2)
Nx=N(i);
Ny = Nx;
dx = (x_r-x_l) / (Nx+1);

%init conditions T_init=1 T_bc=0
T= zeros(Nx+2,Nx+2);
T(2:Nx+1,2:Nx+1)=1;

for l=1:size(dt_all,2)
    dt=dt_all(l);
    
    explicit_euler(T,dt,Nx,dx);
end

end

%Implicit Method
for i=1:size(N,2)
Nx=N(i);
Ny = Nx;
dx = (x_r-x_l) / (Nx+1);

%init conditions T_init=1 T_bc=0
T= zeros(Nx+2,Nx+2);
T(2:Nx+1,2:Nx+1)=1;
 
implicit_euler(T,dt_all(1),Nx,dx);

end

%Save the plots
SaveImage
