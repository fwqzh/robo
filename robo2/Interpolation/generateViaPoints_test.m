function viaPoint = generateViaPoints_test(stairLength, stairHeight, dNQ, dQR, dNK, dMK, x1, z1, ...
    eta1, epsilon1, epsilon2, eta2, epsilon3, limit, eta3, epsilon4, eta4, epsilon5)

%%% viapoint  1 -2 -3 -4 -5 -6 -7 -8 -9 -10-11-12-13-14-15
%%% left leg  A -B -C -D -E -/ -/ -/ -/ -/ -A -B -C -D -E
%%% right leg / -/ -/ -/ -/ -A -B -C -D -E -/ -/ -/ -/ -/ 

L = stairLength;
H = stairHeight;

%%%%%%% left leg ankle %%%%%%%
viaPoint(1,:,1) = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]/15;%xN
viaPoint(2,:,1) = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]/15*2.5;%zN

%%%%%%% right leg ankle %%%%%%%
viaPoint(1,:,2) = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]/15;
viaPoint(2,:,2) = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]/15*2.5;

%%%%%%% CoM %%%%%%%
viaPoint(:,:,3) = generateCoMViaPoints_test();
