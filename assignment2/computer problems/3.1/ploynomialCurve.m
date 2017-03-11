%% Solves qs 3.1 for assignment 2

% This function plots the polynomial data according to the rubricks of the
% question
function ploynomialCurve()

% given data points 
t = [0 1 2 3 4 5];
y = [1 2.7 5.8 6.6 7.5 9.9];

A = ones(length(t), 1);

% space each time slot for plotting purposes by p between the given range
% of t
p = 50;
timeSlots = linspace(0,5,p)';

for i = 1 : length(t)
    % x contains the initial y-slot values for each iteration
    x = A(:,1:i)\y';
    ySlots(1:p,i) = x(i);
    
    % make adjustments on yslots, according to the previous values of
    % timeSlots
    for k = 2 : i
        ySlots(:,i) = ySlots(:,i).*timeSlots+x(i-k+1);
    end
    
    A(:,i+1) = A(:,i).*t';
end

% plot results and original data points
title('data points vs polynomial curves');
plot(t,y,'--x');
hold on
plot(timeSlots, ySlots);
grid on
xlabel('t');
xlabel('y');
legend('data points','deg0','deg1','deg2','deg3','deg4','deg5');
end