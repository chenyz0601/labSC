function [ yApproximate ] = ExplicitEuler( f, y0, dt, tStart, tEnd)
%Explitit Euler Method

syms t y;
f               = sym(f);
TotalSteps      = (tEnd - tStart)./dt + 1; % Arithmetic Mean
yApproximate    = zeros(1, TotalSteps);
yApproximate(1) = y0;

for nStep      = 1:TotalSteps-1
    k1 = eval(subs(f, [t, y], [tStart + dt * (nStep - 1), yApproximate(nStep)]));
    yApproximate(nStep + 1)    = yApproximate(nStep) + dt * k1; 
end

