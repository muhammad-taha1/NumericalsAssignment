%% Solves qs 2.11 for assignment 1

% function implementing Gaussian elimination with pivoting, no pivoting and
% partial pivoting
function x = GaussianElimination(mode, A, b)

[n, ~] = size(A);
x = zeros(n,1);

% idx is used in full pivoting only
idx = [];

switch mode
    % solve using no pivoting
    case ('no pivoting')
        for i = 1 : n
            p = A(i,i);
            for j = (i+1) : n
                A(j, (i+1): n) = A(j, (i+1): n) - A(i, (i+1):n)*(A(j,i)/p);
                b(j) = b(j) - b(i)*(A(j,i)/p);
            end
        end
        
        x(n) = b(n)/A(n,n);
        
        for i = n-1:-1:1
            x(i) = (b(i)-dot(x((i+1):n), A(i, (i+1):n)))/A(i,i);
        end
        
    case ('partial pivoting')
        for i = 1 : n
            [~, maxVal] = max(abs(A(i:n,i)));
            maxVal = maxVal + i - 1;
            p = A(maxVal, i);
            
            if (i ~= maxVal)
                % perform swaps in A and b
                temp = A(i,i:n);
                A(i,i:n) = A(maxVal, i:n);
                A(maxVal,  i:n) = temp;
                
                temp2 = b(i);
                b(i) = b(maxVal);
                b(maxVal) = temp2;
            end
            
            for j = (i+1) : n
                % perform elimination
                A(j, (i+1) : n) = A(j, (i+1) : n) - A(i,(i+1):n)*(A(j,i)/p);
                b(j) = b(j)-b(i)*(A(j,i)/p);
            end
        end
        
    case ('pivoting')
        idx = 1:n;
        for i = 1 : n
            [maxA, maxVal] = max(A(i:n, i:n));
            
            % search for pivot
            [~, maxl] = max(maxA);
            maxk = maxVal(maxl)+i-1;
            
            maxl = maxl+i-1;
            p = A(maxk,maxl);
            
            if (i ~= maxk)
                %swap rows
                temp = A(i,:);
                A(i,:) = A(maxk,:);
                A(maxk,:) = temp;
                
                temp2 = b(i);
                b(i) = b(maxk);
                b(maxk) = temp2;
            end
            
            if (i ~= maxl)
                % swap columns
                temp = A(:,i);
                A(:,i) = A(:,maxl);
                A(:,maxl) = temp;
                
                % swap indexes
                temp2 = idx(i);
                idx(i) = idx(maxl);
                idx(maxl) = temp2; 
            end
            
            for j = (i+1):n
                % perform elimination
                A(j,(i+1):n) = A(j,(i+1):n) - A(i,(i+1):n)*(A(j,i)/p);
                b(j) = b(j)-b(i)*(A(j,i)/p);
                
            end
        end
        
end

% perform substitutions to arrive at final result
x(n) = b(n)/A(n,n);

for i = n-1:-1:1
    x(i) = (b(i)-dot(x((i+1):n), A(i, (i+1):n)))/A(i,i);
end

if (strcmp(mode, 'pivoting'))
    y = x;
    
    for i = 1 : n
        % reverse permuatation
        x(i) = y(idx(i));
    end  
end

% compute the residual and error norms for the solution
r = b-A*x;
x_ans = zeros(3,1);

residual_norm = norm(r, inf)
error_norm = norm(x - x_ans, inf)
end