function gait_traj = new_gait_traj(gait)
    
    for var = {'x', 'y', 'z', 'phi', 'omega'}
        var_name = char(var);
        gait_traj.(var_name) = trajectory(gait.(var_name), gait.time);
    end

    for var = {'s1', 's2'}
        var_name = char(var);
        gait_traj.(var_name) = suction_trajectory(gait.(var_name), gait.time);
        
    end
    gait_traj.name  = gait.name;
    gait_traj.time  = gait.time;

    save(['data/gaits/traj/' gait_traj.name], 'gait_traj');
end
