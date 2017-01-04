function exceed = theta_in_workspace(th1, th2, th3)
    exceed = [abs(th1) > 90 abs(th2) > 120 abs(th3) > 90];
    for i = 1:3
        if exceed(i)
            disp(['theta' num2str(i) ' is out of range']);
        end
    end

    exceed  = all(exceed);

    [x, y, phi] = FK(th1, th2, th3);
    if y < 0
        disp('collide with the ground');
        exceed = true;
    end
end
