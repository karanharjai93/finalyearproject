function [w,b,epoch,R,RX]=perceptronmy(A)
% By karan harjai 1512079
% Perceptron learning rule
% input A(m,n): A1,A2,...,An,output.
%R is result vector without activation applied
%RX is result vector with activation applied
m=size(A,1);
n=size(A,2);
w=zeros(1,n-1);
b=0;

%flag=0;
epoch=0;
while  epoch~=100 
    %flag=0;
    for i=1:m
        y=A(i,(1:n-1))*w' + b ;
        %activation function
        yin=y>=7.1162e+08;
        
        %end of activation function
        %yin=activationfunc(y);
        %flag=flag+1;
        if yin~=A(i,n)
            for j=1:n-1
                w(j)=w(j)+A(i,j)*A(i,n);
            end
            b=b+A(i,n);
            %flag=0;
        end
        if i==m
           epoch=epoch+1;
        end
    end
end
R=A(:,[1:n-1])*w'+b ;
th=mean(R)
RX=R>=th;
accuracy = mean(double(RX==A(:,n)) * 100) 
end





% if y>thetha
%             yin=1;
%         elseif (y>=-thetha) && (y<=thetha)
%             yin=0;
%         else
%             yin=-1;
%         end
        
        

% flag=0;
% epoch=0;
% while  flag~=m 
%     flag=0;
%     for i=1:m
%         R=A(i,(1:n-1))*w' + b ;
%         %activation function
%         RX=R>=4.0781e+08;
%         
%         %end of activation function
%         %yin=activationfunc(y);
%         flag=flag+1;
%         if RX~=A(i,n)
%             for j=1:n-1
%                 w(j)=w(j)+A(i,j)*A(i,n);
%             end
%             b=b+A(i,n);
%             flag=0;
%         end
%         if i==m
%            epoch=epoch+1;
%         end
%     end
% end
% accuracy= mean(double(RX==A(:,n)) * 100) 
% end

           
           
        



    