%% Solves qs 1.10 for assignment 1

% computes the two quadratic roots for the given values of a, b and c.
% equation is as follows: ax^2 + bx + c = 0
function x = quadraticSolver(a, b, c)
% use long format for display - better accuracy
format long;

% convert sqrt substractions to syms for further accuracy

% only one root when a = 0
if (a == 0)
    x = -c/b;
    
elseif (((-b - sqrt(b^2-4*a*c)) ~= 0) || ((-b + sqrt(b^2-4*a*c)) ~= 0))
    % formula to be used when (-b - sqrt(b^2-4*a*c)) is non-zero
    x1 = (2*c)/(-b - sqrt(b^2-4*a*c));
    x2 = (2*c)/(-b + sqrt(b^2-4*a*c));
    
    x = [x1; x2];
else
    % standard formula
    x1 = (-b + sqrt(b^2 - 4*a*c))/(2*a);
    x2 = (-b - sqrt(b^2 - 4*a*c))/(2*a);
    
    x = [x1; x2];
end
end