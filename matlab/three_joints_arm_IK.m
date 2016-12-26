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


eq(1) = x == imag(joint(end))
eq(2) = y == real(joint(end))
eq(3) = phi*pi/180 == pi - sum(th)
P = load('./data/new_parameter');
eq = subs(eq, L, P.L);
[theta3, theta4, theta5] = solve(eq, th);

theta3 = double(theta3)*180/pi;
theta4 = double(theta4)*180/pi;
theta5 = double(theta5)*180/pi;
