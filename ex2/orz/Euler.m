function out = Euler(y0,dt,tEnd)
    out(1) = y0;
    for i=1:1:tEnd/dt
        out(i+1) = out(i) + dt*f_y(out(i));
    end
end