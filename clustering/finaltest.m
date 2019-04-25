load('sheet1.mat')
X=Parameters(:,2:3);
X=table2array(X);
[c1, c2] = kmeans(X);
load('sheet2.mat')
X=ParametersS1(:,2:3);
X=table2array(X);
[c3, c4] = kmeans(X);
load('sheet3.mat')
X=ParametersS2(:,2:3);
X=table2array(X);
[c5, c6] = kmeans(X);