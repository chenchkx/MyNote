% https://ww2.mathworks.cn/help/stats/multivariate-normal-distribution-1.html
% 

clear;
clc;

mu = zeros(1,2);                            %该高斯分布的均值向量
sigma = [0.9 0.5; 0.5 0.9];                 %该高斯分布的协方差矩阵

% 第1步.
% 使用 mvnrnd 函数得到符合该高斯分布的样本点
data = mvnrnd(mu,sigma,1000);
x = data(:,1);                              %样本点横坐标
y = data(:,2);                              %样本点纵坐标

% 第2步.
% 使用 mvnpdf 函数得到每个点的概率密度
z = mvnpdf(data,mu,sigma);

% 第3步.
% 使用  griddata 和 surf 函数 对已经得到的样本点网格化，其中插值法我们选择使用 'v4'
[X,Y,Z]=griddata(x,y,z,linspace(min(x),max(x))',linspace(min(y),max(y)),'v4'); %插值


figure; surf(X,Y,Z);                    %画曲面 
figure; mesh(X,Y,Z);                    %画网格

figure; surfc(X,Y,Z);                   %画曲面 ，可以显示等高线
figure; meshc(X,Y,Z);                   %画网格 ，可以显示等高线

figure; contourf(X,Y,Z)                 %只画等高线图
scatter3(data(:,1),data(:,2),z,'r.')    %散点图，样本为小红点




