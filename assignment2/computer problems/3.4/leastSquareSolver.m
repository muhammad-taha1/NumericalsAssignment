%% Solves qs 3.4 for assignment 2

% Solve and compare the least square problem
function leastSquareSolver()

% part a
A = [0.16 0.10; 0.17 0.11; 2.02 1.29];
b1 = [0.26; 0.28; 3.31];

x1 = A\b1

% part b

b2 = [0.27; 0.25; 3.33];
x2 = A\b2

% comparison between the two results
del1 = norm(x2-x1)/norm(x1)
condA = cond(A)
end