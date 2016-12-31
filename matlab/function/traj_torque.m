% this function aims to compute the torque of joint by lagrangian
% it's for three joints 2D inchworm model
% and we assume the 1st joint(the 3rd joint in real inchworm robot) is at the origin of the coordinate 

function torque = traj_torque(traj)

load('./data/new_parameter.mat', 'G', 'I', 'L', 'M', 'X');

% note that the 1st element of the parameters are for joint2 to joint3, so there is shift at parameter
I1 = I(2); I2 = I(3); I3 = I(4);
L1 = L(2); L2 = L(3); L3 = L(4);
M1 = M(2); M2 = M(3); M3 = M(4);
X1 = X(2); X2 = X(3); X3 = X(4);

th1 = traj.th(3,:);
th2 = traj.th(4,:);
th3 = traj.th(5,:);
dth1 = traj.dth(3,:);
dth2 = traj.dth(4,:);
dth3 = traj.dth(5,:);
ddth1 = traj.ddth(3,:);
ddth2 = traj.ddth(4,:);
ddth3 = traj.ddth(5,:);

torque(1, :) = I1*ddth1 + L1^2*M2*ddth1 + L1^2*M3*ddth1 + L2^2*M3*ddth1 + L2^2*M3*ddth2 ...
			+ M1*ddth1*X1^2 + M2*ddth1*X2^2 + M2*ddth2*X2^2 + M3*ddth1*X3^2 + M3*ddth2*X3^2 ...
			+ M3*ddth3*X3^2 - L2*M3*G*sin(th1 + th2) - M2*G*X2*sin(th1 + th2) - L1*M2*G*sin(th1) ...
			- L1*M3*G*sin(th1) - M1*G*X1*sin(th1) - M3*G*X3*sin(th1 + th2 + th3) ... 
			- L1*M2*dth2.^2*X2.*sin(th2) - L2*M3*dth3.^2*X3.*sin(th3) ... 
			+ 2*L1*M3*ddth1*X3.*cos(th2 + th3) + L1*M3*ddth2*X3.*cos(th2 + th3) ... 
			+ L1*M3*ddth3*X3.*cos(th2 + th3) + 2*L1*L2*M3*ddth1.*cos(th2) ... 
			+ L1*L2*M3*ddth2.*cos(th2) + 2*L1*M2*ddth1*X2.*cos(th2) + L1*M2*ddth2*X2.*cos(th2) ...
			+ 2*L2*M3*ddth1*X3.*cos(th3) + 2*L2*M3*ddth2*X3.*cos(th3) + L2*M3*ddth3*X3.*cos(th3) ...
			- L1*M3*dth2.^2*X3.*sin(th2 + th3) - L1*M3*dth3.^2*X3.*sin(th2 + th3) ... 
			- L1*L2*M3*dth2.^2.*sin(th2) - 2*L1*M2*dth1.*dth2*X2.*sin(th2) ...
			- 2*L2*M3*dth1.*dth3*X3.*sin(th3) - 2*L2*M3*dth2.*dth3*X3.*sin(th3) ...
			- 2*L1*M3*dth1.*dth2*X3.*sin(th2 + th3) - 2*L1*M3*dth1.*dth3*X3.*sin(th2 + th3) ...
			- 2*L1*M3*dth2.*dth3*X3.*sin(th2 + th3) - 2*L1*L2*M3*dth1.*dth2.*sin(th2);

torque(2, :) = I2*ddth2 + L2^2*M3*ddth1 + L2^2*M3*ddth2 + M2*ddth1*X2^2 + M2*ddth2*X2^2 ...
			+ M3*ddth1*X3^2 + M3*ddth2*X3^2 + M3*ddth3*X3^2 - L2*M3*G.*sin(th1 + th2) ...
			- M2*G*X2.*sin(th1 + th2) - M3*G*X3.*sin(th1 + th2 + th3) + L1*M2*dth1.^2*X2.*sin(th2) ...
			- L2*M3*dth3.^2*X3.*sin(th3) + L1*M3*ddth1*X3.*cos(th2 + th3) + L1*L2*M3*ddth1.*cos(th2) ...
			+ L1*M2*ddth1*X2.*cos(th2) + 2*L2*M3*ddth1*X3.*cos(th3) + 2*L2*M3*ddth2*X3.*cos(th3) ... 
			+ L2*M3*ddth3*X3.*cos(th3) + L1*M3*dth1.^2*X3.*sin(th2 + th3) + L1*L2*M3*dth1.^2.*sin(th2) ...
			- 2*L2*M3*dth1.*dth3*X3.*sin(th3) - 2*L2*M3*dth2.*dth3*X3.*sin(th3);


torque(3, :) = I3*ddth3 + M3*ddth1*X3^2 + M3*ddth2*X3^2 + M3*ddth3*X3^2 ...
			- M3*G*X3.*sin(th1 + th2 + th3) + L2*M3*dth1.^2*X3.*sin(th3) ...
			+ L2*M3*dth2.^2*X3.*sin(th3) + L1*M3*ddth1*X3.*cos(th2 + th3) ...
			+ L2*M3*ddth1*X3.*cos(th3) + L2*M3.*ddth2*X3.*cos(th3) ...
			+ L1*M3*dth1.^2*X3.*sin(th2 + th3) + 2*L2*M3*dth1.*dth2*X3.*sin(th3);