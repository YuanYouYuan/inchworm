close all;
clear all;
time = [0 2 4 7 10];
theta = [0 pi/2 pi/5 pi/3 pi/4;
		 0 pi/4 pi/3 pi/3 pi/2;
		 0 pi/3 pi/6 pi/2 pi/4];
partition = 0.01;
[th, dth, ddth, t] = joint_trajectory(theta, time, partition, 1);

torq = torque(th, dth, ddth);
figure('Name', 'torque')
for i = 1:size(torq, 1)
	subplot(size(torq, 1), 1, i);
	plot(t, torq(i, :)), hold on;
	title(['Joint' num2str(i)]);
	xlabel('time(s)');
	ylabel('\tau(N*m)', 'FontSize', 14);
end



