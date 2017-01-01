clc;
clear

% Boundary of the PDE 
x_l=0;
x_r= 1;

y_d=0;
y_u= 1;

Nx = 7; % J: number of division for x
Ny = 7;

dx = (x_r-x_l) / (Nx+1);
dy = dx;

%generate grid points
x=x_l:dx:x_r;
y=y_d:dy:y_u;

[U,T]=discreditisation(Nx,Ny,dx);

%MATLAB direct solver
tic 
ans1=sol_direct(U,T,Nx) 
toc
figure(1)
surf(y,x,ans1); % 3-D surface plot

%MATLAB direct solver sparse
tic 
ans2=sol_direct(sparse(U),T,Nx)
toc
figure(2)
surf(y,x,ans2); % 3-D surface plot

%Gauss Siedel solver 
%tic 
%ans3=sol_gauss_siedel(U,T,Nx)
%toc
%figure(2)
%surf(y,x,ans2); % 3-D surface plot