%%%%%%% set up stair parameters %%%%%%%
stairLength = 0.5;
stairHeight = 0.2;
stairWidth = 1.6;
x1 = 0;
z1 = 0;

%%%%%%% set up body parameters %%%%%%%
dNQ = 0.05;
dQR = 0.2;
dQP = 0.1;
dNK = 0.6;
dMK = 0.6;

%%%%%%% set up control parameters %%%%%%%
%%% A/E
eta1 = 1;
epsilon1 = 2000; %epsilon+,distance-
epsilon2 = 1;
%%% B
eta2 = 1;
epsilon3 = 1000;
limit = 0;
%%% C
eta3 = 1;
epsilon4 = 10;
%%% D
eta4 = 1;
epsilon5 = 50;

%%%%%%% robo2 model %%%%%%%
global uLINK

ToDeg = 180/pi;
ToRad = pi/180;
UX = [1 0 0]';
UY = [0 1 0]';
UZ = [0 0 1]';

uLINK    = struct('name','BODY'    , 'm', 10, 'sister', 0, 'child', 2, 'b',[0  0    0.7]','a',UZ,'q',0);

uLINK(2) = struct('name','RLEG_J0' , 'm',  5, 'sister', 8, 'child', 3, 'b',[0 -0.1 0]'   ,'a',UZ,'q',0);
uLINK(3) = struct('name','RLEG_J1' , 'm',  1, 'sister', 0, 'child', 4, 'b',[0  0   0]'   ,'a',UX,'q',0);
uLINK(4) = struct('name','RLEG_J2' , 'm',  5, 'sister', 0, 'child', 5, 'b',[0  0   0]'   ,'a',UY,'q',0);
uLINK(5) = struct('name','RLEG_J3' , 'm',  1, 'sister', 0, 'child', 6, 'b',[0  0  -dMK]' ,'a',UY,'q',0);
uLINK(6) = struct('name','RLEG_J4' , 'm',  6, 'sister', 0, 'child', 7, 'b',[0  0  -dNK]' ,'a',UY,'q',0);
uLINK(7) = struct('name','RLEG_J5' , 'm',  2, 'sister', 0, 'child', 0, 'b',[0  0   0  ]' ,'a',UX,'q',0);

uLINK(8) = struct('name','LLEG_J0' , 'm',  5, 'sister', 0, 'child', 9, 'b',[0  0.1 0]'   ,'a',UZ,'q',0);
uLINK(9) = struct('name','LLEG_J1' , 'm',  1, 'sister', 0, 'child',10, 'b',[0  0   0]'   ,'a',UX,'q',0);
uLINK(10)= struct('name','LLEG_J2' , 'm',  5, 'sister', 0, 'child',11, 'b',[0  0   0]'   ,'a',UY,'q',0);
uLINK(11)= struct('name','LLEG_J3' , 'm',  1, 'sister', 0, 'child',12, 'b',[0  0  -dMK]' ,'a',UY,'q',0);
uLINK(12)= struct('name','LLEG_J4' , 'm',  6, 'sister', 0, 'child',13, 'b',[0  0  -dNK]' ,'a',UY,'q',0);
uLINK(13)= struct('name','LLEG_J5' , 'm',  2, 'sister', 0, 'child', 0, 'b',[0  0   0  ]' ,'a',UX,'q',0);

[uLINK(1).vertex,uLINK(1).face]   = MakeBox([0.2 0.4 0.5]  ,[0.1 0.2 -0.1] );    % BODY
[uLINK(7).vertex,uLINK(7).face]   = MakeBox([dQR+dQP 0.1 0.02] ,[dQP 0.05 dNQ]); % Foot
[uLINK(13).vertex,uLINK(13).face] = MakeBox([dQR+dQP 0.1 0.02] ,[dQP 0.05 dNQ]); % Foot

FindMother(1);   % Find mother link from sister and child data

%%% Substitute the ID to the link name variables. For example, BODY=1.
for n=1:length(uLINK)
    eval([uLINK(n).name,'=',num2str(n),';']);
end

uLINK(BODY).p = [0.0, 0.0, 0.65]';
uLINK(BODY).R = eye(3);
ForwardKinematics(1);

uLINK(BODY).v = [0 0 0]';
uLINK(BODY).w = [0 0 0]';
for n=1:length(uLINK)
    uLINK(n).dq = 0; % joint speed   [rad/s]
end