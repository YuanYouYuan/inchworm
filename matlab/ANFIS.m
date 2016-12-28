clear all;
close all;


l1 = 10;
l2 = 7;

theta1 = 0:0.1:pi/2;
theta2 = 0:0.1:pi;

[THETA1, THETA2] = meshgrid(theta1, theta2);

X = l1 * cos(THETA1) + l2 * cos(THETA1 + THETA2);
Y = l1 * sin(THETA1) + l2 * sin(THETA1 + THETA2);

data1 = [X(:) Y(:) THETA1(:)];
data2 = [X(:) Y(:) THETA2(:)];

plot(X(:), Y(:), 'r.');
axis equal;
xlabel('x', 'FontSize', 10);
ylabel('y', 'FontSize', 10);

title('x-y co-ordinates generated for all theta1 and theta2 combinations using forward kinematics formula', 'FontSize', 10);

disp('train first ... ');
anfis1 = anfis(data1, 7, 150, [0,0,0,0]);
disp('train second ... ');
anfis2 = anfis(data2, 6, 150, [0,0,0,0]);


x = 0:0.1:2;
y = 8:0.1:10;


% D means derive by exact solution
[X,Y] = meshgrid(x,y);
c2 = (X.^2 + Y.^2 - l1^2 - l2^2)/(2*l1*l2);
s2 = sqrt(1 - c2.^2);
THETA2D = atan2(s2, c2);

k1 = l1 + l2.*c2;
k2 = l2 * s2;
THETA1D = atan2(Y, X) - atan2(k2, k1);

% P means predicted by ANFIS
XY = [X(:) Y(:)];
THETA1P = evalfis(XY, anfis1);
THETA2P = evalfis(XY, anfis2);

% diff means the error between D and P
theta1diff = THETA1D(:) - THETA1P;
theta2diff = THETA2D(:) - THETA2P;

subplot(2, 1, 1);
plot(theta1diff);
ylabel('THETA1D - THETA1P', 'fontsize', 10);
title('Deduced theta1 - Predicted theta1', 'fontsize', 10);

subplot(2, 1, 2);
plot(theta2diff);
ylabel('THETA2D - THETA2P', 'fontsize', 10);
title('Deduced theta2 - Predicted theta2', 'fontsize', 10);

save ANFIS_trained anfis1 anfis2
