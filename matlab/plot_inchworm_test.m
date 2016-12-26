clear all;
close all;
addpath('./function');

gait = load('./data/gaits/one_step_gait');
fixed_point.x = 0;
fixed_point.y = 0.5;
fixed_point.rotation = -90;
inchworm = inchworm_model(deg2rad(gait.theta(:,1)), fixed_point);

ax = gca;
ax.NextPlot = 'Add';
grid on;

for part = [inchworm.head, inchworm.tail, inchworm.joint]
    plot(part.x, part.y, 'bo-', 'LineWidth', 4, 'MarkerSize', 10, ... 
                'MarkerFaceColor', 'Yellow');
end

head = [inchworm.head.x inchworm.head.y]

% function check_adhere(inchworm, )
axis equal


