
clear all;
close all;
load('./data/new_parameter.mat');
theta1 = 0:0.1:pi/2;
theta2 = 0:0.1:deg2rad(130);
theta3 = 0:0.1:pi/2;

[THETA1, THETA2, THETA3] = meshgrid(theta1, theta2, theta3);

X = L(2) * cos(pi/2 - THETA1) + L(3) * cos(pi/2 - THETA1 - THETA2) + L(4) * cos(pi/2 - THETA1 - THETA2 - THETA3);
Y = L(1) + L(2)* sin(pi/2 - THETA1) + L(3) * sin(pi/2 - THETA1 - THETA2) + L(4) * sin(pi/2 - THETA1 - THETA2 - THETA3);
PHI = pi - THETA1 - THETA2 - THETA3;

n = prod(size(X));
X = reshape(X,[long,1]);
Y = reshape(Y,[long,1]);
PHI = reshape(PHI,[long,1]);
THETA1 = reshape(THETA1,[long,1]);
THETA2 = reshape(THETA2,[long,1]);
THETA3 = reshape(THETA3,[long,1]);

% delete the element if y coordinate is negative
for i = 1:length(Y(:))
    if Y(i) < 0

    end
end



i = 1;
while i <= long
    if Y(i)<0
        X(i) = [];Y(i) = [];PHI(i) = [];THETA1(i) = [];THETA2(i) = [];THETA3(i) = [];
        i = i-1;
        long = long-1;
    end
    i = i+1;
end

data1 = [X(:) Y(:) PHI(:) THETA1(:)];
data2 = [X(:) Y(:) PHI(:) THETA2(:)];
data3 = [X(:) Y(:) PHI(:) THETA3(:)];


plot(X(:), Y(:), 'r.');hold on
axis equal;
xlabel('x', 'FontSize', 10);
ylabel('y', 'FontSize', 10);

title('x-y co-ordinates generated for all theta1 and theta2 combinations using forward kinematics formula', 'FontSize', 10);

addpath('./function');

fixed_point.x = 0;
fixed_point.y = 0;
fixed_point.rotation = 0;
fixed_point.is_switch = false;


theta = [90 90 90 -90 90 90 90]; 
ax = gca;
ax.XLim = [-0.5 0.5];
ax.YLim = [0 0.5];
ax.XTick = [-0.5:0.1:0.5];
ax.YTick = [0:0.1:0.5];
ax.NextPlot = 'Add';
grid on;
inchworm = inchworm_model(deg2rad(theta), fixed_point);
for part = [inchworm.head, inchworm.tail, inchworm.joint]
    plot(part.x, part.y, 'bo-', 'LineWidth', 4, 'MarkerSize', 10, ... 
                'MarkerFaceColor', 'Yellow');
end
axis equal


% disp('train first ... ');
% anfis1 = anfis(data1, 6, [20 0 0.01 0.9 1.1], [1,1,1,1]);
% disp('train second ... ');
% anfis2 = anfis(data2, 6, [20 0 0.01 0.9 1.1], [1,1,1,1]);
% disp('train third ... ');
% anfis3 = anfis(data3, 6, [20 0 0.01 0.9 1.1], [1,1,1,1]);

load('anfis1.mat');
load('anfis2.mat');
load('anfis3.mat');

th1 = 0:0.2:pi/4;
th2 = 0:0.2:pi/2;
th3 = 0:0.2:pi/4;
 
[THETA1D THETA2D THETA3D] = meshgrid(th1,th2,th3);

x = L(2) * cos(pi/2 - THETA1D) + L(3) * cos(pi/2 - THETA1D - THETA2D) + L(4) * cos(pi/2 - THETA1D - THETA2D - THETA3D);
y = L(1) + L(2)* sin(pi/2 - THETA1D) + L(3) * sin(pi/2 - THETA1D - THETA2D) + L(4) * sin(pi/2 - THETA1D - THETA2D - THETA3D);
phi = pi - THETA1D - THETA2D - THETA3D;


% P means predicted by ANFIS
XYP = [x(:) y(:) phi(:)];
THETA1P = evalfis(XYP, anfis1);
THETA2P = evalfis(XYP, anfis2);
THETA3P = evalfis(XYP, anfis3);

% diff means the error between D and P
theta1diff = (THETA1D(:) - THETA1P)./THETA1D(:);
theta2diff = (THETA2D(:) - THETA2P)./THETA2D(:);
theta3diff = (THETA3D(:) - THETA3P)./THETA3D(:);

figure;
subplot(3, 1, 1);
plot(theta1diff);
ylabel('THETA1D - THETA1P', 'fontsize', 10);
title('Deduced theta1 - Predicted theta1', 'fontsize', 10);

subplot(3, 1, 2);
plot(theta2diff);
ylabel('THETA2D - THETA2P', 'fontsize', 10);
title('Deduced theta2 - Predicted theta2', 'fontsize', 10);

subplot(3, 1, 3);
plot(theta3diff);
ylabel('THETA3D - THETA3P', 'fontsize', 10);
title('Deduced theta3 - Predicted theta3', 'fontsize', 10);

save ANFIS_trained anfis1 anfis2 anfis3
%}
