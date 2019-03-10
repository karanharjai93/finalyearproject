% computing comparison parameters
function [Accuracy,Precision,Sensitivity,Specificity,F1_Score]=parameters(p,y)


%computing confusion matrix
%computing TP and TN
TP=0;TN=0;FP=0;FN=0;
m = length(y);
for i=1:m
    if (p(i) == y(i)) && ((p(i)==1) &&  y(i)==1)  
        TP =TP +1;
    end
    if (p(i) == y(i)) && ((p(i)==0) &&  y(i)==0)  
        TN =TN +1;
    end
    if (p(i) ~= y(i)) && ((p(i)==0) &&  y(i)==1)  
        FN =FN +1;
    end
    if (p(i) ~= y(i)) && ((p(i)==1) &&  y(i)==0)  
        FP =FP +1;
    end
end
% fprintf('True positive =  %f \n', TP);
% fprintf('True negative =  %f \n', TN);
% fprintf('False positive =  %f \n', FP);
% fprintf('False negative =  %f \n', FN);
    
Accuracy =(TP+TN)/(TP+TN+FN+FP);
%fprintf(' Accuracy: %f\n',Accuracy );
Precision = (TP)/(TP+FP);
%fprintf(' Precision: %f\n',Precision );
Sensitivity = (TP)/(TP+FN);
%fprintf(' Sensitivity: %f\n', Sensitivity);
Specificity = (TN)/(TN+FP);
%fprintf(' Specificity: %f\n',Specificity );
F1_Score = 2 * Precision * Sensitivity / (Precision + Sensitivity) ;
%fprintf(' F1 Score: %f\n',F1_Score );

end


