%%  computing means via four metrics (AIRM, LEM, Stein&Jeffrey divergence) on the Symmetric Positive Definite(SPD) manifold. 
% Rewritten by Kai-Xuan Chen (e-mail: kaixuan_chen_jsh@163.com),If you find any bugs, please contact me.
% Also, you can find more applications at: https://github.com/Kai-Xuan/RiemannianCovDs/   
 

clear;  
clc;
% generate SPD matrices
for i =1:50
    feature_matrix = rand(15,100);
    cov_matrix = cov(feature_matrix');  
    spd_matrices(:,:,i) = cov_matrix + 0.001*trace(cov_matrix)*eye(size(cov_matrix));
end


%% computing mean via AIRM
mean_center_A = compute_means(spd_matrices, 'A');

%% computing mean via Stein
mean_center_S = compute_means(spd_matrices, 'S');

%% computing mean via Jeffrey
mean_center_J = compute_means(spd_matrices, 'J');

%% computing mean via LogED
mean_center_L = compute_means(spd_matrices, 'L');




                            
                            
