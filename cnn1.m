% % Load the training data into memory
% [traindata,traindata1] = digitTrainCellArrayData;
% 
% % Display some of the training images
%  clf
%  for i = 1:5
%      subplot(4,5,i);
%      imshow(traindata{i});
%  end

rng('default')

load('input.mat');
load('targetdata.mat');

x = input';
t = targetdata';

hiddenSize1 = 96;
autoenc1 = trainAutoencoder(x,hiddenSize1, ...
    'MaxEpochs',400, ...
    'L2WeightRegularization',0.004, ...
    'SparsityRegularization',4, ...
    'SparsityProportion',0.15, ...
    'ScaleData', false);
% 
% view(autoenc1)
% 
% figure()
% plotWeights(autoenc1);

f1 = encode(autoenc1,x);

hiddenSize2 = 56;
autoenc2 = trainAutoencoder(f1,hiddenSize2, ...
    'MaxEpochs',100, ...
    'L2WeightRegularization',0.002, ...
    'SparsityRegularization',4, ...
    'SparsityProportion',0.1, ...
    'ScaleData', false);

% view(autoenc2)
f2 = encode(autoenc2,f1);

hiddenSize3 = 26;
autoenc3 = trainAutoencoder(f2,hiddenSize3, ...
    'MaxEpochs',100, ...
    'L2WeightRegularization',0.002, ...
    'SparsityRegularization',4, ...
    'SparsityProportion',0.1, ...
    'ScaleData', false);

% view(autoenc2)
f3 = encode(autoenc3,f2);

softnet = trainSoftmaxLayer(f3,t,'MaxEpochs',100);

deepnet = stack(autoenc1,autoenc2,autoenc3,softnet);

view(deepnet)

save('deepnet.mat','deepnet')
% Test the Network
% 
a=deepnet(x);
errors = gsubtract(t,a);
%disp(['cnnerror' num2str(errors)]);
performance = perform(deepnet,t,a);
disp(['performance' num2str(performance)]);
% 
figure, plotconfusion(t,a);
%plotconfusion(testdata1,y);