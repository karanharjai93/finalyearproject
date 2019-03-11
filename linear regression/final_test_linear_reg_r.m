% List out the category values in use.

load('datasetA.mat');
categories = [0];
X = A(:, (2:10)); y = A(:,1);
X = featureNormalize(X);
X1 = [ones(size(A,1), 1) X];

% Get the number of vectors belonging to each category.
vecsPerCat = getVecsPerCat(X1, y, categories);

% Compute the fold sizes for each category.
foldSizes = computeFoldSizes(vecsPerCat, 10);

% Randomly sort the vectors in X, then organize them by category.
[X_sorted, y_sorted] = randSortAndGroup(X1, y, categories);

Mean_Absolute_Errorl=zeros(10,1);Mean_Squared_Errorl=zeros(10,1);
Root_Mean_Squared_Errorl=zeros(10,1);
% For each round of cross-validation...
for (roundNumber = 1 : 10)

% Select the vectors to use for training and cross validation.
[X_train, y_train, X_val, y_val] = getFoldVectors(X_sorted, y_sorted, categories, vecsPerCat, foldSizes, roundNumber);

% Train the classifier on the training set, X_train y_train
% .....................


%% =========== Part 1: Initialization ============
 %[m, n] = size(X_train);
%X_train1 = [ones(m, 1) X_train];

%% ============= Part 2: Regularization and Accuracies =============




lambda = 0;
% Choose some alpha value
alpha = 0.1;
num_iters = 10000;

theta = zeros(size(X_train,2), 1);
%% ================ Part 2: Gradient Descent ================
[theta] = gradientDescentMulti2(X_train, y_train, theta, alpha, num_iters,lambda);


% Measure the classification accuracy on the validation set.
% .....................

% Compute accuracy on our training set
radius=zeros(size(X_val,1),1);
for i=1:size(X_val,1)
    radius(i,1) = X_val(i,:) * theta; %expected 
end

error = abs(radius-y_val);
Mean_Absolute_Errorl(roundNumber,1)= mean(error);
Mean_Squared_Errorl(roundNumber,1) = mean(error.^2);
Root_Mean_Squared_Errorl(roundNumber,1) = sqrt(mean(error.^2));




end
fprintf(' Mean_Absolute_Error: %f\n',mean(Mean_Absolute_Errorl) );
fprintf(' Mean_Squared_Error: %f\n',mean(Mean_Squared_Errorl) );
fprintf(' Root_Mean_Squared_Error: %f\n', mean(Root_Mean_Squared_Errorl));
