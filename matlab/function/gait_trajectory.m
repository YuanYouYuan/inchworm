function gait_traj = gait_trajectory(gait)
    theta = gait.theta;
    time  = gait.time;
    name  = gait.name;
    
    for i = 1:size(theta, 1)
        joint_traj = joint_trajectory(theta(i, :), time);
        gait_traj.th(i, :)   = joint_traj.th;
        gait_traj.dth(i, :)  = joint_traj.dth;
        gait_traj.ddth(i, :) = joint_traj.ddth;
    end
    gait_traj.t = joint_traj.t;

    gait_traj.name  = name;
    gait_traj.theta = theta;
    gait_traj.time  = time;

    save(['data/gaits/traj/' gait_traj.name], 'gait_traj');
end
