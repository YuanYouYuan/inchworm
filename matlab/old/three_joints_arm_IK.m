th = sym('th', [1, 3]);
assume(th, 'real');

L = sym('L', [1 4]);
assume(L, 'real');
syms phi x y
j = sqrt(-1);
joint(1) = L(1);
for k = 2:4
    joint(k) = joint(k-1) + L(k)*exp(j*sum(th(1:k-1)));
end


eq1 = x == imag(joint(end));
eq2 = y == real(joint(end));
% eq(3) = phi*pi/180 == pi - sum(th)
P = load('./data/new_parameter');
eq1 = subs(eq1, L, P.L);
eq1 = subs(eq1, th(3), pi - phi - th(1) - th(2))
eq2 = subs(eq2, L, P.L);
eq2 = subs(eq2, th(3), pi - phi - th(1) - th(2))
solve([eq1 eq2], th(1:2));
% [theta3, theta4] = solve(eq, th(1:2))
% [theta3, theta4, theta5] = solve(eq, th);
% 
% theta3 = double(theta3)*180/pi;
% theta4 = double(theta4)*180/pi;
% theta5 = double(theta5)*180/pi;
