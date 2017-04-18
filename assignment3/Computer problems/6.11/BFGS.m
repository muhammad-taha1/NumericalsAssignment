%% Solves qs 6.11 for assignment 3

% this function executes the BFGS method for unconstrained minimization
function BFGS()

f = inline('transpose(x)*diag([10,5,1])*x', 'x');
gradf = inline('diag([10,5,1])*x', 'x');
hessf = inline('diag([10,5,1])', 'x');

tol = 10^-5;
maxIteration = 20;
x0 = [3 1 -5]';
x = x0;

% initialization of required variables
iteration = 0;
grad = gradf(x0);
s = ones(size(x0));
B = eye(length(x0));

while (norm(s) > tol && iteration < maxIteration)
    iteration = iteration + 1;
    s = -B\grad;
    x = x + s;
    gPrime = grad;
    grad = gradf(x);
    gPrime = grad - gPrime;
    z = B*s;
    B = B + (gPrime*gPrime')/(gPrime'*s) - (z*z')/(z'*s);
end

fprintf('Newton method solution:');
iteration
x

% initialize the variables again
iteration = 0;
x = x0;
s = ones(size(x0));

while (norm(s) > tol && iteration < maxIteration)
    iteration = iteration + 1;
    s = -hessf(x)\gradf(x);
    x = x + s;
end

fprintf('Steepest descent solution:');
iteration
x

% initialize the variables again
iteration = 0;
x = x0;
s = ones(size(x0));

while (norm(s) > tol && iteration < maxIteration)
    iteration = iteration + 1;
    s = -gradf(x);
    [xPrime, ~] = LineSearch(f, x, s);
    s = xPrime - x; 
    x = xPrime;
end

fprintf('solution:');
iteration
x



end