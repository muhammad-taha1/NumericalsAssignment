%% Solves qs 9.8 for project

% this function solves and plots the system of ODE provided in question
function threeBody()

% initiate all initial variables and constants
d = 4.669e6;
G = 6.67259e-11;
M = 5.974e24;
m = 7.348e22;
uStar = M/(m+M);
u = m/(m+M);
D = 3.844e8;
d = 4.669e6;
omega = 2.661e-6;
y0 = [4.613e8; 0; 0; -1074];

for i = 1 : 6
    tol = 10^(-i);
    opts = odeset('RelTol', tol, 'AbsTol', tol*1e-3);
    [t,y] = ode45(@systemOfEquations, [0,2.4e6], y0, opts);
end

figure;
subplot(2,1,1);
plot(t, y(:,1));
xlabel('t');
ylabel('x');
title('Solution of ODE');
grid on

subplot(2,1,2);
plot(t, y(:,3));
xlabel('t');
ylabel('y');
grid on

figure;
steps = t(2:end)-t(1:end-1);
plot(t(1:end-1),steps);
xlabel('t');
ylabel('step size');
title('step size');
grid on

figure;
plot(y(:,1), y(:,3));
axis equal;
xlabel('x');
ylabel('y');
hold on;
title('computed orbit');
plot(-d,0,'*');
plot(3.844e8-d,0,'*')
text(-3d7,-5e7,'earth');
text(3.5e8,-5e7,'moon')

    function yPrime = systemOfEquations(t,y)
        r1 = sqrt((y(1)+d)^2+y(3)^2); 
        r2 = sqrt((D-d-y(1))^2+y(3)^2);
        yPrime = [y(2); -G*(M*(y(1)+u*D)/r1^3+m*(y(1)-uStar*D)/r2^3)+omega^2*y(1)+2*omega*y(4); y(4); -G*(M*y(3)/r1^3+m*y(3)/r2^3)+omega^2*y(3)-2*omega*y(2)];
    end

end