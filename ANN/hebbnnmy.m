function [w,b,R,RX]=hebbnnmy(A)
% By karan harjai 1512079
% Hebb Learning Rule for Neural Networks
% input A(m,n): A1,A2,...An,output
%R is result vector without activation applied
%RX is result vector with activation applied
m=size(A,1);
n=size(A,2);
w=zeros(1,n-1);
b=0;
for i=1:m
    for j=1:n-1
        w(j)=w(j)+A(i,j).*A(i,n);
    end
    b=b+A(i,n);
end
R=A(:,[1:n-1])*w'+b ;
th=mean(R);
RX=R>=th;
accuracy= mean(double(RX==A(:,n)) * 100) 
%uiimport
%data1 = movevars(data1, 'symmetry_mean', 'After', 'VarName32');
%A = table2array(data1(:,2:32));
%R=A[:,[1:30]]*w'+b ;
%th=mean(R);
%RX=R>=th;
%accuracy= mean(double(RX==A(:,31)) * 100) ;
