function optimize_gait(gait_name)
    gait = load(['./data/gaits/' gait_name]);

    name = ['opti_' gait_name];
    time = find_min_time(gait);
    theta = gait.theta;
    fixed_point = gait.fixed_point;
    save(['./data/gaits/' name], 'name', 'time', 'theta', 'fixed_point');
end
