%% Solves qs 7.1 for project

% this function uses Horner's rule to evaluate a polynomial with given
% degree, coefficients and independant variables

% p returns the polynomial, d the derivative and i the integral
% the input x is the coefficient, t is of variables and a and b define the
% integration limits
function [poly, derivative, integral] = HornerRule(x, t, a, b)

n = length(x); % degree length
% initiate p and d
poly = x(n)*ones(size(t));
derivative = zeros(size(t));

% evaluate d and p
for int = n-1 : -1 : 1
    derivative = poly+t.*derivative;
    poly = x(int)+t.*poly;
end

% integral is only computed when either a or b are non zero
if (a ~= 0 || b ~= 0)
    
    % initiate ia and ib
    ia = (x(n)/n)*ones(size(a));
    ib = (x(n)/n)*ones(size(a));
    
    % compute ia and ib
    for int = n - 1 : -1 : 1
        ia = x(int)/int + a.*ia;
        ib = x(int)/int + b.*ib;
    end

    integral = b.*ib - a.*ia;
    
end

end