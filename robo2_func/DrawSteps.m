function DrawSteps(stairLength, stairWidth, stairHeight)
    %绘制台阶
% 定义立方体的顶点
v = [-stairLength/2 -stairWidth/2 -stairHeight/2;  % 1
      stairLength/2 -stairWidth/2 -stairHeight/2;  % 2
      stairLength/2  stairWidth/2 -stairHeight/2;  % 3
     -stairLength/2  stairWidth/2 -stairHeight/2;  % 4
     -stairLength/2 -stairWidth/2  stairHeight/2;  % 5
      stairLength/2 -stairWidth/2  stairHeight/2;  % 6
      stairLength/2  stairWidth/2  stairHeight/2;  % 7
     -stairLength/2  stairWidth/2  stairHeight/2]; % 8

% 定义立方体的面
f = [1 2 3 4;   % 底面
     5 6 7 8;   % 顶面
     1 2 6 5;   % 前面
     2 3 7 6;   % 右面
     3 4 8 7;   % 后面
     4 1 5 8];  % 左面

% 设置立方体数量
num_cubes = 5;

% 遍历绘制每个立方体
for i = 1:num_cubes
    % 随机生成立方体的位置
    position = [stairLength*(i-1/2) 0 stairHeight*(i-3/2)]; % 在 (-5, 5) 范围内随机生成位置
    % 平移立方体的顶点
    v_translated = v + repmat(position, size(v, 1), 1);
    % 绘制立方体
    patch('Vertices', v_translated, 'Faces', f, 'FaceColor', 'g', 'FaceAlpha', 0.5);
end
    
end