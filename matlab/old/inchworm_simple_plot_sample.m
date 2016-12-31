clear all;
close all;
addpath('./function');

fixed_point.x = 0;
fixed_point.y = 0;
fixed_point.rotation = 0;
fixed_point.is_switch = false;


theta = [90 90 45 90 45 90 90];
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



