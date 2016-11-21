close all;
clear all;

load data/test_flip_gait
min_time = find_min_time(theta, time)
torque_exceed(theta, min_time, 1, 1);



