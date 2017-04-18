%% Solves qs 8.16 for project

% this function estimates the derivatives for each method provided in
% question
function differentiation()

% given t
t = [0; 1; 2; 3; 4; 5];
% initial values of y
y0 = [1; 2.7; 5.8; 6.6; 7.5; 9.9];

% initialize variables
y = y0;
pertubation = 0;


for i = -1 : 0
    for n = 0 : length(t)
        % part a
        x = fliplr(polyfit(t, y, n));
        [p, d] = horner(x, t);
    end
    % part b
    polySpline = spline(t, y);
    splineVal = fnval(fnder(polySpline), t);
    splineVal
    % part d
    polyHermite = pchip(t, y);
    hermiteVal = fnval(fnder(polyHermite), t);
    hermiteVal
    % adjust pertubation
    pertubation = 10^i;
    y = y0 + pertubation*2*(rand(6,1) - 0.5);
end

    % this function is used to compute the polynomial value and its
    % derivative
    function [p, d] = horner(x, t)
        p = x(length(x))*ones(size(t));
        d = zeros(size(t));
        
        for k = length(x) - 1 : -1 : 1
            d = p + t.*d;
            p = x(k) + t.*p;
        end
    end
end