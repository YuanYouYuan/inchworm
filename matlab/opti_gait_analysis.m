clear all;
close all;
addpath('./function');

gait_name = 'opti_concave_flip_gait';
gait = load(['data/gaits/' gait_name]) ;


gait_traj = gait_trajectory(gait);
gait_torq = gait_torque(gait_traj);
export_gait_traj(gait_traj); % export csv data of theta 
plot_gait_traj(gait_traj);
plot_gait_torq(gait_torq);

frames = gait_frames(gait_traj, gait.fixed_point);

% load(['data/gaits/frames/' gait_name])
save_gait_animation(frames, gait);
frames_gui(gait_name)


% save(['data/gaits/' gait_name], 'name', 'theta', 'time', 'fixed_point', 'gait_torq', 'gait_traj', 'frames' );


