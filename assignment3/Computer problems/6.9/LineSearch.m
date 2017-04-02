%% Solves qs 6.9 for assignment 3

% this function performs the LineSearch algorithm on the given function f
% and returns the new value of x called xPrime
function [xPrime, a] = LineSearch(f, x, s)

iteration = 0;
maxIteration = 10;

f0 = feval(f, x);
a = 1;
f1 = feval(f, x+s);

% perform the feval
while (f1 > f0 && iteration < maxIteration)
    iteration = iteration + 1;
    a = a/2;
    f1 = feval(f, x + a*s);
end

% find the optimized value for a
opts = optimset('TolX', 10^-5, 'MaxIter', 50);
a = fminbnd(@fevalForFminBnd, 0, 2*a, opts, f, x, s);
xPrime = x + a*s;
end

% this function just acts as a map for feval function to be used by fminbnd
function [val] = fevalForFminBnd(a, f, x, s)
val = feval(f, x+a*s);
end

% phi(a, f, x, s) = feval(f, x+a*s);