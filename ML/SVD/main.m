%% An implementation of singular value decomposition in matlab
% Written by Kai-Xuan Chen, (e-mail: kaixuan_chen_jsh@163.com)
% If you find any bugs, please contact me.
% Date: 2020.06.10


clear;
clc;
data = rand(20,100);

% U: left Singular Vectors, S: Singular Values, V: right Singular Vectors      
[U,S,V] = compute_svd(data);



