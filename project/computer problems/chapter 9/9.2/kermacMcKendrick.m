%% Solves qs 9.2 for project

% this function solves and plots the system of ODE provided in question
function kermacMcKendrick()

% the selected steps in the time span is used to give a smooth curve
[t, y] = ode45(@systemOfEquations, 0:0.001:1, [95;5;0]);

% plot the result
plot(t,y(:,1),t,y(:,2),t,y(:,3));
legend('y1','y2','y3');
xlabel('t');
ylabel('y');
grid on
title('Kermack McKendrick model');

    % this function writes the given system of equations so that it can be
    % used by ode45
    function yprime = systemOfEquations(t, y)
        c = 100;
        d = 5;
        yprime = [-c*y(1)*y(2); c*y(1)*y(2) - d*y(2); d*y(2)];
    end
        
end