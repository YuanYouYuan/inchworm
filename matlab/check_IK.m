clear all;
close all;

th1 = 45
th2 = 90
th3 = 45
[x, y, phi] = FK(th1, th2, th3);
[TH1, TH2, TH3] = explicit_IK(x, y, phi)
