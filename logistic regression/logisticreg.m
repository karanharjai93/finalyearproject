
%%  Logistic Regression

clear ; close all; clc

%% Load Data
load('datasetA.mat');
X = A(:, [1:30]); y = A(:,31);
X = featureNormalize(X);
%% =========== Part 1: Regularized Logistic Regression ============
 [m, n] = size(X);
X = [ones(m, 1) X];
% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);
% Set regularization parameter lambda to 1
lambda = 1;
% Compute and display initial cost and gradient for regularized logistic
% regression
[cost, grad] = costFunctionReg(initial_theta, X, y, lambda);

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Expected cost (approx): 0.693\n');


%% ============= Part 2: Regularization and Accuracies =============



% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);

% Set regularization parameter lambda to 1 (you should vary this)
lambda = 5;
tic

% Set Options
options = optimset('GradObj', 'off', 'MaxIter', 75);

% Optimize
[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);
toc


% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);

parameters(p,y);


        
