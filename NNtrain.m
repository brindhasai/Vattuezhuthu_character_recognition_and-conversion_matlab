% Solve a Pattern Recognition Problem with a Neural Network
% Script generated by Neural Pattern Recognition app
% Created 29-May-2018 00:24:52
%
% This script assumes these variables are defined:
%
%   input - input data.
%   targetdata - target data.

rng('default');

load('input.mat');
load('targetdata1.mat');

x = input';
t = targetdata1';

% Choose a Training Function
% For a list of all training functions type: help nntrain
% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. Suitable in low memory situations.
trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation.

% Create a Pattern Recognition Network
hiddenLayerSize = 10;
net = patternnet(hiddenLayerSize, trainFcn);

% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Train the Network
[net,tr] = train(net,x,t);
view(net)
% Test the Network
y = net(x);
e = gsubtract(t,y);
performance = perform(net,t,y);
disp(['performance' num2str(performance)]);
tind = vec2ind(t);
yind = vec2ind(y);
percentErrors = sum(tind ~= yind)/numel(tind);
disp(['percenterror' num2str(percentErrors)]);

% View the Network
view(net)
MSE=mse(y-t);
disp(['MSE' num2str(MSE)]);
NMSE = MSE / mse(t-mean(t));
disp(['NMSE' num2str(NMSE)]);

% Plots
% Uncomment these lines to enable various plots.
% figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, ploterrhist(e)
figure, plotconfusion(t,y)
h=zoom;
h.Enable = 'on';
%figure, plotroc(t,y)

disp('after training')
y1 = sim(net,x);
y1=abs(y1);
y1=round(y1);

save   net net;
