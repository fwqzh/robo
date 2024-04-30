function CoMViaPoints = generateCoMViaPoints_test()

SetupBipedRobot;

for i = 1:1:15
    CoMViaPoints(1,i) = stairLength*3.7/15*i+0.2;%xCoM
    CoMViaPoints(2,i) = stairHeight*3.6/15*i+0.9;%zCoM
end

CoMViaPoints(2,1:5)=CoMViaPoints(2,1:5)+[0 0.1 0.2 0.1 0];
CoMViaPoints(2,6:10)=CoMViaPoints(2,6:10)+[0 0.1 0.2 0.15 0.05];
CoMViaPoints(2,11:15)=CoMViaPoints(2,11:15)+[0 0 0.1 0.05 0];