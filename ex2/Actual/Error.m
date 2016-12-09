function [ E ] = Error( p, pExact, dt, tEnd )
%Approximate Error Computation
E = sqrt((dt / tEnd) * sum((p - pExact).^2));
end
