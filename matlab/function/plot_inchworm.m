function plot_inchworm(inchworm)
    ax = gca;
    ax.XLim = [-0.5 0.5];
    ax.YLim = [-0.3 0.5];
    ax.XTick = [-0.5:0.1:0.5];
    ax.YTick = [-0.3:0.1:0.5];
    ax.NextPlot = 'Add';
    grid on;

    plot(inchworm.head.x, inchworm.head.y, 'bo-', 'LineWidth', 4, ... 
        'MarkerSize', 10, 'MarkerFaceColor', suction_cup_status(1));
    plot(inchworm.tail.x, inchworm.tail.y, 'bo-', 'LineWidth', 4, ... 
        'MarkerSize', 10, 'MarkerFaceColor', suction_cup_status(2));
    plot(inchworm.joint.x, inchworm.joint.y, 'bo-', 'LineWidth', 4, ... 
        'MarkerSize', 10, 'MarkerFaceColor', 'Yellow');
    axis equal


    function face_color = suction_cup_status(i)
        if inchworm.suction_cup(i)
            face_color = 'Red';
        else
            face_color = 'Yellow';
        end
    end
end
