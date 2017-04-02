%% Solves qs 6.13 for assignment 3

% this function finds the least squares solution for the given equations
function leastSquares()

% part a
f = inline('[x(1)^2 + x(2)^2 - 2; (x(1) - 2)^2 + x(2)^2 - 2; (x(1) - 1)^2 + x(2)^2 - 9]', 'x');
opts = optimset('TolX', 10^-6, 'MaxIter', 50);
x = lsqnonlin(f, rand(2,1), [], [], opts)

% part b
f = inline('[x(1)^2 + x(2)^2 + x(1)*x(2); (sin(x(1)))^2; (cos(x(2)))^2]', 'x');
opts = optimset('TolX', 10^-6, 'MaxIter', 50);
x = lsqnonlin(f, rand(2,1), [], [], opts)
end