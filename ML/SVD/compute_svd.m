%% Singular Value Decomposition Algorithm
% Written by Kai-Xuan Chen, (e-mail: kaixuan_chen_jsh@163.com)

% If you find this code useful for your research, we appreciate it very much if you can cite our related works:
% 
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

function [U, S, V] = compute_svd(X)

    [U,S] = compute_leftSvd(X);
    
    if nargout >= 3
        [V,~] = compute_leftSvd(X');
        
%%       you can also use the following code the compute the approximation of right svd
%         eigValue_squareMinus = diag(S).^(-1);
%         S_squareMinus = zeros(size(X));
%         S_squareMinus(1:length(eigValue_squareMinus),1:length(eigValue_squareMinus)) = diag(eigValue_squareMinus);
%         V = X'*(U*S_squareMinus);
    end
end


function [U,S] = compute_leftSvd(X)

    data_sysMatrix = X*X';
    data_sysMatrix = max(data_sysMatrix, data_sysMatrix');
    if issparse(data_sysMatrix)
        data_sysMatrix = full(data_sysMatrix);
    end
    [U, eig_value] = eig(data_sysMatrix);
    eig_value = diag(eig_value);
    [eig_value, index] = sort(eig_value,'descend');
    U = U(:, index);
    
    maxEigValue = max(abs(eig_value));
    eigIdx = find(abs(eig_value)/maxEigValue < 1e-10);
    eig_value(eigIdx) = 0;
    num_nonZeroEigValue = length(find(eig_value~=0));
  
    eigValue_square = eig_value.^(0.5);
    S = zeros(size(X));
    S(1:num_nonZeroEigValue,1:num_nonZeroEigValue) = diag(eigValue_square(1:num_nonZeroEigValue));
    
end