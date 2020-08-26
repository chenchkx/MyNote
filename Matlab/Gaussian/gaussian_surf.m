% 绘制高斯分布曲面

clear;
clc;

mu = zeros(1,2);            %该高斯分布的均值向量
sigma = [0.9 0.5; 0.5 0.9]; %该高斯分布的协方差矩阵

% 1.使用 meshgrid 函数得到xoy平面中每个交叉点的坐标，横坐标矩阵 X 、和纵坐标矩阵 Y
[X,Y] = meshgrid(-1.5:0.05:1.5); 
[rows,cols] = size(X); 
x = reshape(X,rows*cols,1);
y = reshape(Y,rows*cols,1);
p = [x,y];                  %将每个点的横坐标矩阵 X 和纵坐标矩阵 Y 合并到一个矩阵中

% 2. 使用 mvnpdf 函数得到每个点的概率密度
z = mvnpdf(p,mu,sigma);     %求得网格点上的概率密度
Z = reshape(z,rows,cols);

% 3. 使用 surf 函数画出高斯分布的曲面
figure
surf(X,Y,Z);                %画曲面 
mesh(X,Y,Z);                %画网格

surfc(X,Y,Z);               %画曲面 ，可以显示等高线
meshc(X,Y,Z);               %画网格 ，可以显示等高线

contourf(X,Y,Z)             %只画等高线图




