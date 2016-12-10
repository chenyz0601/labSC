function [ iter1] = newton_imp_euler( y_n,dt )
%NEWTON_IMP_EULER Newtons Method 
%   This function handles the newton method step for Implicit Euler Method


eror=1;
iter1=y_n;

 while (abs(eror)> 10^-4)
     %x_n+1=x_n - G(X)/G'(X)
     iter2= iter1-(10*iter1-10*y_n-dt*(70*iter1-7*(iter1)^2))/(10-dt*(56-14*y_n));
      
     %eror to check how close to 0 is G(X)
     eror = iter2-iter1;
          
     iter1=iter2;
 end
 
end

