function [theta] = gradientDescentMulti1(X, y, theta, alpha, num_iters,lambda)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
% J_history = zeros(num_iters, 1);


for iter = 1:num_iters
h = X*theta; 
   
  squ = (sigmoid(h)-y);
  %sum = X'*squ;
  theta(1,1) = theta(1,1) -((alpha/m) * (X(:,1)' * squ));
  
  theta((2:31),1)  = theta((2:31),1) - ((alpha/m) * ((X(:,2:31)' * squ)+lambda*theta((2:31),1))); 

    %J_history(iter) = computeCostMulti1(X, y, theta);

end


end
