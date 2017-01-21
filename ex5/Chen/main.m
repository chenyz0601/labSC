clear all;
T = 1/8;


%% explicit euler step
str=sprintf('t=%.3f',4/8);
figure(1);
title(str);
for ni = 1:4
    N = 2^(ni+1)-1;
    dx = 1/(N+1);   
    dt = 1/64;
    for ti = 1:7
        t = 0;
        u = zeros(N+2,N+2);
        u(2:N+1,2:N+1)=1;
        while(t<=T)
            u_new = dt*(u(1:N,2:N+1)+u(3:N+2,2:N+1)+u(2:N+1,1:N)+u(2:N+1,3:N+2)-4*u(2:N+1,2:N+1))/(dx*dx)+u(2:N+1,2:N+1);
            u = zeros(N+2,N+2);
            u(2:N+1,2:N+1) = u_new;
            t = t+dt;
        end
        xx = linspace(0,1,N+2);
        yy = xx;
        subplot(4,7,7*(ni-1)+ti);
        surf(xx,yy,u); 
        ylabel('y');
        xlabel('x');
        zlabel('T');
        dt = dt/2;
    end   
end

 