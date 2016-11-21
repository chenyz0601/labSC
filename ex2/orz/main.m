p_t = @(t) 10./(1+9*exp(-t));
%% a
t = 1:0.1:5;
figure(1);
plot(t, p_t(t));
title('Plot of p(t)');
hold on;
%% b
y0 = 1;
tEnd = 5;
figure(2);
for i=0:3
    dt = 0.5^i;
    t = 0:dt:tEnd;
    subplot(2,2,1);
    plot(t,Euler(y0,dt,tEnd));
    title('Explicit Euler');
    hold on;
    e_Euler(i+1) = sqrt(dt/tEnd)*norm(p_t(t)-Euler(y0,dt,tEnd));
    subplot(2,2,2);
    plot(t,Heun(y0,dt,tEnd));
    title('Heun');
    hold on;
    e_Heun(i+1) = sqrt(dt/tEnd)*norm(p_t(t)-Heun(y0,dt,tEnd));
    subplot(2,2,3);
    plot(t,RungeKutta(y0,dt,tEnd));
    title('Runge Kutta 4');
    hold on;
    e_RK(i+1) = sqrt(dt/tEnd)*norm(p_t(t)-RungeKutta(y0,dt,tEnd));
    ee_Euler(i+1) = sqrt(dt/tEnd)*norm(Euler(y0,dt,tEnd)-RungeKutta(y0,dt,tEnd));
    ee_Heun(i+1) = sqrt(dt/tEnd)*norm(Heun(y0,dt,tEnd)-RungeKutta(y0,dt,tEnd));
    ee_RK(i+1) = sqrt(dt/tEnd)*norm(RungeKutta(y0,dt,tEnd)-RungeKutta(y0,dt,tEnd));
end
subplot(2,2,1);
legend('dt=1','dt=1/2','dt=1/4','dt=1/8','Location','southeast');
subplot(2,2,2);
legend('dt=1','dt=1/2','dt=1/4','dt=1/8','Location','southeast');
subplot(2,2,3);
legend('dt=1','dt=1/2','dt=1/4','dt=1/8','Location','southeast');
%% c,d,e
figure(3);
subplot(2,2,1);
plot(1:1:4,log(e_Euler));
s = (log(e_Euler(4))-log(e_Euler(1)))/3;
title(['Explicit Euler, slope=' num2str(s)]);
xlabel('-log(dt)');
ylabel('log(error)');
subplot(2,2,2);
plot(1:1:4,log(e_Heun));
s = (log(e_Heun(4))-log(e_Heun(1)))/3;
title(['Heun, slope=' num2str(s)]);
xlabel('-log(dt)');
ylabel('log(error)');
subplot(2,2,3);
plot(1:1:4,log(e_RK));
s = (log(e_RK(4))-log(e_RK(1)))/3;
title(['Runge Kutta, slope=' num2str(s)]);
xlabel('-log(dt)');
ylabel('log(error)');
ee_Euler
ee_Heun
ee_Rk