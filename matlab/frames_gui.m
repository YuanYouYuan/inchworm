function frames_gui(gait_name)

    % close all;
    % clear all;


    % gait_name = 'climb_up_plan';
    load(['data/gaits/frames/' gait_name], 'frames') ;

    n = length(frames);
    f = figure;

    slider = uicontrol('Style', 'slider', 'Min', 1, 'Max', n, ...
            'Value', 1, 'Position', [85 20 400 20], 'Callback', @update_frames);
    text = uicontrol('Style', 'text', 'Position', [285 50 120 20], 'String', 'frames');
    text = uicontrol('Style', 'text', 'Position', [285 50 120 20], 'String', 'frames');


    function update_frames(src, evt)
        index = fix(src.Value);
        imshow(frames(index).cdata);
    end
end
