function min_time = find_min_time(gait)
    time = gait.time;
    theta = gait.theta;
	dt = time(2:end) - time(1:end-1);
	A = []; b = []; Aeq = []; beq = [];
    options = optimoptions('fmincon','Display','iter');
	lower_bound = zeros(1, length(dt));
	upper_bound = 5 * ones(1, length(dt));
	to_minimize_fcn = @(dt) sum(dt);
	nonlinear_constraint = @(dt) constraint_fcn(dt, gait);
	min_dt = fmincon(to_minimize_fcn, dt, A, b, Aeq, beq, ... 
            lower_bound, upper_bound, nonlinear_constraint, options);
	min_time(1) = 0;
	for i = 1:length(dt)
		min_time(i+1) = sum(min_dt(1:i));
	end

    function [c, ceq] = constraint_fcn(dt, gait)
        time(1) = 0;
        for i = 1:length(dt)
            time(i+1) = sum(dt(1:i));
        end
        gait.time = time;
        gait_traj = gait_trajectory(gait);
        gait_torq = gait_torque(gait_traj);

        c = [];
        ceq = sum(sum(gait_torq.exceed));
    end
end
