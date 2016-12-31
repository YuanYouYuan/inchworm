function traj = joint_trajectory(theta, time)
    theta = deg2rad(theta);
	t = time(1):0.01:time(end);
    n = length(theta);

    % spline_th   = spline(time, [0 theta 0]); 
    % ===clamped boundary condition with initail/final velocity = 0 ===
    % spline_th   = spline(time, theta);       
    % ===natural boundary condition===
    % spline_th   = csape(time, theta, 'clamped', [0 0]);       
    spline_th   = csape(time, theta, 'second', [0 0]);       
    % spline_th   = csape(time, theta);       
    spline_dth  = fnder (spline_th, 1);
    spline_ddth = fnder (spline_th, 2);

    traj.t    = t;
    traj.th   = ppval(spline_th,   t);
    traj.dth  = ppval(spline_dth,  t);
    traj.ddth = ppval(spline_ddth, t);
end

