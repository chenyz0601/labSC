function [] = explicit_euler(T,dt,Nx,dx)
%EXPLICIT_EULER Summary of this function goes here
%   Detailed explanation goes here



A=dt/(dx*dx);

for i=1:(0.5/dt)
    %Defination of Explicit Euler method
    for x=2:Nx+1
            for y=2:Nx+1
                T(x,y)=T(x,y)+A*(T(x-1,y)+T(x+1,y)+T(x,y+1)+T(x,y-1)-4*T(x,y));
            end
    end
    
    if i== (0.5/dt) ||i== (0.375/dt) || i== (.25/dt)|| i== (0.125/dt) 
        str1=sprintf('Explicit Euler t=%f',i*dt);
        plotter(T,Nx, dt, i,str1);   
    end
end


end

