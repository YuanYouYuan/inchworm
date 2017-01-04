function [x, y, phi] = FK(th1, th2, th3)
    exceed = theta_in_workspace(th1, th2, th3);
    if ~any(exceed)
        load('./data/new_parameter.mat', 'L');
        th1 = deg2rad(th1);
        th2 = deg2rad(th2);
        th3 = deg2rad(th3);

        x = L(2) * cos(pi/2 - th1) + L(3) * cos(pi/2 - th1 - th2) + L(4) * cos(pi/2 - th1 - th2 - th3);
        y = L(1) + L(2)* sin(pi/2 - th1) + L(3) * sin(pi/2 - th1 - th2) + L(4) * sin(pi/2 - th1 - th2 - th3);
        phi = pi - th1 - th2 - th3;
        phi = rad2deg(phi);
    end
end
