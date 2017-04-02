%% Solves qs 6.11 for assignment 3

% this function executes the BFGS method for unconstrained minimization
function BFGS()

f = inline('transpose(x)*diag([10,5,1])*x', 'x');
gradf = inline('diag([10,5,1])*x', 'x');
hessf = inline('diag([10,5,1])', 'x');

tol = 10^-5;
maxIteration = 20;
x0 = [3 1 -5]';

% initialization of required variables
iteration = 0;
grad = gradf(x0);
s = ones(size(x0));
B = eye(length(x0));

while (norm(s) > tol)
    

end