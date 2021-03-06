function [ iter1 ] = newton_AM( y_n,dt,a )
%NEWTON_AM Newtons Method 
%   This function handles the newton method step for Adams Moulton Method
%   w/ or w/o the linearisation

eror=1;
iter1=y_n/2;
count=0;


 while (abs(eror)> 10^-4)
     if  a==1 % lin1 is applied
              iter1= (y_n+0.5*dt*f(y_n)+3.5*dt*y_n)/(1+0.35*y_n*dt);
              break;
     end
     
     if a==2 % lin2 is applied
              iter1= (y_n+0.5*dt*f(y_n))/(1-3.5*dt*(1-y_n/10));
              break;
     end
     
     count=count+1;
     
     %x_n+1=x_n - G(X)/G'(X)
     iter2= iter1-(iter1-y_n-dt*0.5*(f(y_n)+f(iter1)))/(1-dt*0.5*(f(y_n+eps)-f(y_n-eps)-f(iter1-eps)+f(iter1+eps))/(2*eps));
    
     %eror to check how close to 0 is G(X)
     eror = iter2-y_n-dt*0.5*(f(iter2)+f(y_n));
     
     iter1=iter2;
     
     %steps to perform if unsolvable
   
     if (eror >1000 || count> 100000) && a==0 % unsolavable and no linearisation is applied
              iter1=69;
              break;
     end
          
 end
      
end

