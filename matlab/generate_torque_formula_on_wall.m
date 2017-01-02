close all;
clear all;

syms M1 M2 M3;
syms X1 X2 X3;
syms L1 L2 L3;
syms th1 th2 th3 dth1 dth2 dth3 ddth1 ddth2 ddth3;
syms I1 I2 I3;
syms G;

% load parameter if just want the numerical solution
load('./data/new_parameter.mat', 'G', 'I', 'L', 'M', 'X');
I1 = I(2); I2 = I(3); I3 = I(4);
L1 = L(2); L2 = L(3); L3 = L(4);
M1 = M(2); M2 = M(3); M3 = M(4);
X1 = X(2); X2 = X(3); X3 = X(4);

% position of mass center
p1y = X1*cos(th1);
p1x = X1*sin(th1);
p2y = L1*cos(th1)+X2*cos(th1+th2);
p2x = L1*sin(th1)+X2*sin(th1+th2);
p3y = L1*cos(th1)+L2*cos(th1+th2)+X3*cos(th1+th2+th3);
p3x = L1*sin(th1)+L2*sin(th1+th2)+X3*sin(th1+th2+th3);
% velocity of mass center
v1y = -X1*sin(th1)*dth1;
v1x = +X1*cos(th1)*dth1;
v2y = -L1*sin(th1)*dth1-X2*sin(th1+th2)*(dth1+dth2);
v2x = +L1*cos(th1)*dth1+X2*cos(th1+th2)*(dth1+dth2);
v3y = -L1*sin(th1)*dth1-L2*sin(th1+th2)*(dth1+dth2) - X3*sin(th1+th2+th3)*(dth1+dth2+dth3);
v3x = +L1*cos(th1)*dth1+L2*cos(th1+th2)*(dth1+dth2) + X3*cos(th1+th2+th3)*(dth1+dth2+dth3);
% kinematic energy
KE = 0.5*M1*(v1x^2 + v1y^2)+0.5*I1*dth1^2 + 0.5*M2*(v2x^2 + v2y^2)+0.5*I2*dth2^2 + 0.5*M3*(v3x^2 + v3y^2)+0.5*I3*dth3^2;
KE = simplify(KE);
% potential energy
PE = M1*G*p1x + M2*G*p2x + M3*G*p3x;
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
torque1 = simplify( ddtpKEpdth1 - pKEpth1 + pPEpth1 )
torque2 = simplify( ddtpKEpdth2 - pKEpth2 + pPEpth2 )
torque3 = simplify( ddtpKEpdth3 - pKEpth3 + pPEpth3 )


save('./data/torque_formula_on_wall', 'torque1', 'torque2', 'torque3');
