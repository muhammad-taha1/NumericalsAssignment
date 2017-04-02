%% Solves qs 5.2 for assignment 3

% this function computes the Newton, bisection and secant methods for solving
% non-linear equations in one dimension
function convergence()

% enter the function to be tested here
f = inline('exp(-x) - x', 'x');
df = inline('-exp(-x) - 1', 'x');

% enter the range of values with which to test the functions with
a = 0;
b = 1;

tol = 10^-10;
maxIteration = 10;

% initialization
iterationCnt = 0;

fa = f(a);
fb = f(b);

fprintf('bisection method');

while (b-a > tol && iterationCnt < maxIteration)
    iterationCnt = iterationCnt + 1;
    % mid point
    m = (a+b)/2;
    fm = f(m);
    
    if (sign(fa) == sign(fm))
        a = m;
        fa = fm;
    else
        b = m;
        fb = fm;
    end
end

iterationCnt
a
fa
b
fb

fprintf('Newton method');

delx = 1;
iterationCnt = 0;
x = a;

fx = f(x);

while (abs(delx) > tol && iterationCnt < maxIteration)
    iterationCnt = iterationCnt + 1;
    d = df(x);
    delx = -fx/d;
    x = x + delx;
    fx = f(x);
end

iterationCnt
x
fx

fprintf('Secant method');

delx = 1;
iterationCnt = 0;
x0 = a;
fx0 = f(x0);

x1 = b;
fx1 = f(x1);

while (abs(delx) > tol && iterationCnt < maxIteration)
    iterationCnt = iterationCnt + 1;
    d = (fx1 - fx0)/(x1 - x0);
    delx = -fx1/d;
    x0 = x1;
    fx0 = fx1;
    
    x1 = x0 - fx0/d;
    fx1 = f(x1);
end

options = optimset('TolX', tol, 'MaxIter', maxIteration);

[x, fx, exitflag, output] = fzero(f, [a b], options)
end