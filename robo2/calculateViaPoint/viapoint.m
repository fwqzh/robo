SetupBipedRobot;

xM = 1;
zM = 0.9;

%limit = 0;

%function d1 = calculateViaPointA(stairLength, stairHeight, eta1, epsilon1, epsilon2)
d1 = calculateViaPointA(stairLength, stairHeight, 1, 2500, 1)
%function positionA = anklePositionA(d1, stepNumber, x1, z1, stairLength, stairHeight, dNQ, dQR)
positionA = anklePositionA(d1, 1, x1, z1, stairLength, stairHeight, dNQ, dQR)

%function d2 = calculateViaPointB(stairLength, stairHeight, dNQ, dQR, eta2, epsilon3, limit)
d2 = calculateViaPointB(stairLength, stairHeight, dNQ, dQR, 1, 10, 0)
%function positionB = anklePositionB(d1, d2, stepNumber, x1, z1, stairLength, stairHeight, dNQ, dQR)
positionB = anklePositionB(d1, d2, 1, x1, z1, stairLength, stairHeight, dNQ, dQR)

%function d3 = calculateViaPointC(stairLength, stairHeight, eta3, epsilon4)
d3 = calculateViaPointC(stairLength, stairHeight, 1, 10)
%function positionC = anklePositionC(d3, stepNumber, x1, z1, stairLength, stairHeight, xM, zM, dNQ, dQR, dNK, dMK)
positionC = anklePositionC(d3, 1, x1, z1, stairLength, stairHeight, xM, zM, dNQ, dQR, dNK, dMK)

%function d4 = calculateViaPointD(stairLength, stairHeight, eta4, epsilon5)
d4 = calculateViaPointD(stairLength, stairHeight, 1, 10)
%function positionD = anklePositionD(d4, stepNumber, x1, z1, stairLength, stairHeight, xM, zM, dNQ, dQR, dNK, dMK)
positionD = anklePositionD(d4, 2, x1, z1, stairLength, stairHeight, xM, zM, dNQ, dQR, dNK, dMK)


viaPoint = generateViaPoints(stairLength, stairHeight, dNQ, dQR, dNK, dMK, x1, z1, ...
    eta1, epsilon1, epsilon2, eta2, epsilon3, limit, eta3, epsilon4, eta4, epsilon5)
drawViaPoint(viaPoint)