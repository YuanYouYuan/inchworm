function traj = joint_trajectory(theta, time, plot_figure)
    theta = deg2rad(theta);
	t = time(1):0.01:time(end);
    n = size(theta, 1);

	for i = 1:n

		% spline_th   = spline(time, [0 theta(i,:) 0]); 
		% ===clamped boundary condition with initail/final velocity = 0 ===
		% spline_th   = spline(time, theta(i,:));       
		% ===natural boundary condition===
		% spline_th   = csape(time, theta(i,:), 'clamped', [0 0]);       
		spline_th   = csape(time, theta(i,:), 'second', [0 0]);       
		% spline_th   = csape(time, theta(i,:));       
		spline_dth  = fnder (spline_th, 1);
		spline_ddth = fnder (spline_th, 2);

		th(i,:)   = ppval(spline_th,   t);
		dth(i,:)  = ppval(spline_dth,  t);
		ddth(i,:) = ppval(spline_ddth, t);
    end

    traj.t = t;
    traj.th = th;
    traj.dth = dth;
    traj.ddth = ddth;

	if exist('plot_figure', 'var') && plot_figure == 1
		figure('Name', 'Joint Trajectory', 'Position', [100, 100, 1600, 900]);
		for i = 1:n
            subplot_fcn(i, 1, th, '\theta(deg)');
			plot(time, rad2deg(theta(i, :)), 'o'); hold on;
            subplot_fcn(i, 2, dth, '\omega(rad/s)  ');
            subplot_fcn(i, 3, ddth, '\alpha(rad/s^{2})');
		end
	end

    function subplot_fcn(joint_number, row_number, var, var_name)
        subplot(3, n, joint_number + (row_number - 1) * n);
        plot(t, var(i,:)); hold on;
        title(['Joint' num2str(joint_number)]);
        ax = gca;
        ax.XLabel.String = 'time(s)';
        ax.YLabel.String = var_name;
        ax.YLabel.FontSize = 14;
        ax.XTick = time;
        grid on;
    end
end

