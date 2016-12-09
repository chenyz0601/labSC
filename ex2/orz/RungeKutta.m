function out = RungeKutta(y0,dt,tEnd)
    out(1) = 1;
    for i=1:1:tEnd/dt
        k1 = f_y(out(i));
        k2 = f_y(out(i)+dt*k1/2);
        k3 = f_y(out(i)+dt*k2/2);
        k4 = f_y(out(i)+dt*k3);
        out(i+1) = out(i) + dt*(k1/6+k2/3+k3/3+k4/6);
    end
end
