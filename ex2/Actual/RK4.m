function [ yApproximate ] = RK4( f, y0, dt, tStart, tEnd)
%RK4 Method
%yExplicitEuler = ExplicitEuler( f, y0, dt, tStart, tEnd);

syms t y;
f               = sym(f);
TotalSteps      = (tEnd - tStart)./dt + 1; % Arithmetic Mean
yApproximate = zeros(1, TotalSteps);
yApproximate(1) = y0;

for nStep      = 1 : TotalSteps-1
    k1 = eval(subs(f, [t, y], [tStart + dt * (nStep - 1)        , yApproximate(nStep)               ]));
    k2 = eval(subs(f, [t, y], [tStart + dt * (nStep - 1) + dt/2 , yApproximate(nStep) + k1 * dt/2   ]));
    k3 = eval(subs(f, [t, y], [tStart + dt * (nStep - 1) + dt/2 , yApproximate(nStep) + k2 * dt/2   ]));
    k4 = eval(subs(f, [t, y], [tStart + dt * (nStep)            , yApproximate(nStep) + k3 * dt     ]));
    yApproximate(nStep + 1) = yApproximate(nStep) + dt/6 * (k1 + 2*k2 + 2*k3 + k4);
end