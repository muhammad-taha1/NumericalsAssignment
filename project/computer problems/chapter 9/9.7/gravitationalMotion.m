%% Solves qs 9.7 for project

% this function solves and plots the system of ODE provided in question
function gravitationalMotion()

t = zeros(6,3);
e = [0, 0.5, 0.9];

for i = 1 : 3
    for j = 1 : 6
        tol = 10^(-j);
        opts = odeset('relTol', tol, 'AbsTol', tol*10e-4);
        [t, y] = ode45(@systemOfEquations, 0:0.001:13, [1-e(i);0;0;sqrt((1+e(i))/(1-e(i)))], opts);
        
        E = (y(:,2).^2 + y(:,4).^2)/2 -1./sqrt(y(:,1).^2 + y(:,3).^2);
        stdOfE(j, i) = std(E);
        M = y(:,1).*y(:,4) - y(:,2).*y(:,3);
        stdOfM(j,i) = std(M);
        
        fprintf('check if std(M) and std(E) are conserved');
        stdOfE(j,:)
        stdOfM(j,:)
    end
    
    figure;
    subplot(2, 1, 1);
    plot(t, y(:,1));
    xlabel('t');
    ylabel('x');
    title(strcat('Solution of ODE for e = ', num2str(e(i))));
    grid on
    
    subplot(2,1,2);
    plot(t, y(:,3));
    xlabel('t');
    ylabel('y');
    grid on
    
    figure;
    plot(y(:,1), y(:,3));
    axis equal;
    xlabel('x');
    ylabel('y');
    
    title(strcat('orbit for e =  ', num2str(e(i))));
    
end

    function yPrime = systemOfEquations(t, y)
        r = sqrt(y(1).^2 + y(3).^2);
        yPrime = [y(2); -y(1)/r^3; y(4); -y(3)/r^3];
    end
end