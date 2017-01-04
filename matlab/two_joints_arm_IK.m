clear all;
close all;

syms x y L1 L2 L3;
load ('./data/new_parameter.mat', 'L');

R = sqrt(x^2+(y-L1)^2);
gamma = acos((R^2 - L2^2 - L3^2)/(2*L2*L3));
alpha = asin(L3*sin(gamma)/R);
beta = asin(L2*sin(gamma)/R);

theta = atan2(y-L1, x);
theta1_1 = pi/2 - theta - alpha;
theta2_1 = alpha + beta;

theta1_2 = pi/2 - theta + alpha;
theta2_2 = -1 * (alpha + beta);

theta1 = [theta1_1 theta1_2]
theta2 = [theta2_1 theta2_2]





