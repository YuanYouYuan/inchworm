clear all;
close all;
addpath('./function');

gait_name = 'flip_climb_up_gait';
gait = load(['data/gaits/' gait_name]) ;

load(['./data/gaits/traj/' gait_name '.mat'], 'gait_traj');
theta = rad2deg(gait_traj.th(:, 214));
fixed_point = gait.fixed_point;
inchworm = inchworm_model(theta, fixed_point);
plot_inchworm(inchworm);
