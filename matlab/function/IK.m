function [th1, th2, th3] = IK(x, y, phi)
    load('./data/trained_anfis.mat', 'trained_anfis');
    xyp = [abs(x) y phi];
    for i = 1:length(x)
        if x(i) < 0
            xyp(i, 3) = xyp(i, 3) - 2
        end
    end
    th1 = evalfis(xyp, trained_anfis.anfis1);
    th2 = evalfis(xyp, trained_anfis.anfis2);
    th3 = evalfis(xyp, trained_anfis.anfis3);
    if x < 0
        th1 = -1 * th1;
        th2 = -1 * th2;
        th3 = -1 * th3;
    end
end
