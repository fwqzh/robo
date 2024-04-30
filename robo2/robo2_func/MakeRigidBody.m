function MakeRigidBody(j, wdh, mass)
global uLINK

uLINK(j).m = mass;                                    % mass
uLINK(j).c = [0 0 0]';                                % 重心CoM
uLINK(j).I = [1/12*(wdh(2)^2 + wdh(3)^2) 0 0;...
            0 1/12*(wdh(1)^2 + wdh(3)^2)  0;...
            0 0 1/12*(wdh(1)^2 + wdh(2)^2)] * mass; % 转动惯量
uLINK(j).vertex = [
   0      0      0;
   0      wdh(2) 0;
   wdh(1) wdh(2) 0;
   wdh(1) 0      0;
   0      0      wdh(3);
   0      wdh(2) wdh(3);
   wdh(1) wdh(2) wdh(3);
   wdh(1) 0      wdh(3);
]';                             % 顶点坐标
for n=1:3
    uLINK(j).vertex(n,:) = uLINK(j).vertex(n,:) - wdh(n)/2;  % 以原点为中心
end
uLINK(1).face = [
   1 2 3 4; 2 6 7 3; 4 3 7 8;
   1 5 8 4; 1 2 6 5; 5 6 7 8;
]';                             % 多边形
