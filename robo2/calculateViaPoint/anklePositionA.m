function positionA = anklePositionA(d1, stepNumber, x1, z1, stairLength, stairHeight, dNQ, dQR)%在脚踩在最下面时stairnumber=1
    xN = x1 + stepNumber * stairLength - d1 - dQR;
    zN = z1 + (stepNumber - 1) * stairHeight + dNQ;
    positionA = real([xN zN]');
end