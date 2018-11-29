function [w,b,epoch]=perceptronmy(x,thetha)
% By karan harjai 1512079
% Perceptron learning rule
% input x(m,n): x1,x2,b,output and thetha.
m=size(x,1);
n=size(x,2);
w=zeros(1,n-2);
b=0;

flag=0;
epoch=0;
while  flag~=m 
    flag=0;
    for i=1:m
        y=x(i,(1:n-2))*w' + b ;
        %activation function
        if y>thetha
            yin=1;
        elseif (y>=-thetha) && (y<=thetha)
            yin=0;
        else
            yin=-1;
        end
        %end of activation function
        %yin=activationfunc(y);
        flag=flag+1;
        if yin~=x(i,n)
            for j=1:n-2
                w(j)=w(j)+x(i,j)*x(i,n);
            end
            b=b+x(i,n);
            flag=0;
        end
        if i==m
           epoch=epoch+1;
        end
    end
end
end






        
        
           
           
        



    