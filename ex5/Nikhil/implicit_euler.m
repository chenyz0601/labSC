
function [] = implicit_euler(T,dt,Nx,dx)
%IMPLICIT_EULER Implicit Euler Formulation
%   This function is used to solve the finite diffrenece discredisied
%   matrix using an implicit euler formulation

a = (Nx+1)*(Nx+1);
c = 1/(1 + 4*dt*a);
a=a*c;

Told=T;
%Boundary and Initial Condition

for s=1:0.5/dt
    Tnew = zeros(Nx+2,Nx+2);
    limit = 1;
    
while(limit > 1e-6)
    Res = 0;
    
    for j=2:Nx+1
        for i=2:Nx +1
            %Gauss Siedel in Implicit Euler
            Tnew(i,j) =c*Told(i,j)+ dt*a*( Tnew(i-1,j) + Tnew(i+1,j)  + Tnew(i,j-1) + Tnew(i,j+1));
        end
    end
    
    for j=2:Nx+1
        for i=2:Nx +1
            %Calculating Residual error
            k =  c*Told(i,j)+ dt*a*(Tnew(i-1,j) + Tnew(i+1,j)  + Tnew(i,j-1) + Tnew(i,j+1))- Tnew(i,j);
            Res = Res + k^2;
        end
    end
    
    limit = (1/(Nx*Nx)*Res)^0.5;
end

Told=Tnew;

if s== (0.5/dt) ||s== (0.375/dt) || s== (.25/dt)|| s== (0.125/dt)  
    
    str1=sprintf('ImplicitEulerNx_%0.f_dt_%f_T_%.3f.png', Nx,dt,s*dt);     
    plotter(Told,Nx, dt, s,str1,4);   
end

end
end
        
