clear all;
close all;
addpath('./function');

% gait_name = 'new_gait';
% gait_name = 'square_gait';
% gait_name = 'line_gait';
gait_name = 'cross_gait';
gait = load(['./data/gaits/' gait_name]);

gait_traj = new_gait_traj(gait);
joint_traj = traj_IK(gait_traj);
export_joint_traj(joint_traj);



% fixed_point.x = 0;
% fixed_point.y = 0;
% fixed_point.rotation = 0;
% fixed_point.is_switch = false;
% 
% new_gait_frames(joint_traj, fixed_point);
