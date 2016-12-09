function out = AM(h,yn,x)
    out = 0.5*h*f_y(x)+yn-x+0.5*h*f_y(yn);
end