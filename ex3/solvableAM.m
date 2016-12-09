function out = solvableAM(h,yn)
    temp = (3.5*h-1)^2+7*h*(yn+0.5*h*f_y(yn))/5;
    out = (temp<0);
end