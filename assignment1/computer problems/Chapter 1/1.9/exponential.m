%% Solves qs 1.9 for assignment 1

% This function calculates the approximate value for e^x, according to the
% given formula in question
function expVal = exponential(x)

% isNegative indicates if x is negative or not
isNegative = false;

% actual value
actualVal = exp(x);

% expVal is the compuatation of the e^x
expVal = 1;

% hint from part(d). If x is -ve, compute e^x and return 1/e^x
if (x < 0)
    x = -x;
    isNegative = true;
    % recompute actual value again for 1/e^x
    actualVal = exp(x);
end

% perform the infinite series summation until the stopping criterion
% (specified in while loop) is met. The stopping criterion is simply
% checking if the Langrange form of the remainder term (R) for the Taylor
% series given by the expression to compute e^x is small enough for the
% answer to be accurate enough. The algoirhtm checks if the remainder is
% smaller than 10^-6

iter = 1; % iteration count of the loop
R = 10^5; % initialize R as a large value.
while (abs(R) > 10^-6) 
    expVal = expVal + x^iter/factorial(iter);
    iter = iter + 1;   
    % R is Langrange form of the remainder term for the Taylor series used
    % to denote the expVal
    R = (expVal*x^iter)/factorial(iter);
end

% do 1/e^x if isNegative is true
if (isNegative)
    expVal = 1/expVal;
end
end