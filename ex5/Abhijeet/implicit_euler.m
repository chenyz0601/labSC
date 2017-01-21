
function [] = implicit_euler(T,dt,Nx,dx)
%IMPLICIT_EULER Summary of this function goes here
%   Detailed explanation goes here

str1=sprintf('Implicit Euler Nx=%0.f for dt=%f', Nx,dt);
%padding with zeros;
prev=T;

residual=1;

A=dt/(dx*dx);
B=1/(1+4*A);
C=A*B;

for i=1:(0.5/dt)
    
    while residual > 1e-6
        for x=2:Nx+1
            for y=2:Nx+1
            
            T(x,y)= B*prev(x,y)+C*(T(x-1,y)+T(x+1,y)+T(x,y+1)+T(x,y-1));
            end
        end
         prev=T;
           
        residual= max(max(abs(T-prev)));
        
    end
   
    
     if i== (0.5/dt) ||i== (0.375/dt) || i== (.25/dt)|| i== (0.125/dt)  
         plotter(ans1,Nx, dt, i,str1);   
     end
end

end
 
        
        
        
        
        
        
        
        
        
