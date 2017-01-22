clear all;
T0 = 1/8;


%% explicit euler step
for i = 1:4
    T = T0*i;
    str=sprintf('t=%.3f',T);
    figure(i);
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
            dt = dt/2;
        end   
    end
end

%% implicit euler step
dt = 1/64;
for i = 1:4
    T = T0*i;
    figure(i+4);
    for ni = 1:4
        N = 2^(ni+1)-1;
        dx = 1/(N+1);
        t = 0;
        u = zeros(N+2,N+2);
        u(2:N+1,2:N+1)=1;
        lamb = dt/(dx*dx);
        A1 = gallery('tridiag',N,-1,2,-1);
        A = speye(N*N)+lamb*(kron(speye(N),A1)+kron(A1,speye(N)));
        while(t<=T)
            u_old = u(2:N+1,2:N+1);
            u_new = u_old(:)\A;
            u = zeros(N+2,N+2);
            u(2:N+1,2:N+1) = reshape(u_new,N,N);
            t = t+dt;
         end
         xx = linspace(0,1,N+2);
         yy = xx;
         subplot(2,2,ni);
         surf(xx,yy,u); 
    end
end

 