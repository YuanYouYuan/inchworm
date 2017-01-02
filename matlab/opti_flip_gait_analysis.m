close all;
clear all;
addpath('./function');

gait_name = 'opti_concave_flip_gait'
gait = load(['./data/gaits/' gait_name]);

gait_traj = gait_trajectory(gait);
gait_torq = gait_torque(gait_traj);
plot_gait_torq(gait_torq);


% min_time = find_min_time(gait.theta, gait.time)



