% 绘制高斯分布曲面


clear;
clc;

mu = zeros(1,2);
% sigma = eye(2);
sigma = [2 0; 0 2];

[X,Y] = meshgrid(-2.5:0.05:2.5);
[rows,cols] = size(X);
x = reshape(X,rows*cols,1);
y = reshape(Y,rows*cols,1);

p = [x,y];
z = mvnpdf(p,mu,sigma); % 求得网格点上的概率密度
Z = reshape(z,rows,cols);

figure
mesh(X,Y,Z)


surfc(X,Y,Z);
meshc(X,Y,Z);