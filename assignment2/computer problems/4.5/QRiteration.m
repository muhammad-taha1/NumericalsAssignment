%% Solves qs 4.5 for assignment 2

% this function solves the QR iteration with shifts, as described in the
% question
function lambda = QRiteration(A)

n = size(A,1);
tol = eps*norm(A);

for k = n:-1:2
    % convergence codition
    while (norm(A(k,1:k-1), inf) > tol)
        % corner entry as shift
        s = A(k,k);
        % compute QR from the builtin functionality
        [Q,R] = qr(A(1:k,1:k)-s*eye(k,k));
        % A = RQ + sI
        A(1:k, 1:k) = R*Q+s*eye(k,k);
    end
end

lambda = diag(A);
end