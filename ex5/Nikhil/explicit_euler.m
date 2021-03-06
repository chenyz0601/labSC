
function [] = explicit_euler(T,dt,Nx,dx)
%EXPLICIT_EULER Explicti Euler Formulation
%   This function is used to solve the finite diffrenece discredisied
%   matrix using an explict euler formulation

%Von_Neumann Stability Analysis Check
if (dt > 0.5*dx*dx)
    fprintf('Explicit Euler unstable for Nx=%.0f and dt=%f\n',Nx,dt)
end

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
        str1=sprintf('ExplicitEulerNx_%0.f_dt_%f_T_%.3f.png', Nx,dt,i*dt);
        plotter(Told,Nx, dt, i,str1,0);   
    end
end

end

