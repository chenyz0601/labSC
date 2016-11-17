t = [0:0.05:12];
p_t = 10./(1+9*exp(-t));

figure()
plot(t,p_t,'LineWidth',1.5,'Color',[.6 0 0])
grid on
title('Plot of p(t) vs t')
ylabel('p(t)')
xlabel('t')
