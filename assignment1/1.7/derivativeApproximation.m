%% Solves qs 1.7 for assignment 1

% The program computes derivative of a function using the finite difference
% formula or central difference approximation, specified in question. 
% This function performs the differentiation and returns the 
% totalError from the expected function. input method as 1 for
% finite-difference approximation, any other value will perform the
% calculations via centered-difference approximation

function totalError = derivativeApproximation(h, method)

% outerlimit of the function to be differentiated
outerLimit = 100;

% f is the function to be differentiated. It is built in the for loop
% below. The values of h show the incremental in steps of the value of x in
% function. 

f = [];
for x = 1 : h : outerLimit
    f = [f sin(x)]; % using sin as the function in this example
end


fPrime = [];

if (method == 1)
    for x = 1 : (length(f)-1)
        % since each subsequent value in f is actually computed by moving x in
        % steps of h, the value f(x+1) actually equals f(x+h)
        diff = (f(x+1) - f(x))/h;
        fPrime = [fPrime diff];
    end
else
    for x = 2 : (length(f)-1)
        % since each subsequent value in f is actually computed by moving x in
        % steps of h, the value f(x+1) actually equals f(x+h)
        diff = (f(x+1) - f(x-1))/(2*h);
        fPrime = [fPrime diff];
    end
end

% the expected result of differentiation is cos(x). Building that for error
% comparison
expectedResult = [];
for x = 1 : h : outerLimit
    expectedResult = [expectedResult cos(x)];
end

totalError = 0;

for i = 1 : length(fPrime)
    totalError = totalError + abs(expectedResult(i) - fPrime(i));
end

% return the average error, which is total error divided by the functional
% limit
totalError = totalError/outerLimit;
end