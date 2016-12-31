function plot_gait_torq(gait_torq)
    t = gait_torq.t;
    torq = gait_torq.torq;
    rated_torq = gait_torq.rated_torq;

    figure('Name', ['Torque of ' gait_torq.name], 'Position', [100, 100, 1600, 900]);
    for i = 1:size(torq, 1)
        subplot(size(torq, 1), 1, i);
        plot(t, torq(i, :)), hold on;
        plot(t, rated_torq(i, :), 'r--'); hold on;
        plot(t, -rated_torq(i, :), 'r--'); hold on;
        title(['Joint' num2str(i+2)]); % plus 2 since joint3~5
        xlabel('time(s)');
        ylabel('\tau(N*m)', 'FontSize', 14);
        legend('torque', 'rated torque');
    end
    saveas(gcf, ['./data/gaits/torq/' gait_torq.name '.png']);
end
