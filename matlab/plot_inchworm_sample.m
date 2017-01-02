clear all;
close all;
addpath('./function');

gait_name = 'climb_up_plan';
gait = load(['data/gaits/' gait_name]) ;

%load(['./data/gaits/traj/' gait_name '.mat'], 'gait_traj');
%theta = rad2deg(gait_traj.th(:, 214));
for i = 1:5
theta = gait.theta(:,i);
fixed_point = gait.fixed_point;
inchworm = inchworm_model(theta, fixed_point);
figure;
plot_inchworm(inchworm);
end
