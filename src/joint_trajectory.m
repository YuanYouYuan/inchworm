function [th, dth, ddth, t] = joint_trajectory(theta, time, partition, plot_figure)
	t = time(1):partition:time(end);

	for i = 1:size(theta,1)
		spline_th   = spline(time, [0 theta(i,:) 0]);
		spline_dth  = fnder (spline_th, 1);
		spline_ddth = fnder (spline_th, 2);

		th(i,:)   = ppval(spline_th,   t);
		dth(i,:)  = ppval(spline_dth,  t);
		ddth(i,:) = ppval(spline_ddth, t);
	end

	if exist('plot_figure', 'var') && plot_figure == 1
		figure('Name', 'Joint Trajectory');
		for i = 1:size(theta,1)
			grid on;
			subplot(3, 3, i);
			plot(time, theta(i, :), 'o'); hold on;
			plot(t, th(i,:)); hold on;
			title(['Joint' num2str(i)]);
			xlabel('time(s)');
			ylabel('\theta(rad)', 'FontSize', 14);
			set(gca, 'xtick', time);
			grid on;
		
			subplot(3, 3, i+3);
			plot(t, dth(i,:)), hold on;
			xlabel('time(s)');
			ylabel('\omega(rad/s)  ', 'FontSize', 14);
			set(gca, 'xtick', time);
			grid on;
		
			subplot(3, 3, i+6);
			plot(t, ddth(i,:)), hold on;
			xlabel('time(s)');
			ylabel('\alpha(rad/s^{2})', 'FontSize', 14);
			set(gca, 'xtick', time);
			grid on;
		end
	end
end
