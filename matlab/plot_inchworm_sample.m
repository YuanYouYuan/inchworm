clear all;
close all;
addpath('./function');

gait_name = 'concave_flip_gait';
gait = load(['data/gaits/' gait_name]) ;

inchworm = inchworm_model(gait.theta(:, 1), fixed_point);
plot_inchworm(inchworm);
