close all;
clear all;

syms M1 M2 M3;
syms x1 x2 x3;
syms L1 L2 L3;
syms th1 th2 th3 dth1 dth2 dth3 ddth1 ddth2 ddth3;
syms I1 I2 I3;
syms g;

% position of mass center
p1y = x1*cos(th1);
p1x = x1*sin(th1);
p2y = L1*cos(th1)+x2*cos(th1+th2);
p2x = L1*sin(th1)+x2*sin(th1+th2);
p3y = L1*cos(th1)+L2*cos(th1+th2)+x3*cos(th1+th2+th3);
p3x = L1*sin(th1)+L2*sin(th1+th2)+x3*sin(th1+th2+th3);
% velocity of mass center
v1y = -x1*sin(th1)*dth1;
v1x = +x1*cos(th1)*dth1;
v2y = -L1*sin(th1)*dth1-x2*sin(th1+th2)*(dth1+dth2);
v2x = +L1*cos(th1)*dth1+x2*cos(th1+th2)*(dth1+dth2);
v3y = -L1*sin(th1)*dth1-L2*sin(th1+th2)*(dth1+dth2) - x3*sin(th1+th2+th3)*(dth1+dth2+dth3);
v3x = +L1*cos(th1)*dth1+L2*cos(th1+th2)*(dth1+dth2) + x3*cos(th1+th2+th3)*(dth1+dth2+dth3);
% kinematic energy
KE = 0.5*M1*(v1x^2 + v1y^2)+0.5*I1*dth1^2 + 0.5*M2*(v2x^2 + v2y^2)+0.5*I2*dth2^2 + 0.5*M3*(v3x^2 + v3y^2)+0.5*I3*dth3^2;
KE = simplify(KE);
% potential energy
PE = M1*g*p1y + M2*g*p2y + M3*g*p3y;
PE = simplify(PE);
% partial KE partial dtheta
pKEpdth1 = diff(KE,dth1);
pKEpdth2 = diff(KE,dth2);
pKEpdth3 = diff(KE,dth3);
% ddt partial KE partial dtheta
ddtpKEpdth1 = diff(pKEpdth1,th1)*dth1+...
diff(pKEpdth1,dth1)*ddth1+...
diff(pKEpdth1,th2)*dth2 +...
diff(pKEpdth1,dth2)*ddth2 +...
diff(pKEpdth1,th3)*dth3 + ...
diff(pKEpdth1,dth3)*ddth3;

ddtpKEpdth2 = diff(pKEpdth2,th1)*dth1+...
diff(pKEpdth2,dth1)*ddth1+...
diff(pKEpdth2,th2)*dth2 +...
diff(pKEpdth2,dth2)*ddth2 +...
diff(pKEpdth2,th3)*dth3 + ...
diff(pKEpdth2,dth3)*ddth3;

ddtpKEpdth3 = diff(pKEpdth3,th1)*dth1+...
diff(pKEpdth3,dth1)*ddth1+...
diff(pKEpdth3,th2)*dth2 +...
diff(pKEpdth3,dth2)*ddth2 +...
diff(pKEpdth3,th3)*dth3 + ...
diff(pKEpdth3,dth3)*ddth3;

%partial KE/PE partial theta
pKEpth1 = diff(KE,th1);
pPEpth1 = diff(PE,th1);
pKEpth2 = diff(KE,th2);
pPEpth2 = diff(PE,th2);
pKEpth3 = diff(KE,th3);
pPEpth3 = diff(PE,th3);
%Torque
Torque1 = simplify( ddtpKEpdth1 - pKEpth1 + pPEpth1 )
Torque2 = simplify( ddtpKEpdth2 - pKEpth2 + pPEpth2 )
Torque3 = simplify( ddtpKEpdth3 - pKEpth3 + pPEpth3 )



