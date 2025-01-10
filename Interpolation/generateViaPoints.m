function viaPoint = generateViaPoints(stairLength, stairHeight, dNQ, dQR, dNK, dMK, x1, z1, ...
    eta1, epsilon1, epsilon2, eta2, epsilon3, limit, eta3, epsilon4, eta4, epsilon5)

%%% viapoint  1 -2 -3 -4 -5 -6 -7 -8 -9 -10-11-12-13-14-15
%%% left leg  A -B -C -D -E -/ -/ -/ -/ -/ -A -B -C -D -E
%%% right leg / -/ -/ -/ -/ -A -B -C -D -E -/ -/ -/ -/ -/ 

%%%%%%% CoM %%%%%%%
viaPoint(:,:,3) = generateCoMViaPoints_test();

for i = 1:1:15
    xM(i) = viaPoint(1,i,3);
    zM(i) = viaPoint(2,i,3);
end

%%%%%%% left leg ankle %%%%%%%

%%% viapoint 1 (lA)
%function d1 = calculateViaPointA(stairLength, stairHeight, eta1, epsilon1, epsilon2)
d1 = calculateViaPointA(stairLength, stairHeight, eta1, epsilon1, epsilon2);
%function positionA = anklePositionA(d1, stepNumber, x1, z1, stairLength, stairHeight, dNQ, dQR)
positionA = anklePositionA(d1, 1, x1, z1, stairLength, stairHeight, dNQ, dQR);
viaPoint(1,1,1) = positionA(1);%xN
viaPoint(2,1,1) = positionA(2);%zN

%%% viapoint 2 (lB)
%function d2 = calculateViaPointB(stairLength, stairHeight, dNQ, dQR, eta2, epsilon3, limit)
d2 = calculateViaPointB(stairLength, stairHeight, dNQ, dQR, eta2, epsilon3, limit);
%function positionB = anklePositionB(d1, d2, stepNumber, x1, z1, stairLength, stairHeight, dNQ, dQR)
positionB = anklePositionB(d1, d2, 1, x1, z1, stairLength, stairHeight, dNQ, dQR);
viaPoint(1,2,1) = positionB(1);
viaPoint(2,2,1) = positionB(2);

%%% viapoint 3 (lC)
%function d3 = calculateViaPointC(stairLength, stairHeight, eta3, epsilon4)
d3 = calculateViaPointC(stairLength, stairHeight, eta3, epsilon4);
%function positionC = anklePositionC(d3, stepNumber, x1, z1, stairLength, stairHeight, xM, zM, dNQ, dQR, dNK, dMK)
positionC = anklePositionC(d3, 1, x1, z1, stairLength, stairHeight, xM(3), zM(3), dNQ, dQR, dNK, dMK);
viaPoint(1,3,1) = positionC(1);
viaPoint(2,3,1) = positionC(2);

%%% viapoint 4 (lD)
%function d4 = calculateViaPointD(stairLength, stairHeight, eta4, epsilon5)
d4 = calculateViaPointD(stairLength, stairHeight, eta4, epsilon5);
%function positionD = anklePositionD(d4, stepNumber, x1, z1, stairLength, stairHeight, xM, zM, dNQ, dQR, dNK, dMK)
positionD = anklePositionD(d4, 2, x1, z1, stairLength, stairHeight, xM(4), zM(4), dNQ, dQR, dNK, dMK);
viaPoint(1,4,1) = positionD(1);
viaPoint(2,4,1) = positionD(2);

%%% viapoint 5 (lE)
%function d1 = calculateViaPointA(stairLength, stairHeight, eta1, epsilon1, epsilon2)
d1 = calculateViaPointA(stairLength, stairHeight, eta1, epsilon1, epsilon2);
%function positionA = anklePositionA(d1, stepNumber, x1, z1, stairLength, stairHeight, dNQ, dQR)
positionA = anklePositionA(d1, 3, x1, z1, stairLength, stairHeight, dNQ, dQR);
viaPoint(1,5,1) = positionA(1);
viaPoint(2,5,1) = positionA(2);

%%% viapoint 6 (wait/rA)
viaPoint(1,6,1) = positionA(1);
viaPoint(2,6,1) = positionA(2);

%%% viapoint 7 (wait/rB)
viaPoint(1,7,1) = positionA(1);
viaPoint(2,7,1) = positionA(2);

%%% viapoint 8 (wait/rC)
viaPoint(1,8,1) = positionA(1);
viaPoint(2,8,1) = positionA(2);

%%% viapoint 9 (wait/rD)
viaPoint(1,9,1) = positionA(1);
viaPoint(2,9,1) = positionA(2);

%%% viapoint 10 (wait/rE)
viaPoint(1,10,1) = positionA(1);
viaPoint(2,10,1) = positionA(2);

%%% viapoint 11 (lA)
viaPoint(1,11,1) = positionA(1);
viaPoint(2,11,1) = positionA(2);

%%% viapoint 12 (lB)
%function d2 = calculateViaPointB(stairLength, stairHeight, dNQ, dQR, eta2, epsilon3, limit)
d2 = calculateViaPointB(stairLength, stairHeight, dNQ, dQR, eta2, epsilon3, limit);
%function positionB = anklePositionB(d1, d2, stepNumber, x1, z1, stairLength, stairHeight, dNQ, dQR)
positionB = anklePositionB(d1, d2, 3, x1, z1, stairLength, stairHeight, dNQ, dQR);
viaPoint(1,12,1) = positionB(1);
viaPoint(2,12,1) = positionB(2);

%%% viapoint 13 (lC)
%function d3 = calculateViaPointC(stairLength, stairHeight, eta3, epsilon4)
d3 = calculateViaPointC(stairLength, stairHeight, eta3, epsilon4);
%function positionC = anklePositionC(d3, stepNumber, x1, z1, stairLength, stairHeight, xM, zM, dNQ, dQR, dNK, dMK)
positionC = anklePositionC(d3, 3, x1, z1, stairLength, stairHeight, xM(13), zM(13), dNQ, dQR, dNK, dMK);
viaPoint(1,13,1) = positionC(1);
viaPoint(2,13,1) = positionC(2);

%%% viapoint 14 (lD)
%function d4 = calculateViaPointD(stairLength, stairHeight, eta4, epsilon5)
d4 = calculateViaPointD(stairLength, stairHeight, eta4, epsilon5);
%function positionD = anklePositionD(d4, stepNumber, x1, z1, stairLength, stairHeight, xM, zM, dNQ, dQR, dNK, dMK)
positionD = anklePositionD(d4, 4, x1, z1, stairLength, stairHeight, xM(14), zM(14), dNQ, dQR, dNK, dMK);
viaPoint(1,14,1) = positionD(1);
viaPoint(2,14,1) = positionD(2);

%%% viapoint 15 (lE)
%function d1 = calculateViaPointA(stairLength, stairHeight, eta1, epsilon1, epsilon2)
d1 = calculateViaPointA(stairLength, stairHeight, eta1, epsilon1, epsilon2);
%function positionA = anklePositionA(d1, stepNumber, x1, z1, stairLength, stairHeight, dNQ, dQR)
positionA = anklePositionA(d1, 5, x1, z1, stairLength, stairHeight, dNQ, dQR);
viaPoint(1,15,1) = positionA(1);
viaPoint(2,15,1) = positionA(2);

%%%%%%% right leg ankle%%%%%%%

%%% viapoint 1 (wait/lA)
%function d1 = calculateViaPointA(stairLength, stairHeight, eta1, epsilon1, epsilon2)
d1 = calculateViaPointA(stairLength, stairHeight, eta1, epsilon1, epsilon2);
%function positionA = anklePositionA(d1, stepNumber, x1, z1, stairLength, stairHeight, dNQ, dQR)
positionA = anklePositionA(d1, 2, x1, z1, stairLength, stairHeight, dNQ, dQR);
viaPoint(1,1,2) = positionA(1);
viaPoint(2,1,2) = positionA(2);

%%% viapoint 2 (wait/lB)
viaPoint(1,2,2) = positionA(1);
viaPoint(2,2,2) = positionA(2);

%%% viapoint 3 (wait/lC)
viaPoint(1,3,2) = positionA(1);
viaPoint(2,3,2) = positionA(2);

%%% viapoint 4 (wait/lD)
viaPoint(1,4,2) = positionA(1);
viaPoint(2,4,2) = positionA(2);

%%% viapoint 5 (wait/lE)
viaPoint(1,5,2) = positionA(1);
viaPoint(2,5,2) = positionA(2);

%%% viapoint 6 (rA)
viaPoint(1,6,2) = positionA(1);
viaPoint(2,6,2) = positionA(2);

%%% viapoint 7 (rB)
%function d2 = calculateViaPointB(stairLength, stairHeight, dNQ, dQR, eta2, epsilon3, limit)
d2 = calculateViaPointB(stairLength, stairHeight, dNQ, dQR, eta2, epsilon3, limit);
%function positionB = anklePositionB(d1, d2, stepNumber, x1, z1, stairLength, stairHeight, dNQ, dQR)
positionB = anklePositionB(d1, d2, 2, x1, z1, stairLength, stairHeight, dNQ, dQR);
viaPoint(1,7,2) = positionB(1);
viaPoint(2,7,2) = positionB(2);

%%% viapoint 8 (rC)
%function d3 = calculateViaPointC(stairLength, stairHeight, eta3, epsilon4)
d3 = calculateViaPointC(stairLength, stairHeight, eta3, epsilon4);
%function positionC = anklePositionC(d3, stepNumber, x1, z1, stairLength, stairHeight, xM, zM, dNQ, dQR, dNK, dMK)
positionC = anklePositionC(d3, 2, x1, z1, stairLength, stairHeight, xM(8), zM(8), dNQ, dQR, dNK, dMK);
viaPoint(1,8,2) = positionC(1);
viaPoint(2,8,2) = positionC(2);

%%% viapoint 9 (rD)
%function d4 = calculateViaPointD(stairLength, stairHeight, eta4, epsilon5)
d4 = calculateViaPointD(stairLength, stairHeight, eta4, epsilon5);
%function positionD = anklePositionD(d4, stepNumber, x1, z1, stairLength, stairHeight, xM, zM, dNQ, dQR, dNK, dMK)
positionD = anklePositionD(d4, 3, x1, z1, stairLength, stairHeight, xM(9), zM(9), dNQ, dQR, dNK, dMK);
viaPoint(1,9,2) = positionD(1);
viaPoint(2,9,2) = positionD(2);

%%% viapoint 10 (rE)
%function d1 = calculateViaPointA(stairLength, stairHeight, eta1, epsilon1, epsilon2)
d1 = calculateViaPointA(stairLength, stairHeight, eta1, epsilon1, epsilon2);
%function positionA = anklePositionA(d1, stepNumber, x1, z1, stairLength, stairHeight, dNQ, dQR)
positionA = anklePositionA(d1, 4, x1, z1, stairLength, stairHeight, dNQ, dQR);
viaPoint(1,10,2) = positionA(1);
viaPoint(2,10,2) = positionA(2);

%%% viapoint 11 (wait/lA)
viaPoint(1,11,2) = positionA(1);
viaPoint(2,11,2) = positionA(2);

%%% viapoint 12 (wait/lB)
viaPoint(1,12,2) = positionA(1);
viaPoint(2,12,2) = positionA(2);

%%% viapoint 13 (wait/lC)
viaPoint(1,13,2) = positionA(1);
viaPoint(2,13,2) = positionA(2);

%%% viapoint 14 (wait/lD)
viaPoint(1,14,2) = positionA(1);
viaPoint(2,14,2) = positionA(2);

%%% viapoint 15 (wait/lE)
viaPoint(1,15,2) = positionA(1);
viaPoint(2,15,2) = positionA(2);



