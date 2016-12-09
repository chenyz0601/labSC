function [ yApproximate ] = Heun( f, y0, dt, tStart, tEnd)
% Heun's Method

yExplicitEuler = ExplicitEuler( f, y0, dt, tStart, tEnd);

syms t y;
f               = sym(f);
TotalSteps      = (tEnd - tStart)./dt + 1; % Arithmetic Mean
yApproximate    = zeros(1, TotalSteps);
yApproximate(1) = y0;

for nStep      = 1:TotalSteps-1
    k1 = eval(subs(f, [t, y], [tStart + dt * (nStep - 1), yApproximate(nStep)           ]));
    k2 = eval(subs(f, [t, y], [tStart + dt * (nStep)    , yApproximate(nStep)+ dt * k1  ]));
    %k2 = eval(subs(f, [t, y], [tStart + dt * (nStep)    , yExplicitEuler(nStep + 1)]));
    yApproximate(nStep + 1)    = yApproximate(nStep) + dt/2 *(k1 + k2); 
end

