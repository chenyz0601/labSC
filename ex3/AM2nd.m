function out = AM2nd(y0,dt,tEnd)
    out = zeros(1,1+tEnd/dt);
    out(1) = y0;
    for i=1:1:tEnd/dt
        yn = out(i);
        if unsolvableAM(dt,yn)
            break;
        end
        out(i+1) = NewtonAM(yn,0.0001,dt,yn);
    end
end