p_t = @(t) 200./(20-10*exp(-7*t));
%% a
t = 0:0.1:5;
figure(1);
plot(t, p_t(t));
axis([0,5,0,20]);
title('Plot of p(t)');
hold on;
%% b
y0 = 20;
tEnd = 5;
figure(2);
for i=0:5
    dt = 0.5^i;
    t = 0:dt:tEnd;
    plot(t,Euler(y0,dt,tEnd));    
    hold on;
end
title('Explicit Euler');
axis([0,5,0,20]);
legend('dt=1','dt=1/2','dt=1/4','dt=1/8','dt=1/16','dt=1/32','Location','southeast');

figure(3);
for i=0:5   
    dt = 0.5^i;
    t = 0:dt:tEnd;
    plot(t,Heun(y0,dt,tEnd));
    hold on;
end
title('Heun');
axis([0,5,0,20]);
legend('dt=1','dt=1/2','dt=1/4','dt=1/8','dt=1/16','dt=1/32','Location','southeast');
%% c & d
y0 = 20;
tEnd = 5;
figure(3);
for i=0:5
    dt = 0.5^i;
    t = 0:dt:tEnd;
    plot(t,ImplicitEuler(y0,dt,tEnd));    
    hold on;
end
t = 0:0.1:5;
plot(t, p_t(t));
title('Implicit Euler');
axis([0,5,0,20]);
legend('dt=1','dt=1/2','dt=1/4','dt=1/8','dt=1/16','dt=1/32','given solution','Location','southeast');

figure(4);
for i=0:5   
    dt = 0.5^i;
    t = 0:dt:tEnd;
    plot(t,AM2nd(y0,dt,tEnd));
    hold on;
end
t = 0:0.1:5;
plot(t, p_t(t));
title('2nd order Adams-Moulton');
axis([0,5,0,20]);
legend('dt=1','dt=1/2','dt=1/4','dt=1/8','dt=1/16','dt=1/32','given solution','Location','southeast');
%% e & f
figure(5);
for i=0:5   
    dt = 0.5^i;
    t = 0:dt:tEnd;
    plot(t,AM2ndLinear1(y0,dt,tEnd));
    hold on;
end
t = 0:0.1:5;
plot(t, p_t(t));
title('2nd order Adams-Moulton with linearisation 1');
axis([0,5,0,20]);
legend('dt=1','dt=1/2','dt=1/4','dt=1/8','dt=1/16','dt=1/32','given solution','Location','southeast');

figure(6);
for i=0:5   
    dt = 0.5^i;
    t = 0:dt:tEnd;
    plot(t,AM2ndLinear2(y0,dt,tEnd));
    hold on;
end
t = 0:0.1:5;
plot(t, p_t(t));
title('2nd order Adams-Moulton with linearisation 1');
axis([0,5,0,20]);
legend('dt=1','dt=1/2','dt=1/4','dt=1/8','dt=1/16','dt=1/32','given solution','Location','southeast');