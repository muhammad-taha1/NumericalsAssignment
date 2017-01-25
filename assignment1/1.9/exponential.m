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
% checking if the difference of the actual and expected value differs by
% 10^-5

iter = 1; % iteration count of the loop
while (abs(expVal - actualVal) > 1/10^5) 
    expVal = expVal + x^iter/factorial(iter);
    iter = iter + 1;
end

% do 1/e^x if isNegative is true
if (isNegative)
    expVal = 1/expVal;
end
end