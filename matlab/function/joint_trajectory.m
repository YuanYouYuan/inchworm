function [th, dth, ddth, t] = joint_trajectory(theta, time, plot_figure)
	theta = theta*pi/180;
	t = time(1):0.01:time(end);
    n = size(theta, 1);

	for i = 1:n

		% spline_th   = spline(time, [0 theta(i,:) 0]); 
		% clamped boundary condition with initail/final velocity = 0
		% spline_th   = spline(time, theta(i,:));       
		% natural boundary condition
		% spline_th   = csape(time, theta(i,:), 'clamped', [0 0]);       
		spline_th   = csape(time, theta(i,:), 'second', [0 0]);       
		% spline_th   = csape(time, theta(i,:));       
		spline_dth  = fnder (spline_th, 1);
		spline_ddth = fnder (spline_th, 2);

		th(i,:)   = ppval(spline_th,   t);
		dth(i,:)  = ppval(spline_dth,  t);
		ddth(i,:) = ppval(spline_ddth, t);
    end
    
	if exist('plot_figure', 'var') && plot_figure == 1
		figure('Name', 'Joint Trajectory', 'Position', [100, 100, 1920, 1080]);
		for i = 1:n
			grid on;
			subplot(3, n, i);
			plot(time, theta(i, :)*180/pi, 'o'); hold on;
			plot(t, th(i,:)*180/pi); hold on;
			title(['Joint' num2str(i)]);
			xlabel('time(s)');
			ylabel('\theta(deg)', 'FontSize', 14);
			set(gca, 'xtick', time);
			grid on;
		
			subplot(3, n, i+n);
			plot(t, dth(i,:)), hold on;
			xlabel('time(s)');
			ylabel('\omega(rad/s)  ', 'FontSize', 14);
			set(gca, 'xtick', time);
			grid on;
		
			subplot(3, n, i+2*n);
			plot(t, ddth(i,:)), hold on;
			xlabel('time(s)');
			ylabel('\alpha(rad/s^{2})', 'FontSize', 14);
			set(gca, 'xtick', time);
			grid on;
		end
	end
end
