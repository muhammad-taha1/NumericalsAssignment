%% Solves qs 6.9 for assignment 3

% this function computes the minimum of the given Rosenbrock function
% according to the required methods
function Rosenbrock()

x1 = sym('x1');
x2 = sym('x2');

% given function with its corresponding gradient and hessian.
f = inline('100*(x(2)-x(1)^2)^2 + (1-x(1))^2', 'x');
gradf = inline('[400*x(1)*(x(1)^2-x(2)) + 2*(x(1)-1); 200*(x(2)-x(1)^2)]' ,'x');
hessianF = inline('[1200*x(1)^2 - 400*x(2) + 2, -400*x(1); -400*x(1), 200]', 'x');

% initialize max number of iterations, tolerance and x0
tol = 10^-5;
maxIterations = 50;

x0 = [-1 0 2; 1 1 1];

% three iterations for all 3 functions gives the closest result
for i = 1:3
    iteration = 0;
    x = x0(:,i);
    oneMatrix = ones(size(x));
    
    fprintf('Steepest descent');
    while (norm(oneMatrix) > tol && iteration < maxIterations)
        iteration = iteration + 1;
        oneMatrix = -gradf(x);
        [xPrime, a] = LineSearch(f, x, oneMatrix);
        oneMatrix = xPrime - x;
        x = xPrime;
    end
    x
    iteration
    
    fprintf('Newton method');
    while (norm(oneMatrix) > tol && iteration < maxIterations)
        iteration = iteration + 1;
        oneMatrix = -(hessianF(x)\gradf(x));
        x = x + oneMatrix;
    end
    x
    iteration
    
    fprintf('dampened Newton method');
    while (norm(oneMatrix) > tol && iteration < maxIterations)
        iteration = iteration + 1;
        oneMatrix = -(hessianF(x)\gradf(x));
        [xPrime, a] = LineSearch(f, x, oneMatrix);
        oneMatrix = xPrime - x;
        x = xPrime;
    end
    x
    iteration
end

% plot the contour plot for f
[x, y] = meshgrid(-1:0.01:2, 0:0.01:2);

figure
hold on
contour(-1:0.01:2, 0:0.01:2, 100*(y-x.^2).^2 + (1-x).^2, 50);
plot(1, 1, 'x');
xlabel('x');
ylabel('f(x)');
title ('Contour plot of f');
grid on

end