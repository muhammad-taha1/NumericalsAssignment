%% Solves qs 3.5 for assignment 2

% Solve and compare the least square problem
function orbitalParameters()

% given data points
x = [1.02; 0.95; 0.87; 0.77; 0.67; 0.56; 0.44; 0.3; 0.16; 0.01];
y = [0.39; 0.32; 0.27; 0.22; 0.18; 0.15; 0.13; 0.12; 0.13; 0.15];

% given equation
A = [y.^2 x.*y x y ones(size(x))];
% given b vector
b = x.^2;

% part a

% k = constant values of the equation
k = A\b

% steps to plot the orbits
[xs, ys] = meshgrid(-1:0.1:2,-1:0.1:2);


% plotting a contour for orbit
figure(1)
contour(-1:0.1:2,-1:0.1:2,k(1)*ys.^2+k(2)*xs.*ys+k(3)*xs+k(4)*ys+k(5)-xs.^2, [0,0], 'k-');
hold on
plot(x,y,'bx');
title('eliptical orbit');

% part b
x2 = x + (rand(size(x)))*(0.01-0.005);
y2 = y + (rand(size(y)))*(0.01-0.005);
A2 = [y.^2 x.*y x y ones(size(x))];
b2 = x2.^2;
k2 = A2\b2

figure(2)
contour(-1:0.1:2,-1:0.1:2,k2(1)*ys.^2+k2(2)*xs.*ys+k2(3)*xs+k2(4)*ys+k2(5)-xs.^2, [0,0], 'r-');
hold on
contour(-1:0.1:2,-1:0.1:2,k(1)*ys.^2+k(2)*xs.*ys+k(3)*xs+k(4)*ys+k(5)-xs.^2, [0,0], 'k-');
hold on
plot(x2,y2,'bx');
hold on
plot(x,y,'bo');
title('perturbed eliptical orbit');


% part c
[U, S, V] = svd(A);
[U2, S2, V2] = svd(A2);

k3 = zeros(5,1);
k4 = zeros(5,1);

for i = 1 : 5
    k3 = k3 + U(:,i)'*b*V(:,i)/S(i,i);
    k4 = k4 + U2(:,i)'*b*V2(:,i)/S2(i,i);
end

figure(3)
contour(-1:0.1:2,-1:0.1:2,k3(1)*ys.^2+k3(2)*xs.*ys+k3(3)*xs+k3(4)*ys+k3(5)-xs.^2, [0,0], 'r-');
hold on
contour(-1:0.1:2,-1:0.1:2,k4(1)*ys.^2+k4(2)*xs.*ys+k4(3)*xs+k4(4)*ys+k4(5)-xs.^2, [0,0], 'k-');
hold on
plot(x,y,'bx');
title('eliptical orbit with rank deficiency');


end