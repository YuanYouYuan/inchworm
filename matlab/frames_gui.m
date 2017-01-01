function frames_gui

    close all;
    clear all;

    % load('./concave_flip_gait.mat', 'frames');
    load('./data/gaits/frames/flip_climb_up_gait.mat', 'frames');

    n = length(frames);
    f = figure;

    slider = uicontrol('Style', 'slider', 'Min', 1, 'Max', n, ...
            'Value', 1, 'Position', [85 20 400 20], 'Callback', @update_frames);
    text = uicontrol('Style', 'text', 'Position', [285 50 120 20], 'String', 'frames');

    function update_frames(src, evt)
        index = fix(src.Value);
        imshow(frames(index).cdata);
    end
end
