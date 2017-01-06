close all;
clear all;
addpath('./function');

fixed_point.x = 0;
fixed_point.y = 0;
fixed_point.rotation = 0;
fixed_point.is_switch = false;
gait.fixed_point = fixed_point;
gait.time = [0 1 2];
gait.name = 'flip_3pt';

[th1_grid, th2_grid, th3_grid] = meshgrid(-45:10:45, -90:10:90, -45:10:45);
th_grid = [th1_grid(:) th2_grid(:) th3_grid(:)];
ini_theta = [-90 90  45  90  45 90  90];
fin_theta = [-90 90 -45 -90 -45 90 -90];

% mid_theta = [-90 90 -45 90 45 90 -90];
% gait.theta = [ini_theta; mid_theta; fin_theta]';
% find_min_time(gait);
% gait_traj = gait_trajectory(gait);
% gait_frames(gait_traj, gait.fixed_point);

for i = 1:size(th_grid, 1)
    mid_theta = [-90 90 th_grid(i, :) 90 -90]
    gait.theta = [ini_theta; mid_theta; fin_theta]';
    min_time = find_min_time(gait);
    min_time(i) = round(min_time(end), 3)
end




