%% Solves qs 8.7 for project

% this function performs the given Frensel integral
function FrenselIntegral()

% given functions
funcC = @(t) cos(pi*t.^2/2);
funcS = @(t) sin(pi*t.^2/2);

% let n = 300 in order to get smoother curves
n = 300;
% initialize all variables
x = linspace(0,5,n); 
C = zeros(n,1); 
S = zeros(n,1);

% perform integration at each step over n
for idx = 2:n
    C(idx) = C(idx-1) + integral(funcC, x(idx-1), x(idx)); 
    S(idx) = S(idx-1) + integral(funcS, x(idx-1), x(idx));
end

% plot results
plot(x,C)
hold on
plot(x,S); 
xlabel('x');
ylabel('y');
legend('C(x)', 'S(x)');
grid on;
title('Fresnel Integrals');
end