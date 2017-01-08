function [] = Plot(nX, nY, Method, NodalValue)
figure('Name',['Surface Plot using ', Method, ' of Temperature at inner Nodes', int2str(nX)])
surf(1:nX+2, 1:nY+2, NodalValue)
colorbar
title(['Temperature Distribution when number of inner nodes in each row is ', int2str(nX)])

figure('Name',['Contour Plot using ', Method, ' of Temperature at inner Nodes', int2str(nX)])
contour(NodalValue, 'ShowText', 'on')
title(['Temperature Distribution when number of inner nodes in each row is ', int2str(nX)])
end