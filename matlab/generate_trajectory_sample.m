close all;
clear all;
load data/test_flip_gait; % load theta, time
[th, ~, ~] = joint_trajectory(theta, time);
