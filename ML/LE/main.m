%DATE: 2020.04.22
clear;
clc;

N=3000;
K=15; d=2; sigma=0.5;
point_size = 5;

% GENERATE THE SWISSROLL
tt = (3*pi/2)*(1+2*rand(1,N));   
height = 20*rand(1,N);
swissRoll = [(tt).*cos(tt); height; (tt).*sin(tt)];

% SHOW THE PICTURE
subplot(1,2,1); cla;
scatter3(swissRoll(1,:),swissRoll(2,:),swissRoll(3,:),point_size,tt,'filled');
view([12 20]);
grid off; axis off; hold on;

% RUN LE ALGORITHM
Y=laplacian_eigenMap(swissRoll,K,d);
subplot(1,2,2); cla;
scatter(Y(1,:),Y(2,:),point_size,tt,'+');
title('LaplacianEigenMap');
grid off; axis off; hold on;

