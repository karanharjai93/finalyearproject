function [w b]= HebbNN(x)

% Hebb Learning Rule for Neural Networks
% input x(m,n): x1,x2,b,output
% m is the number of training samples
% n-1 is the number of inputs
% x(i,n) is the target
% Example of and logic:
% x=[-1 -1 -1; -1 1 -1; 1 -1 -1; 1 1 1];
% it will produce% w=[2 2] b=-2
% now if we input x1 and x2 it should output the correct result
% R=([x1 x2]*w' +b)>=2

clc

%initialization of weights
m=size(x,1)% number of training samples (rows)
n=size(x,2)   % number of neurons
%disp('==============================')
w=zeros(1,n-2) ;
b=0;    
    for i=1:m        
        for j=1:n-2 
            %disp(['       i= ' num2str(i) '  j='  num2str(j)])
            %update the weights of this row
            w(j)=w(j)+x(i,j).*x(i,n);                             
        end      
        b=b+x(i,n);            
        %disp(['w,b =  ' num2str(w) '   '  num2str(b)])
    end   
    %disp('==============================')
 