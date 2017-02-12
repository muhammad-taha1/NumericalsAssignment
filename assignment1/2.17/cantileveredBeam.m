%% Solves qs 2.17 for assignment 1

function cantileveredBeam()

n = 100;
b = ones(n,1);

% generate super diagnols of the matrix
A = spdiags([b, -4*b, 6*b, -4*b, b], -2:2, n, n);

% hard-code the values at the matrix corners and other places where the
% values are different from the ones generated via super diagnol
A(1,1) = 9;
A(n-1,n-1) = 5;
A(n,n) = 1;
A(n,n-1) = -2;
A(n-1,n) = -2;

% part (a)
% measure time for solving for sparse matrix
tic;
x1 = A\b;
t1 = toc;

% measure time for solving for dense matrix
tic;
x2 = full(A)\b;
t2 = toc;

fprintf('norm(Xsparse - Xdense)');
norm(x1-x2)

fprintf('time taken by sparse solution');
t1

fprintf('time taken by dense solution');
t2

% part (b)
n = 1000;

% regenerate A and b for new n
b = ones(n,1);
A = spdiags([b, -4*b, 6*b, -4*b, b], -2:2, n, n);

% hard-code the values at the matrix corners and other places where the
% values are different from the ones generated via super diagnol
A(1,1) = 9;
A(n-1,n-1) = 5;
A(n,n) = 1;
A(n,n-1) = -2;
A(n-1,n) = -2;

% generate R matrix
R = spdiags([b -2*b b], 0:2, n, n);
R(1,1) = 2;

fprintf('norm(R*R^T - A)');
norm(R*R' - A, inf)
fprintf('cond(A)');
condest(A)

% recompute solution for new n
x1 = A\b;
r1 = b - A*x1;
fprintf('residual norm for sparse solution');
norm(r1)

% two triangular approach
x1_r = R'\(R\b);
r1_r = b - A*x1_r;
fprintf('residual norm for sparse solution after two triangular approach');
norm(r1_r)
fprintf('norm comparison after two triangular approach from before for sparse solution');
norm(x1 - x1_r)

% iterative refinement
norm1 = norm(r1);
norm2 = norm1*2;

while (norm1 < norm2) 
    norm2 = norm1;
    s = A\r1;
    x1_i = x1_r + s;
    r = b - A*x1_i;
    norm1 = norm(r);
end

fprintf('residual norm for sparse solution after iterative refinement');
norm1
fprintf('norm comparison after iterative refinement from before for sparse solution');
norm(x1 - x1_r)


end
