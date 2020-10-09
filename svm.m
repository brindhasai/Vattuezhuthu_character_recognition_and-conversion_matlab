[traindata,traindata1] = gendatcb(500,0.5, -pi/3);

% gscatter(traindata(:,1),traindata(:,2),traindata1,'rg', '+*');
% axis equal
% axis square

figure
svmstruct=svmtrain(traindata,traindata1,'ShowPlot',true);
axis equal
axis square
title('Linear SVM')

figure  
svmstruct=svmtrain(traindata,traindata1,'ShowPlot',true,...
        'kernel_function','rbf','rbf_sigma',2^-3);
axis equal
axis square
title(['Nonliner SVM(RBF, k = ',num2str(-3),')'])
    
[testdata,testdata1] = gendatcb(50,0.5,-pi/3);
class=svmclassify(svmstruct,testdata);