%% Solves qs 7.5 for project

% this function plots the data curve and the cubic spline
function polynomialInterpolation()

% initialize given values
t = [0; 1; 4; 9; 16; 25; 36; 49; 64];
y = [0; 1; 2; 3; 4; 5; 6; 7; 8];

% compute spline and polynomial
poly = polyfit(t,y,8);
splineVal = spline(t,y);

ts = linspace(0,64,100)';
root = sqrt(ts); 
yPoly = polyval(poly,ts);
ySpline = ppval(splineVal,ts);

% plot the data ponts, polynomial, spline and the built in sqrt result
figure; 
plot(t,y,'k*');
hold on; 
plot(ts,root,'r-.');
plot(ts,yPoly,'b-.');
plot(ts,ySpline,'g-.');
title('Polynomial interpolants');
xlabel('t'); 
ylabel('y'); 
legend('data points','built in square root','polynomial','spline');
grid on
end