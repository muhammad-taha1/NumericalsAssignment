%% Solves qs 1.7 for assignment 1

% error plot of differentiation for various values of h
function errorPlot

errors = [];
h= [];
for i = 1 : 10
    % building vector h. values h go as 1/2, 1/4, 1/8...
    h = [h 1/2^i];
    % building the error vector. Differentiation function is called and the
    % error values returned from there. The 2nd input defines which
    % approximation method shall be used
    errors = [errors derivativeApproximation(1/2^i, 2)];
end

figure
plot(log10(h), log10(errors));
xlabel('log(h)');
ylabel('log(error)');
title('error plot of differentiation with varying values of h');
    
end