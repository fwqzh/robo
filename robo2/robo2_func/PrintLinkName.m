function PrintLinkName(j)
global uLINK  % 参考全局变量uLINK

if j ~= 0
    fprintf('j=%2d : %s\n',j,uLINK(j).name); % 显示自己的名字
    PrintLinkName(uLINK(j).child);       
    PrintLinkName(uLINK(j).sister);      
end