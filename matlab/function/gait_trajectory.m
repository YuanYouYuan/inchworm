function [] = gait_trajectory(gait_name, plot_fig, file_name)
    if ~exist('file_name', 'var')
        file_name = gait_name;
    end
    
    if ~exist('plot_fig', 'var')
        plot_fig = 0;
    end
    
    load(['./data/gaits/' gait_name '.mat']); % load theta, time
    [th, dth, ddth] = joint_trajectory(theta, time, plot_fig);
    th = th*180/pi;
    csvwrite(['./data/gaits/csv/' file_name '.csv'], th);
    csvwrite(['R:\c\' file_name '.csv'], th);
    if plot_fig == 1
        saveas(gcf, ['./data/gaits/traj/' file_name '.png']);
    end
end
