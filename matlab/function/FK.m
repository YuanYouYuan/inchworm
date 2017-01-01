function [x, y, phi] = FK(th1, th2, th3)
    load('./data/new_parameter.mat', 'L');
    x = L(2) * cos(pi/2 - th1) + L(3) * cos(pi/2 - th1 - th2) + L(4) * cos(pi/2 - th1 - th2 - th3);
    y = L(1) + L(2)* sin(pi/2 - th1) + L(3) * sin(pi/2 - th1 - th2) + L(4) * sin(pi/2 - th1 - th2 - th3);
    phi = pi - th1 - th2 - th3;
end
