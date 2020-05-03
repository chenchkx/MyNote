% TEST ALGORITHM IN 'Grouping and dimensionality reduction by locally linear embedding'
% REWRITEED BY Kai-Xuan Chen, 
% DATE: 2020.05.03


clear;
clc;

n = 3000;
k=15; d=2; 
point_size = 5;

angle = (3*pi/2)*(1+2*rand(1,n));   
height = 20*rand(1,n);
ind1 = find(angle <= 10.5 & angle >8.5);
ind2 = find(angle <= 13.5 & angle >11.5);
angle1 = angle(ind1); height1 = height(ind1);
angles2 = angle(ind2); height2 = height(ind2);

an1 = angle;
he1 = height;
an2 = [angle1,angles2];
he2 = [height1,height2];
swiss1 = [(an1).*cos(an1); he1; (an1).*sin(an1)];
swiss2 = [(an2).*cos(an2); he2; (an2).*sin(an2)];

%% SHOW THE PICTURE, Swiss is k-connected
subplot(2,4,1);cla;
scatter3(swiss1(1,:),swiss1(2,:),swiss1(3,:),point_size, an1,'filled');
view([12 20]);
grid off; axis off; hold on;
% SHOW THE PICTURE PROCESSED BY LLE
[Y1, M1] = algorithm_lle(swiss1,k,2);
subplot(2,4,2);cla;
scatter(Y1(1,:),Y1(2,:),point_size, an1, '+');
title('LLE');
grid off; axis off; hold on;
% SHOW THE PICTURE OF EIGENVALUES
[V1,D1] = eigs(M1,size(M1,1));
[D1,indD1] = sort(diag(D1),'ascend');
V1 = V1(:,indD1);
subplot(2,4,3);cla;
scatter([1:20],log10(D1(1:20)),point_size, '+');
title('eigValues');
grid off; axis off; hold on;
% SHOW THE PICTURE PROCESSED BY GROUPING & DR BY LLE
Y1 = gen_drsample(V1(:,1), V1(:,2:3));
subplot(2,4,4);cla;
scatter(an1,Y1(1,:),point_size, an1, '+');
title('GDR');
grid off; axis off; hold on;

%% SHOW THE PICTURE, Swiss Has 2 k-connected Components
subplot(2,4,5);cla;
scatter3(swiss2(1,:),swiss2(2,:),swiss2(3,:),point_size, an2,'filled');
view([12 20]);
grid off; axis off; hold on;
% SHOW THE PICTURE PROCESSED BY LLE
[Y2, M2] = algorithm_lle(swiss2,k,2);
subplot(2,4,6);cla;
scatter(Y2(1,:),Y2(2,:),point_size, an2, '+');
title('LLE');
grid off; axis off; hold on;
% SHOW THE PICTURE OF EIGENVALUES
[V2,D2] = eigs(M2,size(M2,1));
[D2,indD2] = sort(diag(D2),'ascend');
V2 = V2(:,indD2);
subplot(2,4,7);cla;
scatter([1:100],log10(D2(1:100)),point_size, '+');
title('eigValues');
grid off; axis off; hold on;
% SHOW THE PICTURE PROCESSED BY GROUPING & DR BY LLE
Y2 = gen_drsample(V2(:,1:2), V2(:,3:6));
subplot(2,4,8);cla;
scatter(Y2(1,:),Y2(2,:),point_size, an2, '+');
title('GDR');
grid off; axis off; hold on;

