
function [] = implicit_euler(T,dt,Nx,dx)
%IMPLICIT_EULER Summary of this function goes here
%   Detailed explanation goes here

str1=sprintf('Implicit Euler Nx=%0.f for dt=%f', Nx,dt);

prev=T;

residual=1;

A=dt/(dx*dx);
B=1/(1+4*A);
C=A*B;

for i=1:(0.5/dt)
    Told=zeros(size(T));
    Tnew=Told;
    while residual > 1e-6
        for x=2:Nx+1
            for y=2:Nx+1
            residual=0;
            Tnew(x,y)= B*prev(x,y)+C*(Tnew(x-1,y)+Told(x+1,y)+Told(x,y+1)+Tnew(x,y-1));
            residual =residual+Tnew(x,y)-(B*prev(x,y)+C*(Tnew(x-1,y)+Told(x+1,y)+Told(x,y+1)+Tnew(x,y-1)));
            end
        end
                  
        disp('str1')
        Told=Tnew;
    end
   prev=Told;
    
     if i== (0.5/dt) ||i== (0.375/dt) || i== (.25/dt)|| i== (0.125/dt)  
         plotter(Told,Nx, dt, i,str1,4);   
     end
end

end
 
        
        
        
        
        
        
        
        
        
