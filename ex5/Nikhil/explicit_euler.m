
function [] = explicit_euler(T,dt,Nx,dx)
%EXPLICIT_EULER Summary of this function goes here
%   Detailed explanation goes here

A=dt/(dx*dx);
Tnew=T;
Told=T;
for i=1:(0.5/dt)
    %Defination of Explicit Euler method
    for x=2:Nx+1
            for y=2:Nx+1
                Tnew(x,y)= Told(x,y)+  A*( Told(x-1,y)+Told(x+1,y)+Told(x,y+1)+Told(x,y-1)-4*Told(x,y) );
            end
    end
   Told=Tnew;
    if i== (0.5/dt) ||i== (0.375/dt) || i== (.25/dt)|| i== (0.125/dt) 
        str1=sprintf('Explicit Euler t=%f',i*dt);
        plotter(Told,Nx, dt, i,str1,0);   
    end
end

end

