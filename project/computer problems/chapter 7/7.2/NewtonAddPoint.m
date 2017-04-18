%% Solves qs 7.2 for project

% this function recomputes the new Newton Polynomial interpolant with a new data point for part b
function [x, t, y] = NewtonAddPoint(x, t, y, tNew, yNew)

% perform original evaluation
p = NewtonEvaluation(x, t, tNew);
pPrime = 1;

for i = 1 : length(t)
    pPrime = pPrime * (tNew - t(i));
end

% append new points and return
x = [x; (yNew - p)/pPrime];
t = [t; tNew];
y = [y; yNew];
end