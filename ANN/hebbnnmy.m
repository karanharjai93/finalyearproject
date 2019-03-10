%%HEBBS 

%function [w,b,R,RX]=hebbnnmy(A)
% By karan harjai 1512079
% Hebb Learning Rule for Neural Networks
% input A(m,n): A1,A2,...An,output
%R is result vector without activation applied
%RX is result vector with activation applied
load('datasetA.mat');
X = A(:, [1:30]); y = A(:,31);
X = featureNormalize(A);
%X = [ones(m, 1) X];


m=size(X,1);
n=size(X,2);
w=zeros(1,n);
b=0;
tic
for i=1:m
    for j=1:n
        w(j)=w(j)+X(i,j)*y(i,1);
    end
    b=b+y(i,1);
end
toc
R=X*w'+b ;
th=mean(R);
RX=R>=th;
accuracy = mean(double(RX==y) * 100) 
parameters(RX,y);






%uiimport
%data1 = movevars(data1, 'symmetry_mean', 'After', 'VarName32');
%A = table2array(data1(:,2:32));
%R=A[:,[1:30]]*w'+b ;
%th=mean(R);
%RX=R>=th;
%accuracy= mean(double(RX==A(:,31)) * 100) ;
