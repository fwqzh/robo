%%%%%%% 施工中 %%%%%%%
function kmpInterpolation = kmp(viaPoint,dt,EndTime)

SetupBipedRobot;

time = dt:dt:EndTime;
tsize = length(time);

for i = 1:1:15
    via_time(i) = fix(EndTime/dt/15*i)*dt;
end

%%% 提取 x 和 z 坐标以及对应的时间
leftxN = viaPoint(1,:,1);
leftzN = viaPoint(2,:,1);
rightxN = viaPoint(1,:,2);
rightzN = viaPoint(2,:,2);
CoMxN = viaPoint(1,:,3);
CoMzN = viaPoint(2,:,3);

%%% 预插值
leftx_interp = interp1(via_time, leftxN, time, 'pchip');
leftz_interp = interp1(via_time, leftzN, time, 'pchip');
rightx_interp = interp1(via_time, rightxN, time, 'pchip');
rightz_interp = interp1(via_time, rightzN, time, 'pchip');
CoMx_interp = interp1(via_time, CoMxN, time, 'pchip');
CoMz_interp = interp1(via_time, CoMzN, time, 'pchip');

%%% left
via_point(:,1)=[leftxN(1) leftzN(1) 0 0]'; % format:[2D-pos 2D-vel]
via_point(:,2)=[leftxN(2) leftzN(2) 1 1]';  
via_point(:,3)=[leftxN(3) leftzN(3) 1 1]';    
via_point(:,4)=[leftxN(4) leftzN(4) 1 1]'; 

leftWalk1 = kmp_viaPoint2trajectory(via_time, via_point, dt, via_time(5), 1);%左腿迈第一步
leftx_interp(1:tsize/15*5) = leftWalk1(1, 1:tsize/15*5);
leftz_interp(1:tsize/15*5) = leftWalk1(2, 1:tsize/15*5);

via_point(:,1)=[leftxN(11) leftzN(11) 0 0]'; % format:[2D-pos 2D-vel]
via_point(:,2)=[leftxN(12) leftzN(12) 1 1]';  
via_point(:,3)=[leftxN(13) leftzN(13) 1 1]';    
via_point(:,4)=[leftxN(14) leftzN(14) 1 1]'; 

leftWalk2 = kmp_viaPoint2trajectory(via_time, via_point, dt, via_time(5), 2);%左腿迈第二步
leftx_interp(tsize/15*10+1:tsize/15*15) = leftWalk2(1, 1:tsize/15*5);
leftz_interp(tsize/15*10+1:tsize/15*15) = leftWalk2(2, 1:tsize/15*5);

%%% right
via_point(:,1)=[rightxN(6) rightzN(6) 0 0]'; % format:[2D-pos 2D-vel]
via_point(:,2)=[rightxN(7) rightzN(7) 0.01 0.025]';  
via_point(:,3)=[rightxN(8) rightzN(8) 0.3 0.3]';    
via_point(:,4)=[rightxN(9) rightzN(9) 1.12 0.16]'; 

rightWalk1 = kmp_viaPoint2trajectory(via_time, via_point, dt, via_time(5), 3);%右腿迈第一步
rightx_interp(tsize/15*5+1:tsize/15*10) = rightWalk1(1, 1:tsize/15*5);
rightz_interp(tsize/15*5+1:tsize/15*10) = rightWalk1(2, 1:tsize/15*5);

%%% CoM
kmpInterpolation = [time; leftx_interp; leftz_interp; rightx_interp; rightz_interp; CoMx_interp; CoMz_interp];