%% Solves qs 7.3 for project

% this function uses equations from example 7.6 and data set of example 7.1
% to solve the system of equations and plot the resulting cubic spline with
% data points
function SystemOfEquations()

% part a
t = [-2; 0; 1];
y = [-27; -1; 0];

% system of equations written in matrix form
A = [1 t(1) t(1)^2 t(1)^3 0 0 0 0; 1 t(2) t(2)^2 t(2)^3 0 0 0 0;
0 0 0 0 1 t(2) t(2)^2 t(2)^3; 0 0 0 0 1 t(3) t(3)^2 t(3)^3;
0 1 2*t(2) 3*t(2)^2 0 -1 -2*t(2) -3*t(2)^2; 0 0 2 6*t(2) 0 0 -2 -6*t(2);
0 0 2 6*t(1) 0 0 0 0; 0 0 0 0 0 0 2 6*t(3)];

% Solve for x and display the data points for part b
x = A\[y(1); y(2); y(2); y(3); zeros(4,1)]; 
a = x(1:4);
b = x(5:8);

ts = linspace(t(1),t(2),20)';
d2 = 2*a(3)+ts.*(6*a(4));
ds = a(2)+ts.*(2*a(3)+ts.*(3*a(4)));
ys = a(1)+ts.*(a(2)+ts.*(a(3)+ts.*a(4)));

% plot the cubic spline with data points 
% plot a points
plot(t, y, 'k*', ts, ys, 'r-', ts, ds, 'b--', ts, d2, 'g.'); 
hold on;
ts = linspace(t(2),t(3),20)';
d2 = 2*b(3)+ts.*(6*b(4));
ds = b(2)+ts.*(2*b(3)+ts.*(3*b(4)));
ys = b(1)+ts.*(b(2)+ts.*(b(3)+ts.*b(4)));
% plot b points
plot(ts, ys, 'r-', ts, ds, 'b--', ts, d2, 'g.');
xlabel('t'); 
ylabel('y');
grid on;
legend('data points', 'spline', '1st derivative', '2nd derivative');
title('Spline plot and derivatives');

end
