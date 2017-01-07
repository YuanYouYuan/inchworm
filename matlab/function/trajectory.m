function traj = trajectory(x, time)
	t = time(1):0.01:time(end);

    % spline_x   = spline(time, [0 x 0]); 
    % ===clamped boundary condition with initail/final velocity = 0 ===
    % spline_x   = spline(time, x);       
    % ===natural boundary condition===
    % spline_x   = csape(time, x, 'clamped', [0 0]);       
    spline_x   = csape(time, x, 'second', [0 0]);       
    % spline_x   = csape(time, x);       
    spline_dx  = fnder (spline_x, 1);
    spline_ddx = fnder (spline_x, 2);

    traj.t   = t;
    traj.pos = ppval(spline_x,   t);
    traj.vel = ppval(spline_dx,  t);
    traj.acc = ppval(spline_ddx, t);
end

