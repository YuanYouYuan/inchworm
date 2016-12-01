close all;
clear all;
load data/test_flip_gait
% load time, theta, and other

original_time = time
for N = 1:300
	N
	time = original_time;
	for i = 1:N
		compressed_time(N, :) = time - (time - [0 time(1:end-1)]).*rand(1, length(time));
		if ~torque_exceed(theta, compressed_time(N, :))
			time = compressed_time(N, :);
		end
	end
end

compressed_time = [original_time; compressed_time];
for i = 1:size(compressed_time, 2)
	plot(polyval(polyfit(1:301, compressed_time(:,i)', 3), 1:301));
	hold on;
end
plot(compressed_time);
ylabel('time(s)');
xlabel('compress times');


