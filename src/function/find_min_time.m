function min_time = find_minimum_time(theta, time)
	dt = time(2:end) - time(1:end-1);
	A = []; b = []; Aeq = []; beq = [];
	lower_bound = zeros(1, length(dt));
	upper_bound = 5 * ones(1, length(dt));
	fun = @(dt) sum(dt);
	nonlinear_constraint = @(dt) constraint_fun(dt, theta);
	min_dt = fmincon(fun, dt, A, b, Aeq, beq, lower_bound, upper_bound, nonlinear_constraint);
	min_time(1) = 0;
	for i = 1:length(dt)
		min_time(i+1) = sum(min_dt(1:i));
	end
end
