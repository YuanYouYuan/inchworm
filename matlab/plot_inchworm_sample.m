clear all;
close all;

theta = [-90 90 45 90 45 90 -90];
fixed_point.x = 0;
fixed_point.y = 0;
fixed_point.rotation = 0;
fixed_point.is_switch = 0;

inchworm = inchworm_model(theta, fixed_point);
plot_inchworm(inchworm);

slider = uicontrol('Style', 'slider', 'Min', 1, 'Max', n, ...
        'Value', 1, 'Position', [85 20 400 20], 'Callback', @update_frames);
text = uicontrol('Style', 'text', 'Position', [285 50 120 20], 'String', 'frames');

function update_inchworm(src, evt)
    theta(3) = fix(src.Value);
    inchworm = inchworm_model(theta, fixed_point);
    plot_inchworm(inchworm);
end
