function frames = gait_frames(gait_traj, initial_fixed_point)
    th = gait_traj.th;
    t  = gait_traj.t;

    fixed_point = initial_fixed_point;
   
    for i=1:length(t)
        cla;
        inchworm = inchworm_model(rad2deg(th(:, i)), fixed_point);
        plot_inchworm(inchworm);
        fixed_point = inchworm.fixed_point;

        % record the time
        text(0.35, 0.45, ['time(s): ' num2str(t(i))])

        frames(i) = getframe(gcf);
    end
    save(['./data/gaits/frames/' gait_traj.name], 'frames');
end
