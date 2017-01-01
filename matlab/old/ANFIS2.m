clear all;
close all;
addpath('./function');

th1_range = -pi/2:0.1:pi/2;
th2_range = -deg2rad(130):0.1:deg2rad(130);
th3_range = -pi/2:0.1:pi/2;


[th1, th2, th3] = meshgrid(th1_range, th2_range, th3_range);

[x, y, phi] = FK(th1, th2, th3);


% delete the element if y coordinate is negative
var_cartesian = [];
var_joint = [];

parab_boundary = @(x) -0.22/0.0289 * x.^2 + 0.22;
for i = 1:length(y(:))
    if y(i) >= 0 & x(i) >= 0 & (y(i) - parab_boundary(x(i))) > 0
       var_cartesian = [var_cartesian; [x(i) y(i) phi(i)]];
       var_joint = [var_joint; [th1(i) th2(i) th3(i)]];
    end
end

plot(var_cartesian(:, 1), var_cartesian(:, 2), 'o');
hold on;
t = 0:0.01:0.17;
plot(t, parab_boundary(t), 'o-');
axis equal;

for i = 1:3
    disp(['train the data ' num2str(i)]);
    data = [var_cartesian, var_joint(:, i)];
    trained_anfis.(['anfis' num2str(i)]) = anfis(data, 3, [2, 0, 0.01, 0.9, 1.1], [1, 1, 1, 1]);
    save('./data/trained_anfis.mat', 'trained_anfis');
end
% % disp('train first ... ');
% % anfis1 = anfis(data1, 6, [20 0 0.01 0.9 1.1], [1,1,1,1]);
% % disp('train second ... ');
% % anfis2 = anfis(data2, 6, [20 0 0.01 0.9 1.1], [1,1,1,1]);
% % disp('train third ... ');
% % anfis3 = anfis(data3, 6, [20 0 0.01 0.9 1.1], [1,1,1,1]);

% axis equal;
% xlabel('x', 'FontSize', 10);
% ylabel('y', 'FontSize', 10);
% 
% title('x-y co-ordinates generated for all theta1 and theta2 combinations using forward kinematics formula', 'FontSize', 10);
% 
% addpath('./function');
% 
% fixed_point.x = 0;
% fixed_point.y = 0;
% fixed_point.rotation = 0;
% fixed_point.is_switch = false;
% 
% 
% theta = [90 90 90 -90 90 90 90]; 
% ax = gca;
% ax.XLim = [-0.5 0.5];
% ax.YLim = [0 0.5];
% ax.XTick = [-0.5:0.1:0.5];
% ax.YTick = [0:0.1:0.5];
% ax.NextPlot = 'Add';
% grid on;
% inchworm = inchworm_model(deg2rad(theta), fixed_point);
% for part = [inchworm.head, inchworm.tail, inchworm.joint]
%     plot(part.x, part.y, 'bo-', 'LineWidth', 4, 'MarkerSize', 10, ... 
%                 'MarkerFaceColor', 'Yellow');
% end
% axis equal
% 
% 
% % disp('train first ... ');
% % anfis1 = anfis(data1, 6, [20 0 0.01 0.9 1.1], [1,1,1,1]);
% % disp('train second ... ');
% % anfis2 = anfis(data2, 6, [20 0 0.01 0.9 1.1], [1,1,1,1]);
% % disp('train third ... ');
% % anfis3 = anfis(data3, 6, [20 0 0.01 0.9 1.1], [1,1,1,1]);
% 
% load('anfis1.mat');
% load('anfis2.mat');
% load('anfis3.mat');
% 
% th1 = 0:0.2:pi/4;
% th2 = 0:0.2:pi/2;
% th3 = 0:0.2:pi/4;
%  
% [THETA1D THETA2D THETA3D] = meshgrid(th1,th2,th3);
% 
% x = L(2) * cos(pi/2 - THETA1D) + L(3) * cos(pi/2 - THETA1D - THETA2D) + L(4) * cos(pi/2 - THETA1D - THETA2D - THETA3D);
% y = L(1) + L(2)* sin(pi/2 - THETA1D) + L(3) * sin(pi/2 - THETA1D - THETA2D) + L(4) * sin(pi/2 - THETA1D - THETA2D - THETA3D);
% phi = pi - THETA1D - THETA2D - THETA3D;
%
% 
% % P means predicted by ANFIS
% XYP = [x(:) y(:) phi(:)];
% THETA1P = evalfis(XYP, anfis1);
% THETA2P = evalfis(XYP, anfis2);
% THETA3P = evalfis(XYP, anfis3);
% 
% % diff means the error between D and P
% theta1diff = (THETA1D(:) - THETA1P)./THETA1D(:);
% theta2diff = (THETA2D(:) - THETA2P)./THETA2D(:);
% theta3diff = (THETA3D(:) - THETA3P)./THETA3D(:);
% 
% figure;
% subplot(3, 1, 1);
% plot(theta1diff);
% ylabel('THETA1D - THETA1P', 'fontsize', 10);
% title('Deduced theta1 - Predicted theta1', 'fontsize', 10);
% 
% subplot(3, 1, 2);
% plot(theta2diff);
% ylabel('THETA2D - THETA2P', 'fontsize', 10);
% title('Deduced theta2 - Predicted theta2', 'fontsize', 10);
% 
% subplot(3, 1, 3);
% plot(theta3diff);
% ylabel('THETA3D - THETA3P', 'fontsize', 10);
% title('Deduced theta3 - Predicted theta3', 'fontsize', 10);
% 
% save ANFIS_trained anfis1 anfis2 anfis3
% %}
