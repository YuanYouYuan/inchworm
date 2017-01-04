function [energy, energy_sum] = gait_energy(gait_torq, gait_traj)
    torq = gait_torq.torq;
    th = gait_traj.th;

    for i = 1:3
        disp(i, :) = diff(th(2+i, :));
        torque(i, :) = (torq(i, 1:end-1) + torq(i, 2:end))/2;
    end


    energy = abs(disp.*torque);

    for i = 1:size(energy, 2)
        energy_sum(:, i) = sum(energy(:, 1:i), 2);
    end

    figure('name', 'joint energy');
    for i =1:3
        subplot(3, 1, i);
        plot(energy(i, :));
        xlabel(['joint' num2str(i+2)]);
        ylabel('energy(N*m)');
        hold on;
    end

    figure('name', 'joint energy sum');
    for i =1:3
        subplot(3, 1, i);
        plot(energy_sum(i, :));
        xlabel(['joint' num2str(i+2)]);
        ylabel('energy(N*m)');
        hold on;
    end
end
