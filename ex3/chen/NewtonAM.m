function out = NewtonAM(x0,accuracy,dt,yn)
    out = x0;
    while(abs(AM(dt,yn,out))>accuracy)
        out = out - AM(dt,yn,out)/dAM(dt,out);
    end
end