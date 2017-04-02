%% Solves qs 5.13 for assignment 3

% this function computes the convergence of the given functions
function NewtonLinearEquationSolver()

% set tolerance and maximum iterations
tol = eps;
maxIteration = 10;

% initialize starting guess for all unknowns
x0 = [1 1 1]';

% initialize parameters
iteration = 0;
s = ones(size(x0));
x = x0;

while (norm(s) > tol && iteration < maxIteration)
    iteration = iteration + 1;
    s = -(df(x)\f(x));
    x = x + s;
end

% print out result
x
iteration

% MATLAB solver
opts = optimset('TolX', tol, 'TolFun', tol);
[x, ~, ~, output] = fsolve(@f, x0, opts);
x
output
end

% the following functions are only made so they can be used by the fsolve function
function y = f(x)
y = [16*x(1)^4 + 16*x(2)^4 + x(3)^4 - 16; x(1)^2 + x(2)^2 + x(3)^2 - 3; x(1)^3 - x(2)];
end

function y = df(x)
y = [64*x(1)^3, 64*x(2)^3, 4*x(3)^3; 2*x(1), 2*x(2), 2*x(3); 3*x(1)^2, - 1, 0];
end