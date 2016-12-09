function out = Heun(y0,dt,tEnd)
    out(1) = 1;
    for i=1:1:tEnd/dt
        temp = out(i) + dt*f_y(out(i));
        out(i+1) = out(i) + 0.5*dt*(f_y(out(i))+f_y(temp));
    end
end