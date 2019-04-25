function [c1, c2] = kmeans(X)
[m,n]=size(X);
c1=zeros(m,1);
c2=zeros(m,1);

cen1=X(1,:);
cen2=X(2,:);
h=1;
j=1;

for (i=1:m)
    m1 = sqrt((X(i,1)-cen1(1,1))^2 + (X(i,2) - cen1(1,2))^2);
    m2 = sqrt((X(i,1)-cen2(1,1))^2 + (X(i,2) - cen2(1,2))^2);
    
    if (m1<=m2)
        cen1(1,1) = (cen1(1,1)+X(i,1))/2;
        cen1(1,2) = (cen1(1,2)+X(i,2))/2;
        c1(h,1)=i;
        h=h+1;
    else
        cen2(1,1) = (cen2(1,1)+X(i,1))/2;
        cen2(1,2) = (cen2(1,2)+X(i,2))/2;
        c2(j,1)=i;
        j=j+1;
        
    end
end

    


end
