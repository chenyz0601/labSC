function out = ImplicitEuler(y0,dt,tEnd)
    out = zeros(1,1+tEnd/dt);
    out(1) = y0;
    for i=1:1:tEnd/dt
        yn = out(i);
        if unsolvableE(dt,yn)
            break;
        end
        out(i+1) = NewtonEuler(yn,0.0001,dt,yn);
    end
end