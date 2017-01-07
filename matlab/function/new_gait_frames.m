function frames = new_gait_frames(joint_traj, initial_fixed_point)
    th = joint_traj.th;
    t  = joint_traj.t;
    name = joint_traj.name;

    fixed_point = initial_fixed_point;

    figure('Name', joint_traj.name);
   
    for i=1:length(t)
        cla;
        inchworm = inchworm_model(th(:, i), fixed_point);
        plot_inchworm(inchworm);
        fixed_point = inchworm.fixed_point;

        % record the time
        text(0.35, 0.45, ['time(s): ' num2str(t(i))])

        frames(i) = getframe(gcf);
    end
    save(['./data/gaits/frames/' name], 'frames');
end
