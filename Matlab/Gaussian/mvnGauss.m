% https://ww2.mathworks.cn/help/stats/multivariate-normal-distribution-1.html
% 

clear;
clc;


mu = zeros(1,2);
% sigma = eye(2);
sigma = [0.9 0.4; 0.4 0.3];
rng('default')  % For reproducibility
X = mvnrnd(mu,sigma,1000);

y = mvnpdf(X,mu,sigma);

% scatter3(X(:,1),X(:,2),y) % 样本为空心小篮球
scatter3(X(:,1),X(:,2),y,'r.') %样本为小红点
% scatter3(X(:,1),X(:,2),y,'bv') %样本为蓝色倒三角

xlabel('X1')
ylabel('X2')
zlabel('Probability Density')



