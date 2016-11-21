function [p_t  ] = g(dt, t_end)

%G defination of the solution of the differential equation

%   This function is used to define the solution of the differential equation that needs to
%   be solved 

p_t= zeros(1,t_end/dt);%preallocation to prevent copying again and again while increasing size(increase speed)

for i=1:((t_end/dt+1))
p_t(i) = 10./(1+9*exp(-(i-1)*dt)); % Please define f(y) as y_dy= f(y)
end
end

