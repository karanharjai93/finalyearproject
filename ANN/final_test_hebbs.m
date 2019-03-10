% List out the category values in use.
categories = [0; 1];
load('datasetA.mat');
X = A(:, [1:30]); y = A(:,31);
X = featureNormalize(A);
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


m=size(X_train,1);
n=size(X_train,2);
w=zeros(1,n);
b=0;
tic
for i=1:m
    for j=1:n
        w(j)=w(j)+X_train(i,j)*y_train(i,1);
    end
    b=b+y_train(i,1);
end
toc
% Compute accuracy on our training set
R=X_val*w'+b ;
th=mean(R);
RX=R>=th;
%RX= round(sigmoid(R));
train_accuracy = mean(double(RX==y_val) * 100) 

[Accuracyl(roundNumber,1),Precisionl(roundNumber,1),Sensitivityl(roundNumber,1),Specificityl(roundNumber,1),F1_Scorel(roundNumber,1)]=parameters(RX,y_val);

end
fprintf(' Accuracy: %f\n',mean(Accuracyl) );
fprintf(' Precision: %f\n',mean(Precisionl) );
fprintf(' Sensitivity: %f\n', mean(Sensitivityl));
fprintf(' Specificity: %f\n',mean(Specificityl) );
fprintf(' F1 Score: %f\n',mean(F1_Scorel) );