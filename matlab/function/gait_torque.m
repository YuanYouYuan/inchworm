function [] = gait_torque(gait_name, plot_fig)
    if ~exist('plot_fig', 'var')
        plot_fig = 0;
    end
    
    load(['./data/gaits/' gait_name '.mat']); % load theta, time
    [th, dth, ddth] = joint_trajectory(theta, time, plot_fig);
    th = th*180/pi;

    if plot_fig == 1
        plot
        saveas(gcf, ['./data/gaits/traj/' file_name '.png']);
    end
end
