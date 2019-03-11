% Linear regression with multiple variables
%

clear ; close all; clc

%% Load Data
load('datasetA.mat');
X = A(:, (2:10)); y = A(:,1);
X = featureNormalize(X);
%% =========== Part 1: Initialization ============
 [m, n] = size(X);
X = [ones(m, 1) X];

lambda = 0;
% Choose some alpha value
alpha = 0.1;
num_iters = 10000;

theta = zeros(size(X,2), 1);
%% ================ Part 2: Gradient Descent ================
[theta] = gradientDescentMulti2(X, y, theta, alpha, num_iters,lambda);

%%=======part 3:Testing=======
radius=zeros(size(X,1),1);
for i=1:size(X,1)
    radius(i,1) = X(i,:) * theta; %expected 
end

error = abs(radius-y);
Mean_Absolute_Error= mean(error)
Mean_Squared_Error = mean(error.^2)
Root_Mean_Squared_Error = sqrt(mean(error.^2))


