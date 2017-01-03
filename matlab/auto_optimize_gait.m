clear all;
close all;
addpath('./function');

gait_names = {'convex_flip_gait', 'convex_flip_gait2'}
for gait_name = gait_names
    optimize_gait(char(gait_name));
end


