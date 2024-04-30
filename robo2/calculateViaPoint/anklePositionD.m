function positionD = anklePositionD(d4, stepNumber, x1, z1, stairLength, stairHeight, xM ...%第一个台阶边沿stairnumber=1
    , zM, dNQ, dQR, dNK, dMK)
    xR = x1 + stepNumber * stairLength - d4 * stairHeight / sqrt(stairHeight ^ 2 + stairLength ^ 2);
    zR = z1 + stepNumber * stairHeight + d4 * stairLength / sqrt(stairHeight ^ 2 + stairLength ^ 2);
    
    a = sqrt(dQR ^ 2 + (dNQ + dNK) ^ 2);
    b = dMK;
    c = sqrt((xM - xR) ^ 2 + (zM - zR) ^ 2);

    xK = xM + b * cos(atan((zR - zM) / (xR - xM)) - acos((b ^ 2 + c ^ 2 - a ^ 2) / (2 * b * c)));
    zK = zM + b * sin(atan((zR - zM) / (xR - xM)) - acos((b ^ 2 + c ^ 2 - a ^ 2) / (2 * b * c)));

    a = dNQ + dNK;
    b = dQR;
    c = sqrt(a ^ 2 + b ^ 2);

    xQ = xR + b * cos(atan((zK - zR) / (xK - xR)) - acos((b ^ 2 + c ^ 2 - a ^ 2) / (2 * b * c)));
    zQ = zR + b * sin(atan((zK - zR) / (xK - xR)) - acos((b ^ 2 + c ^ 2 - a ^ 2) / (2 * b * c)));
    
    xN = (xQ * dNK + xK * dNQ) / (dNQ + dNK);
    zN = (zQ * dNK + zK * dNQ) / (dNQ + dNK);

    positionD = real([xN zN]');
end