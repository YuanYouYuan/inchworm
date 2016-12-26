function inchworm = plot_inchworm(theta, fixed_point)
    % load L
    load('./data/new_parameter', 'L'); 
    
    % use complex number to represent joints
    j = sqrt(-1);
    joint = [0 L(1)];
    for k = 3:5
        joint(k) = joint(k-1) + L(k-1)*exp(sum(theta(3:k))*j);
    end

    % end section
    head = joint(1) + [j -j]*(joint(2)-joint(1))/norm(joint(2)-joint(1)) * L(1);
    tail = joint(5) + [j -j]*(joint(4)-joint(5))/norm(joint(4)-joint(5)) * L(4);

    % suction cup status
    suction_cup = [(theta(1) < 0) (theta(7) < 0)];

    inchworm = struct('joint', xy(joint), ... 
            'head', xy(head), ... 
            'tail', xy(tail), ... 
            'suction_cup', suction_cup, ...
            'sole_length', L(1), ...
            'calf_length', L(1), ...
            'thigh_length', L(2));

    function xy_struct = xy(complex_number)
        complex_number = complex_number * exp(-j*deg2rad(fixed_point.rotation));
        xy_struct.x = fixed_point.x + imag(complex_number);
        xy_struct.y = fixed_point.y + real(complex_number);
    end

end
