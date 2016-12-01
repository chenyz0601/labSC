function out = NewtonEuler(x0,accuracy,dt,yn)
    out = x0;
    while(abs(E(dt,yn,out))>accuracy)
        out = out - E(dt,yn,out)/dE(dt,out);
    end
end