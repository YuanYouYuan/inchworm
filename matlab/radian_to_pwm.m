% function pwm_signal = radian_to_pwm(theta, ankle, suction)
% There totally 7 servo motors which are defined as M1~M7 in LabVIEW
% M1 and M7 are two small servo motors which handle the suction cup.
% M2~M6 are normal-sized servo motors
% M2 and M6 handles the rotation of the ankle.
% M3~M5 are the theta1~theta3 in matlab which handle the bending of the body.

% Initial position(zero position): the pwm(usec) of the motors in zero degree
% M1 = 1800
% M2 = 1518
% M3 = 1480
% M4 = 1460 
% M5 = 1476
% M6 = 1524
% M7 = 1830
M_zero = [1800, 1518, 1480, 1460, 1476, 1524, 1830]
M1_two_states = [800 2000] % release and adhere
M7_two_states = [1050 2000] 
M_slope(1) = (1230-1810)/(90-(-90)); % M2
M_slope(2) = (1860-1075)/(90-(-90)); % M3 
M_slope(3) = (1756-1180)/(90-(-90)); % M4
M_slope(4) = (1870-1090)/(90-(-90)); % M5
M_slope(5) = (1234-1805)/(90-(-90)); % M6

test_degree = [90 -45 -90 -45 90]
test_pwm = test_degree.* M_slope + M_zero(2:6)

