function varargout = Home(varargin)
% HOME MATLAB code for Home.fig
%      HOME, by itself, creates a new HOME or raises the existing
%      singleton*.
%
%      H = HOME returns the handle to a new HOME or the handle to
%      the existing singleton*.
%
%      HOME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOME.M with the given input arguments.
%
%      HOME('Property','Value',...) creates a new HOME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Home_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Home_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Home

% Last Modified by GUIDE v2.5 08-Oct-2016 07:12:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Home_OpeningFcn, ...
                   'gui_OutputFcn',  @Home_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Home is made visible.
function Home_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Home (see VARARGIN)

% Choose default command line output for Home
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Home wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Home_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = ...
     uigetfile({'*.jpg';'*.jpeg';'*.png';'*.*'},'Select Image File');
 I=strcat(pathname,filename); 

%  I = imread(I);
% assignin('base', 'image', I);
 imshow(I)

 axes(handles.axes1);
% set(handles.pushbutton3,'Enable','on')

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
confirm = questdlg('Do you want to exit?.','Exit Image','Yes','No','No');
switch confirm
    case 'Yes'
        close(gcf)
    case 'No'
        return
end


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% 
image = getimage;
% disp("GET image")
% disp(image)

%%%%%%%%%%%%%%%%%%BRINDHA%%%%%%%%%%%%%%%%%%%

%% Convert to gray scale
if size(image,3)==3 % RGB image
    image=rgb2gray(image);
    figure
    imshow(image)
    title('GRAY-SCALED IMAGE');
    warning('off', 'Images:initSize:adjustingMag');
end
H = fspecial('Gaussian',[5 5],1.76);
GaussF = imfilter(image,H);
figure,
imshow(GaussF);
title('GAUSSIAN SMOOTHING')
 % threshold = graythresh(GaussF);
 % figure
 imagen1 = ~imbinarize(GaussF,0.4);
 figure
 imshow(imagen1)
 title('BINARY IMAGE');
 %% Remove all object containing fewer than 300 pixels
 imagen2 = bwareaopen(imagen1,300);
 pause(1)
 %% Show image binary image
 figure
 imshow(~imagen2);
 title('INPUT IMAGE WITHOUT NOISE')
warning('off', 'Images:initSize:adjustingMag');
 crop = imcrop(imagen2);
 figure
 imshow(crop)
 title('ROI IMAGE')
 %smorphological operation
 Iedge = edge(crop,'log');
 figure
 imshow(~Iedge)
 title('EDGE DETECTION');
 %% Morphology
% * *Image Dilation*
se = strel('square',5);
Iedge2 = imdilate(Iedge, se); 
imageFill = imfill(Iedge2, 'holes');
%% using bitwise and operator and the given image can take the dilated image
imageFill = imageFill & Iedge;

svm
NNtrain
%cnn1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
lower = imageFill;

 while 1
    [upper lower] = line_separator(lower);
    upper1 = upper;
    [L Ne] = bwlabel(upper1);   

%    set(handles.text4, 'String',Ne);
    
    %%%%%%%%%%%%%%%%%% OUTPUT FORMATTING %%%%%%%%
    fi = fopen('output.html','w');
    fprintf(fi,"<html><head><script src='https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script><script>$(document).ready(function(){$('#convert').click(function(){var res = $('#res').children().text();$('#tamil_str').text(res);});});</script></head><body><div id='res'>");
    fclose(fi);
    for n=1:Ne
        [row,column] = find(L==n);
        n1=upper1(min(row):max(row),min(column):max(column));
        BW2 = bwmorph(n1,'thin',Inf);
        imrotate(BW2,0);
        z10=imresize(BW2,[50 50]);
        figure(9);
        imshow(~z10);
         z=feature_extract(z10);
        % z1 = hog_feature_vector(z);
         
         %n = 4; m = 4;          
        %disp(['Calculating Zernike moments ..., n = ' num2str(n) ', m = ' num2str(m)]);
        %p = logical(not(z10));
        %tic
        %[~, AOH, PhiOH] = Zernikmoment(z10,n,m);      % Call Zernikemoment fuction
        %Elapsed_time = toc;
        %xlabel({['A = ' num2str(AOH)]; ['\phi = ' num2str(PhiOH)]});  
        %disp('Calculation is complete.');
       % disp(['The elapsed time per image is ' num2str(Elapsed_time) ' seconds']);
         load ('featureout.mat');
         featureout=z;
         save ('featureout.mat','featureout');
         
         test
         
         
        pause(0.5);
    end
    fi = fopen('output.html','a');
    fprintf(fi, "</div><br/><br/><br/><div><button id='convert'>Phrase string</button><br/><br/></div><div><p id='tamil_str'></p></div></body></html>");
    fclose(fi);
    if isempty(lower)
         break;
     end;
end;
%  clear all
 winopen('output.html');


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
training_interface

% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
About


% --- Executes during object creation, after setting all properties.
function pushbutton3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input_target
