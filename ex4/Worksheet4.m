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
dy = (y_u-y_d) / (Ny+1);

%generate grid points
x=x_l:dx:x_r;
y=y_d:dy:y_u;
T=zeros(Nx,Ny);
U=T
for j=1:Ny
    for i=1:Nx
        if(i=j)
            U(i,j)=4;
        else if(i-1=j)
            U(i,j)=1; 
        else if(i-1=j)
        T(i,j)= dx^2*-2*pi*pi*sin(pi*i*(Nx+1)^-1)*sin(pi*j*(Nx+1)^-1);
    end
end

b= = tridiag(1, −4, 1)

figure(1)

%surf(y,x,u); % 3-D surface plot
