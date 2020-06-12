%% An implementation of Singular Value Decomposition Algorithm in matlab
% Written by Kai-Xuan Chen, (e-mail: kaixuan_chen_jsh@163.com)
% 
% If you find this code useful for your research, we appreciate it very much if you can cite our related works:
% https://github.com/Kai-Xuan/AidCovDs/  
% BibTex : 
% ```
% @inproceedings{chen2018riemannian,
%   title={Riemannian kernel based Nystr{\"o}m method for approximate infinite-dimensional covariance descriptors with application to image set classification},
%   author={Chen, Kai-Xuan and Wu, Xiao-Jun and Wang, Rui and Kittler, Josef},
%   booktitle={2018 24th International Conference on Pattern Recognition (ICPR)},
%   pages={651--656},
%   year={2018},
%   organization={IEEE}
% }
% ```
% 
% output:
%      U: left Singular Vectors 
%      S: Singular Values 
%      V: right Singular Vectors   


function [U, S, V] = compute_svd(X)

%   here , we call the X as a fine data matrix for SVD when size(X,1) >= size(X,2)
%   we can get the complete right Singular Vectors while X is fine   

    if size(X,1) >= size(X,2)
        [tempU,tempS,tempV] = compute_fineSVD(X);
        U = tempU; S = tempS; V = tempV;    
    else
        [tempU,tempS,tempV] = compute_fineSVD(X');
        U = tempV; S = tempS'; V = tempU;
    end

end


function [U,S,V] = compute_fineSVD(X)

    min_dim = min(size(X,2),size(X,2));
    data_sysMatrix = X*X';
    data_sysMatrix = max(data_sysMatrix, data_sysMatrix');
    if issparse(data_sysMatrix)
        data_sysMatrix = full(data_sysMatrix);
    end
%   compute the left Singular Vectors   
    [U, eig_value] = eig(data_sysMatrix);
    eig_value = diag(eig_value);
    [eig_value, index] = sort(eig_value,'descend');
    U = U(:, index);
    
 %  compute the Singular Values   
    eig_value = eig_value(1:min_dim);
    eigValue_square = eig_value.^(0.5);
    S = zeros(size(X));
    S(1:min_dim,1:min_dim) = diag(eigValue_square);
    
%   compute the right Singular Vectors   
    eigValue_minusSquare = diag(S).^(-1);
    S_minusSquare = zeros(size(X));
    S_minusSquare(1:min_dim,1:min_dim) = diag(eigValue_minusSquare);
    V = X'*(U*S_minusSquare);
    
end