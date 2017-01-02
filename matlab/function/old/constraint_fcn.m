function [c, ceq] = constraint_fun(dt, theta)
	time(1) = 0;
	for i = 1:length(dt)
		time(i+1) = sum(dt(1:i));
	end
	c = [];
	ceq = sum(sum(torque_exceed(theta, time)));
end
