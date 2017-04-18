%% Solves qs 7.2 for project

% this function computes the Newton polynomial interpolant for a given set of data 
function out = NewtonPolyInterpolant(t, y)

lengthOfT = length(t);
% initialize A
A = zeros(lengthOfT, lengthOfT);
A(:,1) = ones(lengthOfT, 1);

for i = 2 : lengthOfT
    A(i : lengthOfT, i) = (t(i : lengthOfT) - t(i - 1)).*A(i : lengthOfT, i - 1);
end

out = A\y;
end