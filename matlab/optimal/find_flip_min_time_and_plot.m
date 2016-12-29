close all;
clear all;

addpath('./../function');
gait = load('../data/gaits/test_flip_gait.mat');

min_time = find_min_time(gait.theta, gait.time)
% torque_exceed(gait.theta, min_time, 1, 1);



