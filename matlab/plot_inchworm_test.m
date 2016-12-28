clear all;
close all;
addpath('./function');

gait = load('./data/gaits/flip_climb_up_gait');
fixed_point.x = 0.1;
fixed_point.y = 0;
fixed_point.rotation = 0;
fixed_point.is_switch = false;

[th, ~, ~, t] = joint_trajectory(gait.theta, gait.time);


for i=1:length(t)
    cla;
    ax = gca;
    ax.XLim = [-0.5 0.5];
    ax.YLim = [0 0.5];
    ax.XTick = [-0.5:0.1:0.5];
    ax.YTick = [0:0.1:0.5];
    ax.NextPlot = 'Add';
    grid on;
    inchworm = inchworm_model(th(:, i), fixed_point);
    % for part = [inchworm.head, inchworm.tail, inchworm.joint]
    %     plot(part.x, part.y, 'bo-', 'LineWidth', 4, 'MarkerSize', 10, ... 
    %                 'MarkerFaceColor', 'Yellow');
    % end



    if inchworm.suction_cup(1)
        face_color = 'Red';
    else
        face_color = 'Yellow';
    end
    plot(inchworm.head.x, inchworm.head.y, 'bo-', 'LineWidth', 4, ... 
        'MarkerSize', 10, 'MarkerFaceColor', face_color);

    if inchworm.suction_cup(2)
        face_color = 'Red';
    else
        face_color = 'Yellow';
    end
    plot(inchworm.tail.x, inchworm.tail.y, 'bo-', 'LineWidth', 4, ... 
        'MarkerSize', 10, 'MarkerFaceColor', face_color);


    plot(inchworm.joint.x, inchworm.joint.y, 'bo-', 'LineWidth', 4, ... 
        'MarkerSize', 10, 'MarkerFaceColor', 'Yellow');

    pause(0.05)
    fixed_point = inchworm.fixed_point;

    axis equal
end
