clear all;
close all;

theta =[ 0.8474, 90.0000, -50.6020, 54.0581, -88.5805, 90.0000, -99.2131];
theta = deg2rad(theta);

addpath('./function');

fixed_point.x = 0.13;
fixed_point.y = 0;
fixed_point.rotation = 0;
fixed_point.is_switch = false;


figure(1);
ax = gca;
ax.XLim = [-0.5 0.5];
ax.YLim = [0 1];
ax.XTick = [-0.5:0.1:0.5];
ax.YTick = [0:0.1:1];
ax.NextPlot = 'Add';
grid on;
inchworm = inchworm_model(theta, fixed_point);
for part = [inchworm.head, inchworm.tail, inchworm.joint]
    plot(part.x, part.y, 'bo-', 'LineWidth', 4, 'MarkerSize', 10, ... 
                'MarkerFaceColor', 'Yellow');
end


axis equal


fixed_point.x = 0;
fixed_point.y = 0.3317;
fixed_point.rotation = -90;
fixed_point.is_switch = 1;


figure(2);
ax = gca;
ax.XLim = [-0.5 0.5];
ax.YLim = [0 1];
ax.XTick = [-0.5:0.1:0.5];
ax.YTick = [0:0.1:1];
ax.NextPlot = 'Add';
grid on;
inchworm = inchworm_model(theta, fixed_point);
for part = [inchworm.head, inchworm.tail, inchworm.joint]
    plot(part.x, part.y, 'bo-', 'LineWidth', 4, 'MarkerSize', 10, ... 
                'MarkerFaceColor', 'Yellow');
end

axis equal
