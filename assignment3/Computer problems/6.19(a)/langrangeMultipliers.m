%% Solves qs 6.13 for assignment 3

% this function uses the method of Langrange multipliers to solve the
% equation
function langrangeMultipliers()

opts = optimset('TolX', 10^-6, 'MaxIter', 50);
f = inline('(4*x(1)-x(2))^2 + (x(2)+x(3)-2)^2 + (x(4)-1)^2 + (x(5)-1)^2', 'x');
constraint = inline('[x(1)+3*x(2); x(3)+x(4)-2*x(5); x(2)-x(5)]', 'x');

x = fsolve(constraint, ones(8, 1), opts)

end