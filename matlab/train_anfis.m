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

% plot(var_cartesian(:, 1), var_cartesian(:, 2), 'o');
% hold on;
% t = 0:0.01:0.17;
% plot(t, parab_boundary(t), 'o-');
% axis equal;

for i = 1:3
    disp(['train the data ' num2str(i)]);
    data = [var_cartesian, var_joint(:, i)];
    trained_anfis.(['anfis' num2str(i)]) = anfis(data, 9, [20, 0, 0.01, 0.9, 1.1], [1, 1, 1, 1]);
    save('./data/trained_anfis.mat', 'trained_anfis');
end
