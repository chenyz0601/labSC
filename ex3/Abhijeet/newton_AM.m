function [ iter1 ] = newton_AM( y_n,dt,a )
%NEWTON_AM Summary of this function goes here
%   Detailed explanation goes here

eror=1;
iter1=0;

if a==1
        iter1= (y_n+0.5*dt*f(y_n)+3.5*dt*y_n)/(1+0.35*y_n*dt)
elseif a==2
        iter1 = (y_n+0.5*dt*f(y_n))/(1-3.5*dt*(1-y_n/10))
else
 while (abs(eror)> 10^-4)
          iter2= iter1-(iter1-y_n-dt*0.5*(f(y_n)+f(iter1)))/(1-dt*0.5*(f(y_n+eps)-f(y_n)-f(iter1)+f(iter1+eps))/eps);
          eror = iter2-y_n-dt*0.5*(f(iter2)+f(y_n));
          iter1=iter2;
                  end
      end
end

