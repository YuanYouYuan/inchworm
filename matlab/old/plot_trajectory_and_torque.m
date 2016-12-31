close all;
clear all;
%load gait-test.mat % load time, theta

%time = [0 1 3];
%theta = [30  45 60;
%		 120 90 60;
%		 30  45 60];
load data/test-flip-gait

[th, dth, ddth, t] = joint_trajectory(theta, time, 0);
torq = torque(th, dth, ddth);

min_time = find_min_time(theta, time)

[th, dth, ddth, t] = joint_trajectory(theta, min_time, 1);
torque_exceed(theta, min_time, 1);



%exceed = torque_exceed(theta, time, 0);

%constraint(theta, dt);
%for N = 1:1000
%	N
%	for i = 1:N
%		compressed_time(N, :) = time - (time - [0 time(1:end-1)]).*rand(1, length(time));
%		if ~torque_exceed(theta, compressed_time(N, :))
%			time = compressed_time(N, :);
%		end
%	end
%end
