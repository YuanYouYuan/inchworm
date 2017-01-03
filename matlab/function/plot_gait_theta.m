function plot_gait_theta(gait_name)
    gait = load(['data/gaits/' gait_name]) ;
    fixed_point = gait.fixed_point;
    n = size(gait.theta, 2);

    slider = uicontrol('Style', 'slider', 'Min', 1, 'Max', n, ...
            'Value', 1, 'Position', [85 20 400 20], 'Callback', @update_frames);
    text = uicontrol('Style', 'text', 'Position', [180 50 120 20], 'String', 'index:');

%     for i = 1:size(gait.theta, 2)
%         theta = gait.theta(:,i);
%         fixed_point = gait.fixed_point;
%         inchworm = inchworm_model(theta, fixed_point);
%         plot_inchworm(inchworm);
%     end

    function update_frames(src, evt)
        index = fix(src.Value);
        theta = gait.theta(:, index);
        text = uicontrol('Style', 'text', 'Position', [285 50 120 20], 'String', num2str(index));
        inchworm = inchworm_model(theta, fixed_point);
        fixed_point = inchworm.fixed_point;
        cla;
        plot_inchworm(inchworm);
    end
end
