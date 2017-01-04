function [min_time, min_theta] = find_min_time(gait, theta_index)
    time = gait.time;
    theta = gait.theta;
	dt = time(2:end) - time(1:end-1);
	A = []; b = []; Aeq = []; beq = [];
    options = optimoptions('fmincon','Display','iter');


    % var = [dt(1:n) theta3(1:n-1) theta4(1:n-1) theta5(1:n-1)]

    n = length(dt);
	dt_lb = zeros(1, n);
	dt_ub = 5 * ones(1, n);
    th_lb = -90* ones(1, n-1);
    th_ub = 90 * ones(1, n-1);

    lb = [dt_lb th_lb];
    ub = [dt_ub th_ub];
    var = [dt theta(theta_index, 2:end-1)];


	to_minimize_fcn = @(var) sum(var(1:n));
	nonlinear_constraint = @(var) constraint_fcn(var);

	min_var = fmincon(to_minimize_fcn, var, A, b, Aeq, beq, lb, ub, nonlinear_constraint, options);

    min_dt = min_var(1:n);
	min_time(1) = 0;
	for i = 1:n
		min_time(i+1) = sum(min_dt(1:i));
	end

    
    theta(theta_index, 2:end-1) = min_var(n+1:2*n-1);
    min_theta = theta;

    function [c, ceq] = constraint_fcn(var)
        dt = var(1:n);
        theta(theta_index, 2:end-1) = var(n+1:2*n-1);

        time(1) = 0;
        for i = 1:length(dt)
            time(i+1) = sum(dt(1:i));
        end
        gait.theta = theta;
        gait.time = time;
        gait_traj = gait_trajectory(gait);
        gait_torq = gait_torque(gait_traj);

        c = [];
        ceq = sum(sum(gait_torq.exceed));
    end
end
