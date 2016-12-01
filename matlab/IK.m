L0 = 8; L3 = 8;
L1 = 15; L2 = 15;
theta = -pi/3;
syms theta1 theta2 theta3;
eq1 = -39*cos(pi/3) == L1*sin(theta1)+L2*sin(theta1+theta2)+L3*sin(theta);
eq2 = 39*sin(pi/3) == L0+L1*cos(theta1)+L2*cos(theta1+theta2)+L3*cos(theta);
eq3 = theta == theta1+theta2+theta3;
[sol1,sol2] = solve([eq1,eq2],[theta1,theta2]);
sol3 = theta-sol1-sol2;
sol1 = sol0/pi*180
sol2 = sol1/pi*180
sol3 = sol2/pi*180