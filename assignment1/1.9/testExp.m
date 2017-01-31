%% Solves qs 1.9 for assignment 1

% Testing of exponential function, as specified in part(c) of the question
function testExp()

x = [1,-1, 5,-5,10,-10,15,-15,20,-20];

actual = [];
calc = [];
for i = 1 : length(x)
    actual = [actual, exp(x(i))];
    calc = [calc, exponential(x(i))];
end

figure
stem(x, log10(actual), '-.', 'x');
hold on
stem(x, log10(calc), '--');
xlabel('x');
ylabel('log10(e^x)');
legend('built-in function values', 'computed values');
title('Comparison of e^x values with values from built-in function');
grid on
end