% https://ww2.mathworks.cn/help/stats/multivariate-normal-distribution-1.html
% 

clear;
clc;


mu = 5;
% sigma = eye(2);
sigma = [4];
rng('default')  % For reproducibility
x = mvnrnd(mu,sigma,100);
% x = randn(1,2000)';
% x = 0:0.1:10;
y = mvnpdf(x,mu,sigma);
[x,ind] = sort(x);
y = y(ind);

plot(x',y')
scatter(x(:,1),y)
% scatter3(X(:,1),X(:,2),y)
% xlabel('X1')
% ylabel('X2')
% zlabel('Probability Density')
