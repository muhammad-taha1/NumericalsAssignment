%% Solves qs 6.12 for assignment 3

% this function performs the conjugate gradient for unconstrained minimization
function conjugateGradient()

f = inline('transpose(x)*diag([10,5,1])*x', 'x');
gradf = inline('diag([10,5,1])*x', 'x');
hessf = inline('diag([10,5,1])', 'x');

tol = 10^-5;
maxIteration = 20;
x0 = [3 1 -5]';

% initialize parameters
iteration = 0;
grad = gradf(x0);
x = x0;
s = -gradf(x0);

while (norm(s) > tol && iteration < maxIteration) 
    iteration = iteration + 1;
    [x, a] = LineSearch(f, x, s);
    gradPrime = gradf(x);
    
    % for Fletcher Reeves
   % beta = (gradPrime'*gradPrime)/(grad'*grad);
    
    % for Polak Ribiere
    beta = ((gradPrime-grad)'*gradPrime)/(grad'*grad);
end

s = -gradPrime+beta*grad;
grad = gradPrime
iteration

end