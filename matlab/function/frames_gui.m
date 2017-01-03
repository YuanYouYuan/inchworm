function frames_gui(gait_name)
    load(['data/gaits/frames/' gait_name], 'frames') ;

    n = length(frames);
    f = figure('name', gait_name);

    slider = uicontrol('Style', 'slider', 'Min', 1, 'Max', n, ...
            'Value', 1, 'Position', [85 20 400 20], 'Callback', @update_frames);
    text = uicontrol('Style', 'text', 'Position', [180 50 120 20], 'String', 'frames index:');


    function update_frames(src, evt)
        index = fix(src.Value);
        text = uicontrol('Style', 'text', 'Position', [285 50 120 20], 'String', num2str(index));
        imshow(frames(index).cdata);
    end
end
