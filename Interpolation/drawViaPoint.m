function drawViaPoint(viaPoint)
SetupBipedRobot;

% 提取第一个子矩阵的 x 和 z 坐标
x_coords_layer1 = [viaPoint(1,:,1)];
z_coords_layer1 = [viaPoint(2,:,1)];

% 提取第二个子矩阵的 x 和 z 坐标
x_coords_layer2 = [viaPoint(1,:,2)];
z_coords_layer2 = [viaPoint(2,:,2)];

% 提取第三个子矩阵的 x 和 z 坐标
x_coords_layer3 = [viaPoint(1,:,3)];
z_coords_layer3 = [viaPoint(2,:,3)];

% 绘制第一个子矩阵的散点图（蓝色）
scatter(x_coords_layer1, z_coords_layer1, 'filled', 'b');
hold on; % 保持图形以便继续添加元素

% 绘制第二个子矩阵的散点图（红色）
scatter(x_coords_layer2, z_coords_layer2, 'filled', 'r');
hold on; % 结束保持图形状态

% 绘制第二个子矩阵的散点图（绿色）
scatter(x_coords_layer3, z_coords_layer3, 'filled', 'g');
hold off; % 结束保持图形状态

xlabel('X 坐标');
ylabel('Z 坐标');
title('两层矩阵中的点分布');
legend('Left', 'Right','CoM');
grid on;

hold on;

% 绘制五个二维台阶
num_steps = 5;

for i = 1:num_steps
    % 计算台阶的位置
    step_x = (i - 1) * stairLength;
    step_z = (i - 2) * stairHeight;
    
    % 绘制台阶
    rectangle('Position', [step_x, step_z, stairLength, stairHeight], 'FaceColor', 'g');
end