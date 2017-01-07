function joint_traj = traj_IK(gait_traj)
    th(6, :) = gait_traj.omega.pos;
    th(1, :) = s2th(gait_traj.s1.s);
    th(7, :) = s2th(gait_traj.s2.s);
    th(2, :) = rad2deg(atan2(gait_traj.y.pos, gait_traj.x.pos));
    x = sqrt(gait_traj.x.pos.^2+gait_traj.y.pos.^2);
    y = gait_traj.z.pos;
    phi = gait_traj.phi.pos;
    [th(3, :), th(4, :), th(5, :)] = j3IK(x, y, phi);

    joint_traj.th = th;
    joint_traj.t  = gait_traj.x.t;
    
    function th = s2th(s)
        th = s;
        th(th==1) = -90;
        th(th==0) = 90;
    end

    joint_traj.name = gait_traj.name;
end
