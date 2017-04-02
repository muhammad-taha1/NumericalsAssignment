%% Solves qs 5.1 for assignment 3

% this function computes the convergence of the given functions
function convergence()

f = {'(x^2+2)/3', 'sqrt(3*x-2)', '3-2/x', '(x^2-2)/(2*x-3)'};

tol = eps;
maxIteration = 10;

xRoot = 2;

% repeat the computations below for all 4 given equations
for i = 1 : length(f)
    grad = inline(f{i}, 'x');
    iteration = 0;
    % guess for x, for initialization purposes
    x = 3;
    error = abs(x - xRoot);
    
    % repeat until error is small
    while (error > tol && iteration < maxIteration)
        iteration = iteration + 1;
        x = grad(x);
        errorPrime = abs(x - xRoot);
        ratio = errorPrime/error;
        error = errorPrime;
    end
    
    % print out the results for each function
    f{i}
    error
    ratio
    
end

end