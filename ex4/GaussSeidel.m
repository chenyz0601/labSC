function [ NodalValueWithBc ] = GaussSeidel(nColumns, nRows)
nElementsInRow = nColumns + 1;
hX = 1 / nElementsInRow;
% Element Size Along Row
nElementsInColumn = nRows + 1;
hY = 1 / nElementsInColumn;
% Element Size Along Column

T = zeros(nRows*nColumns, 1);
c = zeros(nRows*nColumns, 1);
DeviationSquareSum = 0;
% Solving left to right along a row
Residual = 1;
while (Residual>1e-4)
    for i = 1 : nColumns * nRows
        ProductSum(i) = 0;
        for j = 1 : nColumns * nRows
            if (((mod(i,nRows) ~= 1) && (mod(i,nRows) ~= 0)) ...
                    &&((j == i+1) || (j == i-1)) ...
                    || (((mod(i,nRows) == 1)           && (j == i+1))) ...
                    || (((mod(i,nRows) == (0)) && (j == i-1))))
                a = hY^2;
            elseif (j == i+nColumns || j == i-nColumns)
                a = hX^2;
            else
                a = 0;
            end
            ProductSum(i) = ProductSum(i) + a * T(j);
        end
        if mod(i, nRows)~= 0
            iNode = floor(i/nRows)+1;
            jNode = mod(i, nRows);
        else
            iNode = floor(i/nRows);
            jNode = nRows;
        end
        c(i) = -2 * (pi())^2 * hX^2 * hY^2 * sin(pi()*iNode*hX) * sin(pi()*jNode*hY);
        T(i) = (c(i) - ProductSum(i))/(- 2 * (hX^2 + hY^2));
    end
    ErrorSquare = 0;
    for i = 1 : nColumns * nRows
        ErrorProductSum(i) = 0;
        for j = 1 : nColumns * nRows
            if (((mod(i,nRows) ~= 1) && (mod(i,nRows) ~= 0)) ...
                    &&((j == i+1) || (j == i-1)) ...
                    || (((mod(i,nRows) == 1)           && (j == i+1))) ...
                    || (((mod(i,nRows) == (0)) && (j == i-1))))
                a = hY^2;
            elseif (j == i+nColumns || j == i-nColumns)
                a = hX^2;
            else
                a = 0;
            end
            ErrorProductSum(i) = ErrorProductSum(i) + T(i)*a;
        end
        ErrorSquare = ErrorSquare + (c(i) - ErrorProductSum(i))^2;
    end
    Residual = sqrt(ErrorSquare/(nRows*nColumns));
end
NodalValueMatrix = reshape(T,[nRows, nColumns]);
Null = zeros(nRows,1);
NodalValueWithBc = [[0, Null', 0]; Null, full(NodalValueMatrix), Null; [0, Null', 0]];

end