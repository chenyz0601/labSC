function [] = explicit_euler(U,T,dt,Nx)
%EXPLICIT_EULER Summary of this function goes here
%   Detailed explanation goes here

global var;

for (i=1:((4/8)/dt))
    %Defination of Explicit Euler method
    T=T+(dt/Nx^2)*U*T;
    
    if i== ((4/8)/dt) ||i== ((3/8)/dt) || i== ((2/8)/dt)|| i== ((1/8)/dt) 
        plotter(T,Nx, dt, i);   
    end
end
var=var+1;

end

