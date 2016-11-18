function [p_t  ] = g(dt, t_end)

%F defination of the differential equation

%   This function is used to define the differential equation that needs to
%   be solved and has to be defined in the format y'=f(y)

for (i=1:((t_end/dt)+1))
p_t(i) = 10./(1+9*exp(-i*dt)); % Please define f(y) as y_dy= f(y)
end
end

