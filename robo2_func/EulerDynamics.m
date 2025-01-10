function L = EulerDynamics(j)
global uLINK
I = uLINK(j).R * uLINK(j).I * uLINK(j).R';    % 转动惯量
L = I * uLINK(j).w;                           % 角动量
uLINK(j).dw  = I \ (-cross(uLINK(j).w, L));   % Euler方程