clear all;
close all;

addpath('./function');
x = -0.13;
y = 0.22;
phi = 90;
[th3, th4, th5] = IK(x, y, phi)
[a, b, c] = in_workspace(th3, th4, th5)


