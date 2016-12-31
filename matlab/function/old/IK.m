function [theta3, theta4, theta5] = IK(x, y, phi)
    th = sym('th', [1, 7]);
    L = sym('L', [1 4]);
    assume(th, 'real')
    j = sqrt(-1);
    joint(1) = L(1);
    for k = 2:4
        joint(k) = joint(k-1) + L(k)*exp(j*sum(th(3:1+k)));
    end
    joint = [0 joint];

    tail_end_section(1) = joint(5) + j*(joint(4)-joint(5))/norm(joint(4)-joint(5)) * L(1);
    tail_end_section(2) = joint(5) - j*(joint(4)-joint(5))/norm(joint(4)-joint(5)) * L(1);

    eq(1) = x == imag(tail_end_section(1));
    eq(2) = y == real(tail_end_section(1));
    eq(3) = phi*pi/180 == pi - sum(th(3:5));
    P = load('./data/new_parameter');
    eq = subs(eq, L, P.L);
    [theta3, theta4, theta5] = solve(eq, th(3:5));
    theta3 = double(theta3)*180/pi;
    theta4 = double(theta4)*180/pi;
    theta5 = double(theta5)*180/pi;
end
