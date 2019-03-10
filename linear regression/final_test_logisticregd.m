% List out the category values in use.
categories = [0; 1];
load('datasetA.mat');
X = A(:, [1:30]); y = A(:,31);
X = featureNormalize(X);
X1 = [ones(size(A,1), 1) X];

% Get the number of vectors belonging to each category.
vecsPerCat = getVecsPerCat(X1, y, categories);

% Compute the fold sizes for each category.
foldSizes = computeFoldSizes(vecsPerCat, 10);

% Randomly sort the vectors in X, then organize them by category.
[X_sorted, y_sorted] = randSortAndGroup(X1, y, categories);

Accuracyl=zeros(10,1);Precisionl=zeros(10,1);
Sensitivityl=zeros(10,1);Specificityl=zeros(10,1);
F1_Scorel=zeros(10,1);
% For each round of cross-validation...
for (roundNumber = 1 : 10)

% Select the vectors to use for training and cross validation.
[X_train, y_train, X_val, y_val] = getFoldVectors(X_sorted, y_sorted, categories, vecsPerCat, foldSizes, roundNumber);

% Train the classifier on the training set, X_train y_train
% .....................


%% =========== Part 1: Initialization ============
 [m, n] = size(X_train);
%X_train1 = [ones(m, 1) X_train];

%% ============= Part 2: Regularization and Accuracies =============



% Initialize fitting parameters
initial_theta = zeros(size(X_train, 2), 1);

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
 [theta] = gradientDescentMulti1(X_train, y_train, initial_theta, alpha, num_iters,lambda);
 toc
% 


% Measure the classification accuracy on the validation set.
% .....................

% Compute accuracy on our training set
p = predict(theta, X_val);

fprintf('Train Accuracy: %f\n', mean(double(p == y_val)) * 100);

[Accuracyl(roundNumber,1),Precisionl(roundNumber,1),Sensitivityl(roundNumber,1),Specificityl(roundNumber,1),F1_Scorel(roundNumber,1)]=parameters(p,y_val);

end
fprintf(' Accuracy: %f\n',mean(Accuracyl) );
fprintf(' Precision: %f\n',mean(Precisionl) );
fprintf(' Sensitivity: %f\n', mean(Sensitivityl));
fprintf(' Specificity: %f\n',mean(Specificityl) );
fprintf(' F1 Score: %f\n',mean(F1_Scorel) );