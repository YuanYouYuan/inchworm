function exceed = torque_exceed(theta, time, plot_figure)   
	[th, dth, ddth, t] = joint_trajectory(theta, time);
	torq = torque(th, dth, ddth);
	rated_torq = (-25.8/(pi/3/0.18)*abs(dth([1 2], :))+25.8)*9.8*0.01;
	exceed = abs(torq) > rated_torq*0.8;

	if exist('plot_figure', 'var') && plot_figure == 1
		figure('Name', 'torque')
		for i = 1:size(torq, 1)
			subplot(size(torq, 1), 1, i);
			plot(t, torq(i, :), 'o-'), hold on;
			plot(t, rated_torq(i, :), 'r'); hold on;
			plot(t, -rated_torq(i, :), 'r'); hold on;
			title(['Joint' num2str(i)]);
			xlabel('time(s)');
			ylabel('\tau(N*m)', 'FontSize', 14);
			legend('torque', 'rated_torque');
		end
	end

end
