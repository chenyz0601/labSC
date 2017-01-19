function [ U ] = discreditisation(Nx,Ny,dx)
%DISCREDITISATION Summary of this function goes here
%   Detailed explanation goes here

U=zeros(Ny*Ny,Ny*Ny);

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
        
       
end

end

