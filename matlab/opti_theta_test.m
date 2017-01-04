clear all;
close all;
addpath('./function');

gait_name = 'convex_flip_3pt';
gait = load(['./data/gaits/' gait_name]);

theta_index = 5;
[min_time, min_theta] = find_min_time_theta(gait, theta_index);

disp(['orginal theta' num2str(theta_index)]);
gait.theta(theta_index, :)

disp(['new theta' num2str(theta_index)]);
min_theta(theta_index, :)

