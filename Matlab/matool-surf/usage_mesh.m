% usage of mesh
% 绘制三维网格图
clear
clc


[X,Y] = meshgrid(-8:.5:8);
% 主要使用的函数为[X,Y]=meshgrid(xgv,ygv);
% meshgrid函数生成的X，Y是大小相等的矩阵，xgv，ygv是两个网格矢量，xgv，ygv都是行向量。

R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(R)./R;

figure
mesh(X,Y,Z)