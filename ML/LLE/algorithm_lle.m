% LLE ALGORITHM, AUTHORS' SOURCE CODE IS AVAILABLE AT: https://www.cs.nyu.edu/~roweis/lle/code.html
% REWRITEED BY Kai-Xuan Chen, 
% DATE: 2020.04.18
%
% [Y] = algorithm_lle(X,k_nbor,dim_embedding)
%
% X:              input data as D x N matrix (D = dimensionality, N = #points)
% k_nbor:         number of neighbors
% dim_embedding:  max embedding dimensionality
% Y:              embedding matrix

function [Y] = algorithm_lle(X,k_nbor,dim_embedding)

    [dim, num] = size(X);
    w_matrix = zeros(k_nbor,num);
    if k_nbor>dim
        lamda = 1e-3;
    else
        lamda = 0;
    end
    tmp_X = sum(X.^2,1);
    dis_matrix = repmat(tmp_X,num,1) + repmat(tmp_X',1,num) - 2*X'*X;

    % calculating w_matrix£º coefficient matrix
    [~,ind_sorted] = sort(dis_matrix);
    ind_neighbor = ind_sorted(2:k_nbor+1,:);
    for i_th = 1:num
        i_sample= X(:,i_th);
        i_neighbor = X(:,ind_neighbor(:,i_th));
        z = i_neighbor - repmat(i_sample,1,k_nbor);
        z = z'*z;
        z = z + lamda*trace(z)*eye(size(z));
        w_i = z^(-1)*ones(k_nbor,1);
        w_matrix(:,i_th) = w_i/sum(w_i);
    end
    % M = (I-W)(I-W)', here W = w_matrix,  please note their( W & M) dimensions.
    M = sparse(1:num,1:num,ones(1,num),num,num,4*k_nbor*num);
    for i_th = 1:num
        i_neighbor_ind = ind_neighbor(:,i_th);
        M(i_neighbor_ind,i_th) = M(i_neighbor_ind,i_th) - w_matrix(:,i_th);
    end
    M = M*M';
    % CALCULATION OF EMBEDDING
    options.disp = 0; options.isreal = 1; options.issym = 1; 
    [Y,~] = eigs(M,dim_embedding+1,0,options);
    Y = Y(:,2:dim_embedding+1)'*sqrt(num); % bottom evect is [1,1,1,1...] with eval 0
 
end