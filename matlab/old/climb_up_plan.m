addpath('./function')
load('data/new_parameter');


climb_up_speed = 4.2:0.2:5;
climb_up_angle = 0:5:15;

fixed_point.x = 0.15;
fixed_point.y = 0;
fixed_point.rotation = 0;
fixed_point.is_switch = 0;

line_number_climb = 11;
line_number_pull = 10;
angle_trial = climb_up_angle;
angle_in = -90+angle_trial;

x = [0.3621 0.36 0.3 0.2];
flip_number = length(x);

name = 'climb_up_plan';


% compute the x position when touch the wall
x_climb_touch = L(1)*sin(deg2rad(angle_trial));
x_line = [linspace(0.1,x_climb_touch,line_number_climb-1) -0.05 ...
          linspace(0.48,0.4,line_number_pull)];
x = [x x_line]';
x = x-fixed_point.x;

y = [0 0.1 0.2 0.3];
y_climb_up = 0.4;
y_line = [y_climb_up*ones(1,line_number_climb) fixed_point.x*ones(1,line_number_pull)];
y = [y y_line]';

phi = [0 45 90 180];
phi_line = [angle_in*ones(1,line_number_climb-1) -90 90*ones(1,line_number_pull)];
phi = [phi phi_line]';
climb_number = flip_number+line_number_climb;
total_number = flip_number+line_number_climb+line_number_pull;

[th1,th2,th3] = IK(x,y,phi);
th = [th1 th2 th3];
for i = climb_number+1:total_number
    th(i,:) = -flip(th(i,:));
end
th = th';
th = rad2deg(th);
joint_1 = [-90*ones(1,climb_number-1) 90 90*ones(1,line_number_pull)];
joint_2 = 90*ones(1,total_number);
joint_6 = 90*ones(1,total_number);
joint_7 = [90*ones(1,flip_number-2) -90*ones(1,line_number_climb+2) -90*ones(1,line_number_pull)];
theta = [joint_1;joint_2;th;joint_6;joint_7];
time = [1 1.5 2 3 linspace(4,climb_up_speed,line_number_climb) linspace(5.2,6,line_number_pull)];

save('./data/gaits/climb_up_plan_fast_bigangle.mat','theta','time','name','fixed_point');


