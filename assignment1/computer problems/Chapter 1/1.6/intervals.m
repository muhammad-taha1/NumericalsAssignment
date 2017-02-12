%% Solves qs 1.6 for assignment 1

% This program generates a range of equally spaced points in interval
% [a,b], according to the rubricks of question 1.6. The method variable
% switches the method to be used.

% a = lower bound, b = upper bound and n defines the range of values
function x = intervals(a, b, n)

% choose the method to execute
method = 'method2';

% calculate h
h = (b - a)/n;

% x is the output
x = [];

switch method
    
    % Note: The for loops end at n+1 as we need to generate n+1 points
    case 'method1'
        
        % x0 = a
        x = [x a];
        
        for k = 2 : (n+1)
            nextVal = x(k - 1) + h;
            x = [x nextVal];
        end
        
    case 'method2'
        for k = 0 : n
            nextVal = a + k*h;
            x = [x nextVal];
        end
end

end