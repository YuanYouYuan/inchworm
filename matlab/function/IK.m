function [th1, th2, th3] = IK(x, y, phi)

    load('./data/new_parameter.mat', 'L');
    L1 = L(1); L2 = L(2); L3 = L(3); L4 = L(4);

    phi = deg2rad(phi);
    x = x + L4*cos(pi/2+phi);
    y = y + L4*sin(pi/2+phi);

    th1 = [ pi/2 - asin((L3*(1 - (L2^2 + L3^2 - x^2 - ... 
            (L1 - y)^2)^2/(4*L2^2*L3^2))^(1/2))/(x^2 + (L1 - y)^2)^(1/2)) - atan2(y - L1, x), ... 
            pi/2 + asin((L3*(1 - (L2^2 + L3^2 - x^2 - ... 
            (L1 - y)^2)^2/(4*L2^2*L3^2))^(1/2))/(x^2 + (L1 - y)^2)^(1/2)) - atan2(y - L1, x)];
    th2 = [ asin((L2*(1 - (L2^2 + L3^2 - x^2 - ... 
            (L1 - y)^2)^2/(4*L2^2*L3^2))^(1/2))/(x^2 + (L1 - y)^2)^(1/2)) + ... 
            asin((L3*(1 - (L2^2 + L3^2 - x^2 - ... 
            (L1 - y)^2)^2/(4*L2^2*L3^2))^(1/2))/(x^2 + (L1 - y)^2)^(1/2)), ... 
            - asin((L2*(1 - (L2^2 + L3^2 - x^2 - (L1 - y)^2)^2/(4*L2^2*L3^2))^(1/2))/(x^2 + ... 
            (L1 - y)^2)^(1/2)) - asin((L3*(1 - (L2^2 + L3^2 - x^2 - ... 
            (L1 - y)^2)^2/(4*L2^2*L3^2))^(1/2))/(x^2 + (L1 - y)^2)^(1/2))];
    th3 = pi - th1 - th2 - phi;

    th1 = rad2deg(th1(1));
    th2 = rad2deg(th2(1));
    th3 = rad2deg(th3(1));

    % for i = 1:2
    %     exceed = theta_in_workspace(th1(i), th2(i), th3(i));
    %     if exceed
    %         th1(i) = -1;
    %         th2(i) = -1;
    %         th3(i) = -1;
    %     end
    % end

    % th1 = th1(th1~=-1);
    % th2 = th2(th2~=-1);
    % th3 = th3(th3~=-1);
end
