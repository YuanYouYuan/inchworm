function [th1, th2, th3] = j3IK(x, y, phi)

    load('./data/new_parameter.mat', 'L');
    L1 = L(1); L2 = L(2); L3 = L(3); L4 = L(4);

    phi = deg2rad(phi);
    x = x + L4*cos(pi/2+phi);
    y = y + L4*sin(pi/2+phi);


    % find init IK
    [th_IK1, th_IK2, th_IK3] = IK_formula(x(1), y(1), phi(1));
    if abs(th_IK1(1)) < pi/2 & abs(th_IK2(1)) < pi *2/3 & abs(th_IK3(1)) < pi/2
        index = 1;
    else
        index = 2;
    end
    th1(1) = th_IK1(index);
    th2(1) = th_IK2(index);
    th3(1) = th_IK3(index);

    for i = 2:length(x)
        [th_IK1, th_IK2, th_IK3] = IK_formula(x(i), y(i), phi(i));
        [~, index] = min(abs(th_IK2-th2(i-1)));
        th1(i) = th_IK1(index);
        th2(i) = th_IK2(index);
        th3(i) = th_IK3(index);
    end


    th1 = rad2deg(th1);
    th2 = rad2deg(th2);
    th3 = rad2deg(th3);

    function [th_IK1, th_IK2, th_IK3] = IK_formula(x, y, phi)
        th_IK1 = [ pi/2 - asin((L3*(1 - (L2^2 + L3^2 - x^2 - ... 
                (L1 - y)^2)^2/(4*L2^2*L3^2))^(1/2))/(x^2 + (L1 - y)^2)^(1/2)) - atan2(y - L1, x), ... 
                pi/2 + asin((L3*(1 - (L2^2 + L3^2 - x^2 - ... 
                (L1 - y)^2)^2/(4*L2^2*L3^2))^(1/2))/(x^2 + (L1 - y)^2)^(1/2)) - atan2(y - L1, x)];
        th_IK2 = [ asin((L2*(1 - (L2^2 + L3^2 - x^2 - ... 
                (L1 - y)^2)^2/(4*L2^2*L3^2))^(1/2))/(x^2 + (L1 - y)^2)^(1/2)) + ... 
                asin((L3*(1 - (L2^2 + L3^2 - x^2 - ... 
                (L1 - y)^2)^2/(4*L2^2*L3^2))^(1/2))/(x^2 + (L1 - y)^2)^(1/2)), ... 
                - asin((L2*(1 - (L2^2 + L3^2 - x^2 - (L1 - y)^2)^2/(4*L2^2*L3^2))^(1/2))/(x^2 + ... 
                (L1 - y)^2)^(1/2)) - asin((L3*(1 - (L2^2 + L3^2 - x^2 - ... 
                (L1 - y)^2)^2/(4*L2^2*L3^2))^(1/2))/(x^2 + (L1 - y)^2)^(1/2))];
        th_IK3 = pi - th_IK1 - th_IK2 - phi;
    end

end
