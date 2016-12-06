function out = unsolvableE(h,yn)
    temp = (7*h-1)^2+4*7*yn*h/10;
    out = (temp<0);
end