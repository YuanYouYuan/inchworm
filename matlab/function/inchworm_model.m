function inchworm = inchworm_model(theta, fixed_point)
    % load L
    load('./data/new_parameter', 'L'); 
    
    % condition for fixed joint is 5
    if fixed_point.is_switch
        % disp('flip theta');
        theta = flip(theta);
        theta(3:5) = -1 * theta(3:5);

    end
    
    % use complex number to represent joints
    j = sqrt(-1);
    joint = [0 L(1)];
    for k = 3:5
        joint(k) = joint(k-1) + L(k-1)*exp(sum(theta(3:k))*j);
    end


    % end section
    head = joint(1) + [j -j]*(joint(2)-joint(1))/norm(joint(2)-joint(1)) * L(1);
    tail = joint(5) + [j -j]*(joint(4)-joint(5))/norm(joint(4)-joint(5)) * L(4);


    % call xy function to map from complex space to x-y space
    joint = xy(joint);
    head = xy(head);
    tail = xy(tail);

    % suction cup status, true means adhere
    suction_cup = [(theta(1) < 0) (theta(7) < 0)]

    % check whether touch the wall 
    if ~suction_cup(1) & suction_cup(2)
        if all(tail.x <= 0) 
            disp('===touch the wall===');
            rad2deg(theta)
            fixed_point.is_switch = ~fixed_point.is_switch;
            fixed_point.x = 0;
            fixed_point.y = joint.y(end);
            fixed_point.rotation = -90
        end

        if all(tail.y <= 0)
            disp('===touch the ground===');
            fixed_point.is_switch = ~fixed_point.is_switch;
            fixed_point.x = joint.x(end);
            fixed_point.y = 0;
            fixed_point.rotation = 0;
        end
    end

    inchworm = struct('joint', joint, ... 
            'head', head, ... 
            'tail', tail, ... 
            'suction_cup', suction_cup, ...
            'sole_length', L(1), ...
            'calf_length', L(1), ...
            'thigh_length', L(2), ...
            'fixed_point', fixed_point);

    function xy_struct = xy(complex_number)
        complex_number = complex_number * exp(-j*deg2rad(fixed_point.rotation));
        xy_struct.x = fixed_point.x + imag(complex_number);
        xy_struct.y = fixed_point.y + real(complex_number);
    end


end
