%% Solves qs 7.2 for project

% this function evaluates the Newton interpolant at a given point
function out = NewtonEvaluation(x, t, tPrime)

% intialize
xLength = length(x);
out = x(xLength);

% perform evaluation
for i = xLength - 1 : -1 : 1
    out = x(i) + out.*(tPrime - t(i));
end
end