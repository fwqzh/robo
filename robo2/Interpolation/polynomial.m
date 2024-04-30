function polynomialInterpolation = polynomial(viaPoint,dt,EndTime)

SetupBipedRobot;

time = dt:dt:EndTime;
tsize = length(time);

for i = 1:1:15
    viaPointTime(i) = EndTime/15*i;
end

%%%%%%% 提取 x 和 z 坐标以及对应的时间 %%%%%%%
leftxN = viaPoint(1,:,1);
leftzN = viaPoint(2,:,1);
rightxN = viaPoint(1,:,2);
rightzN = viaPoint(2,:,2);
CoMxN = viaPoint(1,:,3);
CoMzN = viaPoint(2,:,3);

%%%%%%%% 进行插值 %%%%%%%
leftx_interp = interp1(viaPointTime, leftxN, time, 'pchip'); %'pchip' can be changed to 'spline'
leftz_interp = interp1(viaPointTime, leftzN, time, 'pchip');
rightx_interp = interp1(viaPointTime, rightxN, time, 'pchip');
rightz_interp = interp1(viaPointTime, rightzN, time, 'pchip');
CoMx_interp = interp1(viaPointTime, CoMxN, time, 'pchip');
CoMz_interp = interp1(viaPointTime, CoMzN, time, 'pchip');

polynomialInterpolation = [time; leftx_interp; leftz_interp; rightx_interp; rightz_interp; CoMx_interp; CoMz_interp];











