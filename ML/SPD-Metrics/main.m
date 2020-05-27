%% The code of four metrics (AIRM, LEM, Stein&Jeffrey divergence) for computing  geodesic distance on the Symmetric Positive Definite(SPD) manifold.  
% Written by Kai-Xuan Chen (e-mail: kaixuan_chen_jsh@163.com)  
% If you find any bugs, please contact me. Also, you can find more applications at:  
% https://github.com/Kai-Xuan/RiemannianCovDs  
% https://github.com/Kai-Xuan/iCovDs  

clear;  
clc;
feature_matrix1 = rand(3,100);
feature_matrix2 = rand(3,100);
spd_matrix1 = cov(feature_matrix1');    
spd_matrix2 = cov(feature_matrix2');


%% distance while using AIRM
dis_AIRM = compute_distance(spd_matrix1,spd_matrix2,'A');

%% distance while using Stein
dis_Stein = compute_distance(spd_matrix1,spd_matrix2,'S');

%% distance while using Jeffrey
dis_Jeff = compute_distance(spd_matrix1,spd_matrix2,'J');

%% distance while using LogED
dis_LogED = compute_distance(spd_matrix1,spd_matrix2,'L');


%% If you find this code useful for your research, maybe you can cite the following paper:
%{
    @article{chen2020covariance,
      title={Covariance Descriptors on a Gaussian Manifold and their Application to Image Set Classification},
      author={Chen, Kai-Xuan and Ren, Jie-Yi and Wu, Xiao-Jun and Kittler, Josef},
      journal={Pattern Recognition},
      pages={107463},
      year={2020},
      publisher={Elsevier}
    }

    @inproceedings{chen2019more,
      title={More About Covariance Descriptors for Image Set Coding: Log-Euclidean Framework based Kernel Matrix Representation},
      author={Chen, Kai-Xuan and Wu, Xiao-Jun and Ren, Jie-Yi and Wang, Rui and Kittler, Josef},
      booktitle={Proceedings of the IEEE International Conference on Computer Vision Workshops},
      pages={0--0},
      year={2019}
    }
%}

                            
                            
