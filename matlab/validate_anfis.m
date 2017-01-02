clear all;
close all;
addpath('./function');

th1_range = 0:0.1:pi/2;
th2_range = 0:0.1:pi/2;
th3_range = 0:0.1:pi/2;

[th1, th2, th3] = meshgrid(th1_range, th2_range, th3_range);
th1 = th1(:);
th2 = th2(:);
th3 = th3(:);
[x, y, phi] = FK(th1, th2, th3);
[th1p, th2p, th3p] = IK(x, y, phi);

th1err = (th1 - th1p) ./ th1;
th2err = (th2 - th2p) ./ th2;
th3err = (th3 - th3p) ./ th3;

figure;
subplot(3, 1, 1);
plot(th1err);
title('th1 relatve error', 'fontsize', 10);

subplot(3, 1, 2);
plot(th1err);
title('th2 relatve error', 'fontsize', 10);

subplot(3, 1, 3);
plot(th1err);
title('th3 relatve error', 'fontsize', 10);
