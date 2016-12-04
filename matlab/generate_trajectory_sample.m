close all;
clear all;
addpath('./function')
load('./data/gaits/test_flip_gait.mat'); % load theta, time
plot_figure = 1;
[th, dth, ddth] = joint_trajectory(theta, time, plot_figure);
