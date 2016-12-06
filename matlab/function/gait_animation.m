function [] = gait_animation(gait_name, video_name)
    load(['./data/gaits/' gait_name '.mat']); % load time, theta
    load('./data/new_parameter.mat'); % load L
    vw = VideoWriter(['data/videos/' video_name '.avi']);

    plot_figure = 0;
    [th, ~, ~, t] = joint_trajectory(theta, time, plot_figure);

    n = length(t);
    set(gca, 'nextplot', 'replacechildren');

    for i =1:n
        j = sqrt(-1);
        joint(1) = L(1);
        for k = 2:4
            joint(k) = joint(k-1) + L(k)*exp(sum(th(3:1+k, i))*j);
        end
        point = [imag(joint); real(joint)];
        point = [zeros(2,1), point];
        plot(point(1, :), point(2, :), 'o-', 'LineWidth', 2, 'MarkerSize', 10, 'MarkerFaceColor', 'y');
        axis([-0.5, 0.5, 0, 0.5]);
        xlabel('unit:m'), ylabel('unit:m');
        text(0.35, 0.45, ['time(s): ' num2str(t(i))])
        frames(i) = getframe(gcf);
    end

    vw.Quality = 100;
    vw.FrameRate = 1/(t(2)-t(1));
    open(vw);
    for i = 2:n
        writeVideo(vw, frames(i));
    end
    close(vw);
end
