clear;
clc;
Nx = 3; % J: number of division for x
Ny = 3;
a=1
b=1
U= zeros(Nx*Nx,Ny*Ny);
T=zeros(1,Nx*Nx)
dx=1/(Nx+1);
for i=1:Ny*Ny
    
    U(i,i)=-4;
    
    if(i-1>0 && mod((i-1),Nx)~=0)
        U(i-1,i)=1;
    end
        if(i+1<=Nx*Nx && mod((i),Nx)~=0)
        U(i+1,i)=1;
        end
   
        if(i+Nx<=Nx*Nx)
            U(i+Nx,i)=1;
        end
        if(i-Nx>0)
            U(i-Nx,i)=1;
        end
        
        T(i)=dx^2*-2*pi*pi*sin(pi*a*(Nx+1)^-1)*sin(pi*b*(Nx+1)^-1);
        b=b+1;
        if(b>Nx)
            b=1;
            a=a+1;
        end
end
spy(U)
U

T

q=inv(U)*T'