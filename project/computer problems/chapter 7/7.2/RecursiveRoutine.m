%% Solves qs 7.2 for project

% this function solves part c, which is to implement part a with the function written for part b
function [x, t, y] = RecursiveRoutine(t, y)

n = length(t);
if n > 1
    x = RecursiveRoutine(t(1:n-1), y(1:n-1));
    [x, t, y] = NewtonAddPoint(x, t(1:n-1), y(1:n-1), t(n), y(n));
else
    % break condition for recursion
    x = y;
end
end