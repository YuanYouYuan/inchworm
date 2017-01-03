function analyze_gait(gait_name)
    addpath('./function');

    gait = load(['data/gaits/' gait_name]) ;


    gait_traj = gait_trajectory(gait);
    gait_torq = gait_torque(gait_traj);
    export_gait_traj(gait_traj); % export csv data of theta 
    plot_gait_traj(gait_traj);
    plot_gait_torq(gait_torq);

    frames = gait_frames(gait_traj, gait.fixed_point);
    frames_gui(gait_name);
end
