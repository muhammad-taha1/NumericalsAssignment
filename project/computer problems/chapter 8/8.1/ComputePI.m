%% Solves qs 8.1 for project

% this function uses midpoint, trapezoid and Simpsons rule to compute the
% value of pi

function ComputePI()

% given function
f = inline('4./(1+x.^2)', 'x');

% initialize all variables
a = 0;
b = 1;
minH = 1e-6;
idx = 0;
h = b - a;
truePi = pi;

while (h >= minH)
    idx = idx + 1;
    % compute via midpoint
    x = [a + h/2 : h : b - h/2]';
    midPoint = h*sum(feval(f,x));
    midPointError = abs(midPoint - truePi);
    % compute via trapezoid
    x = [a : h : b]';
    trapezoid = h*(sum(feval(f,x)) - (feval(f,a)+feval(f,b))/2);
    trapezoidError = abs(trapezoid - truePi);
    % compute via Simpson
    simpson = (2*midPoint + trapezoid)/3;
    simpsonError = abs(simpson - truePi);
    % compute via Romberg
    rombergIdx = 1;
    rombergH = b - a;
    x = [a : rombergH : b]';
    rombergT(1, 1) = rombergH*(sum(feval(f,x)) - (feval(f,a)+feval(f,b))/2);
    
    while (rombergH > h)
        rombergIdx = rombergIdx + 1;
        rombergH = rombergH/2;
        x = [a : rombergH : b]';
        rombergT(rombergIdx, 1) = rombergH*(sum(feval(f,x)) - (feval(f,a)+feval(f,b))/2);
        for i = 2 : rombergIdx
            rombergT(rombergIdx, i) = (4^(i-1)*rombergT(rombergIdx, i-1) - rombergT(rombergIdx - 1, i-1))/(4^(i-1)-1);
        end
    end
    romberg = rombergT(rombergIdx, rombergIdx);
    rombergError = abs(romberg - truePi);
    
    % divide h by 10 for each iteration
    h = h/10;
end

display long;
fprintf('each answer with their respective final error');
idx
midPoint
midPointError
trapezoid
trapezoidError
simpson
simpsonError
romberg
rombergError

end