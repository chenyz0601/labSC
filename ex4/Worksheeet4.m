%% Worksheet 4, Scientific Computing Lab
clear
close all
format short
clc
%% Part b
%{
nX = 63;
nY = 63;
[~, sparseA, c] = DiscretizePDE(nX, nY, 1);
A = full(sparseA);
%}
%% Part c
%{
nX = 63;
nY = nX;
T = GaussSeidel(nX(i), nY(i));
%}
%% Part d, e, and f
%
nX = [63];
nY = nX;
nNodeIdentifier = {'SixtyThree'}; %'OneTwentySeven'};
MethodIdentifier = {'DirectSolverFullMatrix', 'DirectSolverSparseMatrix', 'GaussSeidel'};
for i = 1:size(nX,2)
%
tic
DirectSolverFullMatrix.(nNodeIdentifier{i}).NodalValue = DiscretizePDE(nX(i), nY(i), 1);
DirectSolverFullMatrix.(nNodeIdentifier{i}).tComputation = toc;
Plot(nX(i), nY(i), MethodIdentifier{1}, DirectSolverFullMatrix.(nNodeIdentifier{i}).NodalValue)

tic
DirectSolverSparseMatrix.(nNodeIdentifier{i}).NodalValue = DiscretizePDE(nX(i), nY(i), 2);
DirectSolverSparseMatrix.(nNodeIdentifier{i}).tComputation = toc;
Plot(nX(i), nY(i), MethodIdentifier{2}, DirectSolverSparseMatrix.(nNodeIdentifier{i}).NodalValue)
%}
tic
GaussSeidl.(nNodeIdentifier{i}).NodalValue = GaussSeidel(nX(i), nY(i));
GaussSeidl.(nNodeIdentifier{i}).tComputation = toc;
Plot(nX(i), nY(i), MethodIdentifier{3}, GaussSeidl.(nNodeIdentifier{i}).NodalValue)
end
%}
%% Part e
%
%}
%% Part f
%
%}
%% Part g
%
%}
