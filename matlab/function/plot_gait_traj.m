function plot_gait_traj(gait_traj)
    figure('Name', ['Joint trajectory of ' gait_traj.name], 'Position', [100, 100, 1600, 900]);

    % here we only want the trajectory of joint3~5
    t     = gait_traj.t;
    th    = rad2deg(gait_traj.th(3:5, :));
    dth   = gait_traj.dth(3:5, :);
    ddth  = gait_traj.ddth(3:5, :);
    time  = gait_traj.time;
    theta = gait_traj.theta(3:5, :);



    n = size(theta, 1);
    for i = 1:n
        subplot_fcn(i, 1, th, '\theta(deg)');
        plot(time, theta(i, :), 'o'); hold on;
        subplot_fcn(i, 2, dth, '\omega(rad/s)  ');
        subplot_fcn(i, 3, ddth, '\alpha(rad/s^{2})');
    end

    saveas(gcf, ['./data/gaits/traj/' gait_traj.name '.png'])

    function subplot_fcn(joint_number, row_number, var, var_name)
        subplot(3, n, joint_number + (row_number - 1) * n);
        plot(t, var(joint_number, :)); hold on;
        title(['Joint' num2str(joint_number + 2)]); % plus 2 since only joint3~5
        ax = gca;
        ax.XLabel.String = 'time(s)';
        ax.YLabel.String = var_name;
        ax.YLabel.FontSize = 14;
        ax.XTick = time;
        grid on;
    end
end


