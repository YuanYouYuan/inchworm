clear all;
close all;
addpath('./function');

gait_names = {'opti_convex_flip_gait', 'opti_convex_flip_gait2'}
for gait_name = gait_names
    analyze_gait(char(gait_name));
end


