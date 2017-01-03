close all;
clear all;
addpath('./function');

% gait_name = 'concave_flip_gait'
gait_name = 'concave_flip_gait_shrink'
% gait_name = 'climb_up_plan'
% gait_name = 'convex_flip_gait'
gait = load(['./data/gaits/' gait_name]);

% gait_traj = gait_trajectory(gait);
% gait_torq = gait_torque(gait_traj);
% plot_gait_torq(gait_torq);


% save the opti result to new gait
name = ['opti_' gait_name];
time = find_min_time(gait);
theta = gait.theta;
fixed_point = gait.fixed_point;
save(['./data/gaits/' name], 'name', 'time', 'theta', 'fixed_point');



