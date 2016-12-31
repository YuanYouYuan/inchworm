close all;
clear all;

name = 'concave_flip_gait';

fixed_point.x = 0.1;
fixed_point.y = 0;
fixed_point.rotation = 0;
fixed_point.is_switch = false;

time =  [  0   1   2   3]

theta = [-90 -90 -90 -90;
          90  90  90  90;
          45  20 -20 -45;
          90  45 -45 -90;
          45  20 -20 -45;
          90  90  90  90;
          90 -90 -90 -90] 

save(['data/gaits/' name])


