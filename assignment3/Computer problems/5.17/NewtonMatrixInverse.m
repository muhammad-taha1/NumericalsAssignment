%% Solves qs 5.2 for assignment 3

% this function computes the inverse of a matrix using Newton's method
function NewtonMatrixInverse(A)

tol = 10^-14;
maxIteration = 50;

I = eye(size(A));

k = 0;
X = A'/(norm(A,1)*norm(A,inf));

R = I - A*X;
S = ones(size(A));

while (norm(S, inf) < tol && k < maxIteration)
    k = k + 1;
    S = X*R;
    X = X+S;
    R = I - A*X;
end


X
fprintf('Inverse calculated by MATLAB');
inv(A)
end