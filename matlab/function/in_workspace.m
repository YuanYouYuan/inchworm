function [theta3, theta4, theta5] = in_workspace(th3, th4, th5)
    theta3 = [];
    theta4 = [];
    theta5 = [];
    for i = 1:length(th3)
        if abs(th3(i)) <= 90 & abs(th4(i)) <= 130 & abs(th5(i)) <= 90
            theta3 = [theta3 th3(i)];
            theta4 = [theta4 th4(i)];
            theta5 = [theta5 th5(i)];
        end
    end
end
