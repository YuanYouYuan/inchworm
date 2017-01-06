function gait_torq = gait_torque(gait_traj)
    torq = traj_torque(gait_traj);
    stall_torq = 25.8;
    % stall_torq = 10.0;
	rated_torq = (-1*stall_torq/(pi/3/0.18)*abs(gait_traj.dth(3:5, :))... 
                +stall_torq)*9.8*0.01;
	exceed = abs(torq) > rated_torq*0.5;

    gait_torq.t    = gait_traj.t;
    gait_torq.torq = torq;
    gait_torq.rated_torq = rated_torq;
    gait_torq.exceed = exceed;
    gait_torq.name = gait_traj.name;

    save(['data/gaits/torq/' gait_traj.name], 'gait_torq');
end

