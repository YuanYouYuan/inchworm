close all;
clear all;
load data/gait/GAIT_NAME

[th, dth, ddth, t] = joint_trajectory(theta, time, 0);
torq = torque(th, dth, ddth);
torque_exceed(theta, min_time, 1);

