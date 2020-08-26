% 绘制高斯分布曲面


clear;
clc;

mu = zeros(1,2);
% sigma = eye(2);
sigma = [0.9 0.5; 0.5 0.9];

[X,Y] = meshgrid(-1.5:0.05:1.5);
[rows,cols] = size(X);
x = reshape(X,rows*cols,1);
y = reshape(Y,rows*cols,1);

p = [x,y];
z = mvnpdf(p,mu,sigma); % 求得网格点上的概率密度
Z = reshape(z,rows,cols);

figure

surf(X,Y,Z); %画曲面 
mesh(X,Y,Z); %画网格

surfc(X,Y,Z); %画曲面 ，可以显示等高线
meshc(X,Y,Z); %画网格 ，可以显示等高线




