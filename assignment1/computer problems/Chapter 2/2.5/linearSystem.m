%% Solves qs 2.5 for assignment 1

% this function solves the linear equations as specified in the equation.
% The residual is also computed
function linearSystem()

% A and b are given in the question
A = [21 67 88 73; 76 63 7 20; 0 85 56 54; 19.3 43 30.2 29.4];
b = [141; 109; 218; 93.7];

format long;

% LU factorization of A
[L,U,P] = lu(A);

% (a) initial solution obtained via LU factorization
fprintf('(a) initial solution');
x = U\(L\(P*b))

% (b) initial residual of the solution
fprintf('(b) initial residual');
r = b - A*x

% (c) new solution
fprintf('(c) initial solution');
z = U\(L\(P*r))

% (d) repetition of (b) and (c) until no further improvement is seen, i.e.
% when z = 0 (or r = 0)
while (sum(z) ~= 0)
    z = U\(L\(P*r));
    x = x + z;
    r = b - A*x;
end

% final z, x and r
fprintf('(d) final values of x, z and r');
x
z
r

end