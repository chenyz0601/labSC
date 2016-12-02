function out = AM2ndLinear2(y0,dt,tEnd)
    out = zeros(1,1+tEnd/dt);
    out(1) = y0;
    for i=1:1:tEnd/dt
        yn = out(i);
        if unsolvableAM(dt,yn)
            out(i+1) = (yn+0.5*dt*f_y(yn))/(1-3.5*dt*(1-yn/10));
        else
            out(i+1) = NewtonAM(yn,0.0001,dt,yn);
        end
    end
end