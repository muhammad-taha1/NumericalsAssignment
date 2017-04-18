%% Solves qs 8.5 for project

% this function evaluates the given integrals
function integralEvaluation()
% given functions
functions = {'x >= 0.3', '(x<(exp(1)-2))./(x+2)' ,'(x<0).*exp(x)+(x>=0).*exp(1-x)', '(x<0.5).*exp(10*x)+(x>=0.5).*exp(10*(1-x))'};
% given bounds
lowerBounds = [0 0 -1 -1];
midBounds = [0.3 exp(1)-2 0 0.5 0.5];
upperBounds = [1 1 2 1.5];

for i = length(functions)
    f = inline(functions{i}, 'x');
    for j = 1 : 7
        % define tolerance for each integral
        tol = 10^(-j);
        tol1 = tol*(midBounds(i)-lowerBounds(i))/(upperBounds(i)-lowerBounds(i));
        tol2 = tol*(upperBounds(i)-midBounds(i))/(upperBounds(i)-lowerBounds(i));
        
        % solve quadratics
        [Q1, fcn1] = quadl(f,lowerBounds(i),midBounds(i),tol1);
        [Q2, fcn2] = quadl(f,midBounds(i),upperBounds(i),tol2);
        Q = Q1 + Q2;
        fcn = fcn1 + fcn2;
        [totQ, totfcn] = quadl(f,lowerBounds(i),upperBounds(i),tol);
        
        fprintf('results per itereation');
        tol
        Q1
        fcn1
        Q2
        fcn2
        totQ
        totfcn
        
    end
end

end