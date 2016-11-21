close all;
clear all;

%time = [0 1 3];
%theta = [30  45 60;
%		 120 90 60;
%		 30  45 60];

load data/test_flip_gait
%load data/old_flip_gait
%theta = [-90 0 90;
%		0 90 90;
%		-90 0 90];
%time = [0 1 2]

%[th, dth, ddth, t] = joint_trajectory(theta, time, 0);
%torq = torque(th, dth, ddth);

min_time = find_min_time(theta, time)
torque_exceed(theta, min_time, 1, 1);


%exceed = torque_exceed(theta, time, 0);

