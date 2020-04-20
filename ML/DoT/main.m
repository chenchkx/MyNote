% DIMENSION OF TANGENT (using K nearest neighbors) 
% AUTHOR: Kai-Xuan Chen, 
% DATE: 2020.04.21

clear;
clc;

load('sphere.mat');
k_nn = 50;       % num of k neighbor
type = 'local'; % 'local' or 'global'

ind_data = find(label == 0);
data_matrix = matrix(:,ind_data);
tree = createns(data_matrix','NSMethod','kdtree');
ind_knn = knnsearch(tree,data_matrix','K',k_nn+1); % index of knn
[dim, num] = size(data_matrix);

dim_tanSpaceMatrix = zeros(1,num);
for i = 1:num
    i_data = data_matrix(:,i);
    i_nborMatrix = data_matrix(:,ind_knn(i,2:k_nn+1));
    i_nborMatrix = process_data(i_nborMatrix,i_data,k_nn,type);
    i_covMatrix = cov(i_nborMatrix');      % covariance matrix of k neighbor
    [~,D] = eig(i_covMatrix); 
    num_pEigen = length(find(diag(D)>0));
    %% diemnsion of tangent space
    dim_tanSpaceMatrix(1,i) = num_pEigen;   
end
dim_min = min(dim_tanSpaceMatrix);
dim_max = max(dim_tanSpaceMatrix);
%% dimension of tangent bundle
dim_tanBundle = 2*max(dim_tanSpaceMatrix); 

