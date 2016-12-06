function [] = gait_trajectory(gait_name, file_name)
    if ~exist('file_name', 'var')
        file_name = gait_name;
    end
    load(['./data/gaits/' gait_name '.mat']); % load theta, time
    plot_figure = 1;
    [th, dth, ddth] = joint_trajectory(theta, time, plot_figure);
    th = th*180/pi;
    csvwrite(['./data/gaits/csv/' file_name '.csv'], th);
    saveas(gcf, ['./data/gaits/traj/' file_name '.png']);
end
