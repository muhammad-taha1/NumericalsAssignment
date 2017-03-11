%% Solves qs 4.7 for assignment 2

% this function figures out the roots of the given polynomial and forms the
% companion matrix
function polynomial()
p = [24; -40; 35; -13; 1];
n = length(p);
c = diag(ones(n-2,1),-1);
fprintf('Companion matrix');
c(:,n-1) = -p(1:n-1)
lambda = eig(c)
Proots = roots(flipud(p))

end