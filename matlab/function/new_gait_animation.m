function [] = gait_animation(gait_name, video_name)
    if ~exist('video_name', 'var')
        video_name = gait_name;
    end

    load(['./data/gaits/' gait_name '.mat']); % load time, theta
    load('./data/new_parameter.mat'); % load L
    vw = VideoWriter(['data/videos/' video_name '.avi']);

    plot_figure = 0;
    [th, ~, ~, t] = joint_trajectory(theta, time, plot_figure);

    n = length(t);
    ax = gca;
    ax.XLim = [-0.5, 0.5];
    ax.YLim = [   0, 0.5];
    ax.XLabel.String = 'unit:m';
    ax.YLabel.String = 'unit:m';
    ax.XTick = sort([-0.5:0.1:0.5, -0.13]);
    ax.NextPlot = 'add';
    axis equal;
    grid on;

    fig = gcf;
    fig.Position = [100, 100, 540, 320];
    newx = 0;
    newy = 0;
    temp = 1;
    for i = 1:n
        j = sqrt(-1);
        clear joint;
        joint(1) = L(1);
        for k = 2:4
            joint(k) = joint(k-1) + L(k)*exp(sum(th(3:1+k, i))*j);
        end
        joint = [0 joint];
        if temp>-0.13 && imag(joint(5))<-0.13
            wall_index = i;
        end
        temp = imag(joint(5));
    end

    for i =1:n
        
        % use complex number to represent joints
        
        if i>=wall_index
            th(3:5,i) = -flip(th(3:5,i));
        end
        
        j = sqrt(-1);
        clear joint;
        joint(1) = L(1);
        for k = 2:4
            joint(k) = joint(k-1) + L(k)*exp(sum(th(3:1+k, i))*j);
        end
        joint = [0 joint]; % fix joint1 on the ground
        
        
        if i==wall_index-1
            newx = real(joint(5));
            newy = imag(joint(5));
        end
        
        if i>=wall_index
            joint = exp(pi*j/2)*joint;
            joint = joint+(newx+newy*j);
        end
        
        
        

        % plot wall and ground
        plot([ -0.5,   0.5], [0,   0], 'k', 'LineWidth', 2);
        plot([-0.13, -0.13], [0, 0.5], 'k', 'LineWidth', 2);

        % plot end section
        head_end_section(1) = joint(1) + j*(joint(2)-joint(1))/norm(joint(2)-joint(1)) * L(1);
        head_end_section(2) = joint(1) - j*(joint(2)-joint(1))/norm(joint(2)-joint(1)) * L(1);
        tail_end_section(1) = joint(5) + j*(joint(4)-joint(5))/norm(joint(4)-joint(5)) * L(1);
        tail_end_section(2) = joint(5) - j*(joint(4)-joint(5))/norm(joint(4)-joint(5)) * L(1);

        % plot suction cup
        if th(1, i) < 0
            head_suction_cup_status = 'Red';
        else
            head_suction_cup_status = 'White';
        end

        if th(7, i) < 0
            tail_suction_cup_status = 'Red';
        else
            tail_suction_cup_status = 'White';
        end

        plot(imag(head_end_section), real(head_end_section), 'bo-', 'LineWidth', 4, ...
            'MarkerSize', 13, 'MarkerFaceColor', head_suction_cup_status);
        plot(imag(tail_end_section), real(tail_end_section), 'bo-', 'LineWidth', 4, ...
            'MarkerSize', 13, 'MarkerFaceColor', tail_suction_cup_status);

        % plot body
        plot(imag(joint), real(joint), 'bo-', 'LineWidth', 4, 'MarkerSize', 15, 'MarkerFaceColor', 'y');

       
        % record the time
        text(0.35, 0.45, ['time(s): ' num2str(t(i))])
        frames(i) = getframe(gcf);
        cla;
    end

    vw.Quality = 100;
    vw.FrameRate = 1/(t(2)-t(1));
    open(vw);
    for i = 2:n
        writeVideo(vw, frames(i));
    end
    close(vw);
end
