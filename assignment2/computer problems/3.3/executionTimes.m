%% Solves qs 3.3 for assignment 2

% This function computes the execution times of LU factorization, and
% attempts to find a cubic polynomial to fit the exection timings.
function executionTimes()

% iterate over 10 values
maxK = 10;
n = zeros(maxK, 1);
t = zeros(maxK, 1);

% perform each facotrization 10 times and store the average execution time
iteration = 10;

for k = 1:maxK
    % increase n and size of for each iteration of this loop and perform
    % the lu factorization
    n(k) = 100+100*(k-1);
    A = rand(n(k), n(k));
    tic;
    for j = 1:iteration
        lu(A);
    end
    
    % store toc for each iteration.
    t(k) = toc/iteration;
end

% matrix A now contains the cubic polynomials of the size used in LU
% factorization per iteration
A = ones(length(n),4);
for j = 2:4
    A(:,j) = A(:,j-1).*n;
end

x = A\t;
% ns contains the plot range 
ns = 100:10:1000;
% polynomial equation
ts = x(1)+ns.*(x(2)+ns.*(x(3)+ns*x(4)));

plot(n,t,'bx',ns,ts,'r-');
title('Execution times against n');
xlabel('n');
ylabel('t (s)');
grid on;
% using the above method, we can estimate the time for matrix of order
% 10,000
t_10000 = x(1)+10000*(x(2)+10000*(x(3)+10000*x(4)))


