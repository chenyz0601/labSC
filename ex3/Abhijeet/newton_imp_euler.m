function [ iter1] = newton_imp_euler( y_n,dt )
%NEWTON Summary of this function goes here
%   Detailed explanation goes here
eror=1;
iter1=0;

 while (abs(eror)> 10^-4)
          iter2= iter1-(10*iter1-10*y_n-dt*(70*iter1-7*(iter1)^2))/(10-dt*(56-14*y_n));
          eror = iter2-y_n-dt*(f(iter2));
          iter1=iter2;
      end
 
end

