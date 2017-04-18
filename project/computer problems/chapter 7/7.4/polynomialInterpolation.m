%% Solves qs 7.4 for project

% this function plots the data curve and the cubic spline
function polynomialInterpolation()

% given data points
t = [0; 0.5; 1; 6; 7; 9];
y = [0; 1.6; 2; 2; 1.5; 0];

% determine the polynomial and spline
p = polyfit(t, y, 5);
splineCurve = spline(t, y); 
ts = linspace(0, 9, 50);
yp = polyval(p, ts); 
ys = ppval(splineCurve, ts);

% plot the curve
plot(t, y, ts, yp, ts, ys, t, y);
xlabel('t'); 
ylabel('y'); 
legend('data pts', 'polynomial curve', 'cubic spline', 'piecewise');
grid on
title('Polynomial interpolants of the experimental data');
end