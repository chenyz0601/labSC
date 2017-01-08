function [NodalValueWithBc, Matrix, b ] = DiscretizePDE(nX, nY, choice)
%Discretize PDE into system of linear equation A * T = c;
%A is coefficient matrix of the form Block Tridiagonal
%T is unknown temperature vector
%c is constant
nElementsInRow = nX + 1;
hX = 1 / nElementsInRow;
% Element Size Along Row

nElementsInColumn = nY + 1;
hY = 1 / nElementsInColumn;
% Element Size Along Column

D = - 2 * (hX^2 + hY^2);
B = gallery('tridiag',nX, hY^2, D, hY^2);
%A = gallery('tridiag',n,c,d,e), where c, d, and e are all scalars, yields the Toeplitz tridiagonal matrix of order n with subdiagonal elements c, diagonal elements d, and superdiagonal elements e. https://de.mathworks.com/help/matlab/ref/gallery.html
%A = full(S) converts a sparse matrix S to full storage organization, such
%that issparse(A) returns logical 0 (false). If S is a full matrix, then A is identical to S. https://de.mathworks.com/help/matlab/ref/full.html
S = hX^2 * eye(nX);
sparseA = (blktridiag(B, S, S, nY));
b = zeros(nX * nY, 1);
for j = 1 : nY
    for i = 1 : nX
        b(nX*(j-1) + i) = -2 * (pi())^2 * hX^2 * hY^2 * sin(pi()*i*hX) * sin(pi()*j*hY);
    end
end
if choice == 1
    A = full(sparseA);
    NodalValueVector = A\b;
    NodalValueMatrix = reshape(NodalValueVector,[nY, nX]);
    Null = zeros(nX,1);
    NodalValueWithBc = [[0, Null', 0]; Null, full(NodalValueMatrix), Null; [0, Null', 0]];
    Matrix = A;
else if choice == 2
    NodalValueVector = sparseA\b;
    NodalValueMatrix = reshape(NodalValueVector,[nY, nX]);
    Null = zeros(nX,1);
    NodalValueWithBc = [[0, Null', 0]; Null, full(NodalValueMatrix), Null; [0, Null', 0]];
    Matrix = sparseA;
    end
end