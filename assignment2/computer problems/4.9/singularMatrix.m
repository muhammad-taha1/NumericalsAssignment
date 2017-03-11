%% Solves qs 4.9 for assignment 2

% this function figures out the roots of the given polynomial and forms the
% companion matrix
function singularMatrix()

for i = 1 : 20
    % form the given matrix A
    A = eye(i,i);
    for j = 1 : i-1
        A = A + diag(-1*ones(i-j,1),j);
    end
    
    % perform single value decomposition and display results for each
    % iteration
    S = svd(A);
    fprintf('iteration')
    i
    S(i)
    S(1)
    S(1)/S(i)
end

end