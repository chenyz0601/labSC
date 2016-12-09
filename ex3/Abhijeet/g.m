function [p_t  ] = g(dt, t_end)


%G defination of the analytical solution of f(x)

%   This function is used to define the analytical solution of the 
%   differential equation 

p_t= zeros(1,t_end/dt);%preallocation to prevent copying again and again while increasing size(increase speed)

for i=1:((t_end/dt+1))
       p_t(i) = 200./(20-10*exp(-7*(i-1)*dt)); % Please define f(y) as y_dy= f(y)
end

end

