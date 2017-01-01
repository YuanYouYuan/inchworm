function [th,t] = line_IK (XYP)
    
    load('anfis1.mat');
    load('anfis2.mat');
    load('anfis3.mat');
    
    THETA1P = evalfis(XYP, anfis1);
    THETA2P = evalfis(XYP, anfis2);
    THETA3P = evalfis(XYP, anfis3);
%     THETA1P = THETA1P/pi*180;
%     THETA2P = THETA2P/pi*180;
%     THETA3P = THETA3P/pi*180;
    [n,m] = size(THETA1P);
    degree_90 = pi/2*ones(1,n);
    degree_n90 = -pi/2*ones(1,n);
    th = [THETA1P THETA2P THETA3P]';
    th = [degree_n90;degree_90;th;degree_90;degree_90];
    t = 1:n;
end