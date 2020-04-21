% DIMENSION OF TANGENT (using K nearest neighbors) 
% AUTHOR: Kai-Xuan Chen, 
% DATE: 2020.04.21

clear;
clc;

load('sphere.mat');
k_nn = 20;          % num of k neighbor
type = 'local';     % 'local' or 'global'
label = label + 1;  % Index starts at 1
num_class = numel(unique(label));
dim_cell = cell(1,num_class);
for label_th = 1:num_class
    ind_data = find(label == label_th);
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
    dim_cell{1,label_th}.dim_tanBundle = dim_tanBundle;
    dim_cell{1,label_th}.dim_tanSpaceMatrix = dim_tanSpaceMatrix;
    dim_cell{1,label_th}.dim_max = dim_max;
    dim_cell{1,label_th}.dim_min = dim_min;
    fprintf('- - - - - - - - - - - - - - - - - - - - - - - \n');
    fprintf('k-nn: %d,tangent bundle dimension of label-%d data: %d.\n',k_nn,label_th,dim_tanBundle);
    fprintf('k-nn: %d,max & min dimension of label-%d data: %d, %d .\n',k_nn,label_th,dim_max,dim_min);
end



