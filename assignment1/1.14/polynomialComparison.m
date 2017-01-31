%% Solves qs 1.14 for assignment 1

function polynomialComparison()

% These two will store the results to be plotted from both expressions as
% given in question. res1 is equivalent to (x-1)^6 and res2 is equivalent
% to the expanded version
res1 = [];
res2 = [];

% loop, compute the values and store in res1 and res2. Range and step of
% loop is specified according to the question
for x = 0.995 : 0.0001 : 1.005
    eq1 = (x-1)^6;
    res1 = [res1 eq1];
    
    eq2 = x^6 - 6*x^5 + 15*x^4 - 20*x^3 + 15*x^2 - 6*x + 1;
    res2 = [res2 eq2];
end

% defining x-axis
x = 0.995 : 0.0001 : 1.005;
% scaling the values for y-axis
res1 = res1./1*10^13;
res2 = res2./1*10^13;

% plot
figure
stem(x, res1, ':*')
hold on
stem(x, res2)
title('polynomial vs expanded form comparison');
legend('polynomial', 'expanded form');
xlabel('x');
ylabel('y*10^{13}');
grid on

end