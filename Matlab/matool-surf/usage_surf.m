% usage of surf
% 绘制三维曲面图
clear
clc

[X,Y,Z] = peaks(25);
% X 和 Y 分别是网格中每个交叉点的横坐标以及纵坐标，Z 是该点坐标的高度值

figure
surf(X,Y,Z);
%% 下面两个函数可以看到等高线，感觉非常神奇
surfc(X,Y,Z);
meshc(X,Y,Z);

%% 绘制球体
% k = 5;
% n = 2^k-1;
% [x,y,z] = sphere(n);
% c = hadamard(2^k);
% 
% figure
% surf(x,y,z,c);
% colormap([1  1  0; 0  1  1])
% axis equal


%%
[x,y]=meshgrid(0:0.1:2,1:0.1:3);
z=(x-1).^2+(y-2).^2-1;
subplot(2,2,1);
meshc(x,y,z);title('meshc(x,y,z)');
subplot(2,2,2);
meshz(x,y,z);title('meshz(x,y,z)');
subplot(2,2,3);
surfc(x,y,z);title('surfc(x,y,z)');
subplot(2,2,4);
surfl(x,y,z);title('surfl(x,y,z)');