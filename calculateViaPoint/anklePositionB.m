function positionB = anklePositionB(d1, d2, stepNumber, x1, z1, stairLength, stairHeight, dNQ, dQR)
    if dNQ ^ 2 + dQR ^ 2 <= d2 ^ 2
       d2 = sqrt(dNQ ^ 2 + dQR ^ 2);
    end
    xN = x1 + stepNumber * stairLength - d1 - sqrt(dNQ ^ 2 + dQR ^ 2 - d2 ^ 2);
    zN = z1 + (stepNumber - 1) * stairHeight + d2;
    positionB = real([xN zN]');
end