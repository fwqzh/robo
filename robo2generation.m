close all
clear              % claer work space
global uLINK       % allow access from external functions

SetupBipedRobot;   % change size of the robo2 in SetupBipedRobot.m

viaPoint = generateViaPoints(stairLength, stairHeight, dNQ, dQR, dNK, dMK, x1, z1, ...
    eta1, epsilon1, epsilon2, eta2, epsilon3, limit, eta3, epsilon4, eta4, epsilon5);
%drawViaPoint(viaPoint);

%%%%%%%%%%% set parameters %%%%%%%%%%%%

%%% simulation time
dt = 0.02; %和kmp设置统一
demoLen = 50; %和kmp设置统一
EndTime = dt * demoLen;
time = dt:dt:EndTime;

%%% robot position(由轨迹生成函数输入)

interpolation = polynomial(viaPoint,dt,EndTime);
%interpolation = kmp(viaPoint,dt,EndTime);
%1-7行分别为 时间/leftx/leftz/rghtx/rightz/CoMx/CoMz

%%%%%%%%%%% set non singular posture %%%%%%%%%%%%
uLINK(RLEG_J2).q = -5.0*ToRad;
uLINK(RLEG_J3).q = 10.0*ToRad;
uLINK(RLEG_J4).q = -5.0*ToRad;

uLINK(LLEG_J2).q = -5.0*ToRad;
uLINK(LLEG_J3).q = 10.0*ToRad;
uLINK(LLEG_J4).q = -5.0*ToRad;

uLINK(BODY).p = [0.0, 0.0, 0.7]';
uLINK(BODY).R = eye(3);

%%%%%%%%%%% set robot posture and draw %%%%%%%%%%%%
figure

for k = 1:demoLen
    
    %%% inverse kinematics
    uLINK(BODY).p = [interpolation(6,k), 0.0, interpolation(7,k)]';
    uLINK(BODY).R = eye(3);

    Lfoot.p = [interpolation(2,k), 0.1, interpolation(3,k)]' ;
    Lfoot.R = RPY2R(1/2*pi*([0 0 0])); %  -pi/4 < q < pi/4
    lerr_norm = InverseKinematics_LM(LLEG_J5, Lfoot);

    Rfoot.p = [interpolation(4,k), -0.1, interpolation(5,k)]';
    Rfoot.R = RPY2R(1/2*pi*([0 0 0]));  %  -pi/4 < q < pi/4 (-0.5 ~ 0.5)
    rerr_norm = InverseKinematics_LM(RLEG_J5, Rfoot);
    
    %%% store angle data
    angleData(1,k)=k*0.042;
    angleData(2,k)=uLINK(RLEG_J2).q;%髋关节角度
    angleData(3,k)=uLINK(RLEG_J3).q;%膝关节角度

    %%% draw the robot
    hold off
    newplot

    DrawAllJoints(1);
    DrawSteps(stairLength, stairWidth, stairHeight);
    
    pointSizes = ones(1, k) * 10;
    leftColors = repmat([0 0 1], k, 1);
    rightColors = repmat([1 0 0], k, 1);
    bodyColors = repmat([0 1 0], k, 1);

    %scatter3(interpolation(2,1:k), 0.1, interpolation(3,1:k),pointSizes, leftColors, 'filled');
    %scatter3(interpolation(4,1:k), -0.1, interpolation(5,1:k),pointSizes, rightColors, 'filled');
    
    hold on
  
    view(-38,10)
    %view(0,0)
    axis ([-0.5 4 -2 2 -0.5 3]);
    xlabel('x'),ylabel('y'),zlabel('z');
    grid on

    drawnow;

end





