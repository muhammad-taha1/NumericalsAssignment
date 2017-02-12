%% Solves qs 2.9 for assignment 1

% The following function solves the given linear system via Gaussian 
% elimination without and with pivoting

function GaussianElimination()

% initialize A, B and X
A = ones(2,2);
B = ones(2,1);
X = ones(2,1);
% x_ans is a [1 1] vector, the solution as given in question
x_ans = ones(2,1);

% rNorm and eNorm vectors, used for plots. 1 is used for part a and 2 is
% used for part b
rNorm1 = [];
eNorm1 = [];
rNorm2 = [];
eNorm2 = [];

% loop over the given range of k
for k = 1 : 10
    % epsilon as specified in qs
    epsilon = 10^(-2*k);
    % update values of A and B according to question specifications
    A(1,1) = epsilon;
    B = [epsilon+1; 2];
    
    % perform Gaussian elimination on A to get upper triangular form
    A(2,:) = A(2,:) - A(1,:)/epsilon;
    % execute same logic on vector B
    B(2,:) = B(2,:) - B(1,:)/epsilon;
    
    % compute solutions
    X(2) = B(2,1)/A(2,2);
    X(1) = (B(1,1) - A(1,2)*X(2))/epsilon;
    
    % part (a) - elimination without pivoting
    r = B-A*X;
    rNorm1 = [rNorm1, norm(r,inf)];
    eNorm1 = [eNorm1, norm(X-x_ans,inf)];
    
    % part (b) - elimination without pivoting, iterative refinement
    r(2) = (r(2) - r(1))/epsilon;
    % initialize z
    z = [0;0];
    z(2) = r(2)/A(2,2);
    z(1) = (r(1)-A(1,2)*z(2))/epsilon;
    X = X+z;
    r = B-A*X;
    rNorm2 = [rNorm2, norm(r,inf)];
    eNorm2 = [eNorm2, norm(X-x_ans,inf)];    
end

% plot rNorm and eNorm
k = 1:10;
figure
plot(k, rNorm1);
hold on
plot(k, eNorm1);
legend('residual norm', 'error norm');
title('residual and error norm plots for part(a)');
xlabel('k');
ylabel('infinity norm');
grid on

figure
plot(k, rNorm2);
hold on
plot(k, eNorm2);
legend('residual norm', 'error norm');
title('residual and error norm plots for part(b)');
xlabel('k');
ylabel('infinity norm');
grid on




end