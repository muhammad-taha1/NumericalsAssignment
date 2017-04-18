%% Solves qs 8.11 for project

% this function performs the given integral to find electrostatic potential
function electrostaticPotential()
% given function
f = @(xhat, x, yhat, y) 1./sqrt((xhat-x).^2+(yhat-y).^2);

% 10 seems to be a reasonable value for iterations
n = 10;

% given range of xhat and yhat
xhat = linspace(2,10,n)';
yhat = linspace(2,10,n)';
Phi = zeros(n,n); 
tol = 1e-2;
for i = 1:n
    for j = 1:n
        Phi(i,j) = dblquad(f, -1, 1, -1, 1, tol, [], xhat(i), yhat(j));
    end
end; 
[x, y] = meshgrid(xhat); 
surf(x,y,Phi);
title('phi(xhat, yhat)');
end