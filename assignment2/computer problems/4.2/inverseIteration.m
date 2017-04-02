%% Solves qs 4.2 for assignment 2

% implementation of inverse iteration to find the eigenvalue and vectors of
% the given matrix
function inverseIteration()

% given matrix A with a random x vector
A = [6 2 1; 2 3 1; 1 1 1];
x = rand(3,1);

% perform lu factorization
sigma = 2;
[L,U] = lu(A-sigma*eye(size(A)));

% eps = epsilon constant
tol = eps;
delx = 1;

while (delx > tol)
    y = U\(L\x);
    y = y/norm(y,inf);
    delx = norm(abs(y) - abs(x), inf);
    x = y;a
end

y = A*x;
[~, k] = max(abs(x));
lambda1 = y(k)/x(k)

% part b
[x2, lambda2] = eig(A);
for i = 1 : 3
    x2(:,i) = x2(:,i)/norm(x2(:,i),inf);
end
lambda2 = diag(lambda2)

end
