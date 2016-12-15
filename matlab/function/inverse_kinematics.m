% 161204 write a function to derive the joint space solution 
% from cartision space by inverse kinematics method.
function [th1 th2 th3] = inverse_kinematics(x, y) 
    load('./data/new_parameter.m');
    th = sym('th', [3 5]);
    eq1 = x == L1*sin(th1) + L2*sin(th1+th2) + L3*sin(th1+th2+th3);
    eq2 = y == L0 + L1*cos(th1) + L2*cos(th1+th2) + L3*cos(th1+th2+th3);
    j = sqrt(-1);
    joint(1) = L(1);
    for k = 2:4
        joint(k) = joint(k-1) + L(k)*exp(sum(th(3:1+k)));
    end
    joint = [0 joint];

    tail_end_section(1) = joint(5) + j*(joint(4)-joint(5))/norm(joint(4)-joint(5)) * L(1);
    tail_end_section(2) = joint(5) - j*(joint(4)-joint(5))/norm(joint(4)-joint(5)) * L(1);

    eq(1) = x == imag(tail_end_section(1));
    eq(2) = y == real(tail_end_section(1));
    eq(3) = phi == 180 - sum(th(i));


end
load('./data/physical_parameter.mat')
syms theta1 theta2 theta3;
eq1 = x == L1*sin(theta1)+L2*sin(theta1+theta2)+L3*sin(theta);
eq2 = y == L0+L1*cos(theta1)+L2*cos(theta1+theta2)+L3*cos(theta);
eq3 = theta == theta1+theta2+theta3;

[sol1,sol2] = solve([eq1,eq2],[theta1,theta2]);
sol3 = theta-sol1-sol2;
sol1 = sol0/pi*180
sol2 = sol1/pi*180
sol3 = sol2/pi*180
