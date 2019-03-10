function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

% You need to set these values correctly
X_norm = X;
mu = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

col_dim = size(X,2);

mu = mean(X);

sigma = std(X);

for i = 1:size(X,2)
  X_norm(:,i) = (X(:,i)-mu(1,i))./sigma(1,i) ;
  
end
  
  
%Xi = [X(:,1)-mu(1,1)  X(:,2)-mu(1,2) ] ;
%X_norm = [Xi(:,1)./sigma(1,1)  Xi(:,2)./sigma(1,2) ] ;











end
