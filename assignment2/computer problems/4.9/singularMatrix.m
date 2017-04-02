%% Solves qs 4.9 for assignment 2

% this function figures out the roots of the given polynomial and forms the
% companion matrix
function singularMatrix()
ratio = [];
for i = 1 : 20
    % form the given matrix A
    A = eye(i,i);
    for j = 1 : i-1
        A = A + diag(-1*ones(i-j,1),j);
    end
    
    % perform single value decomposition and display results for each
    % iteration
    S = svd(A);
    ratio = [ratio; S(1)/S(i)];
end

plot(1:20, ratio);
xlabel('matrix order size');
ylabel('sigma max/sigma min');
title('ratio of sigma max and sigma min over increasing matrix order size');
grid on;

end