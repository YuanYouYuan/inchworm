function [] = gait_trajectory(gait_name, csv_name)
    load(['./data/gaits/' gait_name '.mat']); % load theta, time
    plot_figure = 1;
    [th, dth, ddth] = joint_trajectory(theta, time, plot_figure);
    th = th*180/pi;
    csvwrite(['./data/gaits/csv/' csv_name '.csv'], th);
end
