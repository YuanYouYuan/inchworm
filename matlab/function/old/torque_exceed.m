function exceed = torque_exceed(torque, plot_figure)
	rated_torq = (-25.8/(pi/3/0.18)*abs(dth)+25.8)*9.8*0.01;
	exceed = abs(torque) > rated_torq*0.8;
end
