function [w,b]=hebbnnmy(x)
% By karan harjai 1512079
% Hebb Learning Rule for Neural Networks
% input x(m,n): x1,x2,b,output
m=size(x,1);
n=size(x,2);
w=zeros(1,n-2);
b=0;
for i=1:m
    for j=1:n-2
        w(j)=w(j)+x(i,j).*x(i,n);
    end
    b=b+x(i,n);
end
