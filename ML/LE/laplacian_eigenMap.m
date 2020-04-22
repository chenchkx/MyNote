% LAPLACIAN EIGENMAPS 
% REWIRITTED BY Kai-Xuan
% DATE:2020.04.22
%% 
% Please refer to the paper (more theoretical and technical details):
% Belkin M, Niyogi P. 
% Laplacian eigenmaps and spectral techniques for embedding and clustering[C]
% Advances in neural information processing systems. 2002: 585-591.



function out_matrix = laplacian_eigenMap(X,k_nbor,d,sigma)

    if ~exist('k_nbor', 'var')
        k_nbor = 12;
    end
    if ~exist('d', 'var')
        d = 2;
    end   
	if ~exist('sigma', 'var')
		sigma = 1;
    end

    [~,num] = size(X);
    dis_matrix = squareform(pdist(X', 'euclidean'));
    [~,ind_dis] = sort(dis_matrix,1);
    for i_th = 1:num
        dis_matrix(ind_dis(k_nbor+2:end,i_th), i_th) = 0;
    end
    dis_matrix = max(dis_matrix, dis_matrix');   % Make sure distance matrix is symmetric
    dis_matrix = dis_matrix.^2;
	dis_matrix = dis_matrix ./ max(max(dis_matrix));
    
    % Compute Weights(W) using Gaussian Kernel(heat kernel-based weights).
    dis_matrix(dis_matrix ~= 0) = exp(-dis_matrix(dis_matrix ~= 0) / (2 * sigma ^ 2));
    W = dis_matrix;
    
    % Construct Diagonal Weight Matrix
    D = diag(sum(dis_matrix, 2));
    
    % Compute Laplacian Matrix
    L = D - W;
    L(isnan(L)) = 0; D(isnan(D)) = 0;
    L(isinf(L)) = 0; D(isinf(D)) = 0;
    
    % Construct Eigenmaps (solve Ly = labda*Dy)   
    tol = 0; 
    options.disp = 0;
    options.isreal = 1;
    options.issym = 1;
    [eig_vectors, eig_values] = eigs(L, D, d+1, tol, options); % only need bottom (no_dims + 1) eigenvectors

    % Sort eigenvectors in ascending order
    eig_values = diag(eig_values);
    [~, ind_eig] = sort(eig_values, 'ascend');
    
    % CALCULATION OF EMBEDDING
    out_matrix = eig_vectors(:,ind_eig(2:d + 1))';
      
end