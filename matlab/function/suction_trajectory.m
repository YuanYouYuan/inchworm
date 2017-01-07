function traj = suction_trajectory(suction, time)
	t = time(1):0.01:time(end);
    [~, index_time, index_t ] = intersect(time, t);

    for i = 1:length(index_time)-1
        s(index_t(i):index_t(i+1)-1) = suction(i);
    end
    s(end) = suction(end);
    s = [suction(1) s];
    traj.t = t;
    traj.s = s;
end

