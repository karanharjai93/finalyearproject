
%%  Logistic Regression with Batch gradient descent

clear ; close all; clc

%% Load Data
load('datasetA.mat');
X = A(:, [1:30]); y = A(:,31);
X = featureNormalize(X);
%% =========== Part 1: Initialization ============
 [m, n] = size(X);
X = [ones(m, 1) X];

%% ============= Part 2: Regularization and Accuracies =============



% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda to 1 (you should vary this)
 lambda = 0.01;
% fprintf('Running gradient descent ...\n');

% % Choose some alpha value
 alpha = 0.01;
 num_iters = 1900;
% 
% %  Run Gradient Descent 
% 
tic
 [theta] = gradientDescentMulti1(X, y, initial_theta, alpha, num_iters,lambda);
 toc
% 



% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);

parameters(p,y);


        
