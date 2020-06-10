%% test singular value decomposition.
% Written by Kai-Xuan Chen, (e-mail: kaixuan_chen_jsh@163.com)
% If you find any bugs, please contact me.
% Date: 2020.06.10


clear;
clc;
data = rand(50,100);

[U,S,V] = compute_svd(data);

