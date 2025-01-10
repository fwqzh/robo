function CoMViaPoints = generateCoMViaPoints(stairLength, stairHeight)

stairLengthConst = ;
stairHeightConst = ;

for i = 1:1:15
    CoMViaPoints(1,i) = stairLength*4.5/15*i;%xCoM
    CoMViaPoints(2,i) = stairHeight*4/15*i+0.9;%zCoM
end