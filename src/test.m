close all;
clear all;
load gait-test.mat % load time, theta

%time = [0 2 4 7 10];
%theta = [0 pi/2 pi/5 pi/3 pi/4;
%		 0 pi/4 pi/3 pi/3 pi/2;
%		 0 pi/3 pi/6 pi/2 pi/4];
%[th, dth, ddth, t] = joint_trajectory(theta, time, 0);
%torq = torque(th, dth, ddth);

exceed = torque_exceed(theta, time, 1);

