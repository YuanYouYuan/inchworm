function check_IK(th1, th2, th3)
    [x, y, phi] = FK(th1, th2, th3)
    [TH1, TH2, TH3] = IK(x, y, phi)
end
