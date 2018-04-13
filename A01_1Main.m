function varargout = A01_1Main(varargin)
% A01_1MAIN MATLAB code for A01_1Main.fig
%      A01_1MAIN, by itself, creates a new A01_1MAIN or raises the existing
%      singleton*.
%
%      H = A01_1MAIN returns the handle to a new A01_1MAIN or the handle to
%      the existing singleton*.
%
%      A01_1MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in A01_1MAIN.M with the given input arguments.
%
%      A01_1MAIN('Property','Value',...) creates a new A01_1MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before A01_1Main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to A01_1Main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help A01_1Main

% Last Modified by GUIDE v2.5 01-Mar-2018 09:56:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @A01_1Main_OpeningFcn, ...
                   'gui_OutputFcn',  @A01_1Main_OutputFcn, ...
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


% --- Executes just before A01_1Main is made visible.
function A01_1Main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to A01_1Main (see VARARGIN)

% Choose default command line output for A01_1Main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes A01_1Main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = A01_1Main_OutputFcn(hObject, eventdata, handles) 
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
global VisImageData;

[fname,dirpath]=uigetfile({'*.jpg','JPG Files(*.jpg)';'*.png','PNG Files(*.png)';'*.bmp','Bitmap Files(*.bmp)';},'Choose a visible image');

FNlength=length(fname);

if FNlength<5
    errordlg('ERROR! No file loaded!','ERROR');
    return;
end

hBar=waitbar(0,'Loading for visible image, please wait...');

myfile=[dirpath fname];
VisImageData=imread(myfile);

waitbar(1,hBar,'Done for visible image');

pause(1);
if ishandle(hBar)
    delete(hBar);
end

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes1);
imagesc(VisImageData);
colormap(gray);
axis image off;
set(handles.axes1,'YDir','reverse');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global xAxis
global fData2D
global fDataAve
global m
global n
global p
global VisImageData

[fname1,dirpath1]=uigetfile({'*.fsm','FSM Files(*.fsm)';'*.mat','MATLAB Files(*.mat)'},'Choose an IR image');

FNlength=length(fname1);

if FNlength<5
    errordlg('ERROR! No file loaded!','ERROR');
    return;
end

hBar=waitbar(0,'Loading for IR image, please wait...');

myfile1=[dirpath1 fname1];

[~,~,c]=fileparts(myfile1);

if strcmp(c,'.fsm')
    [IRImageData, ~, ~, xAxis]=fsmload(myfile1);
else
    loaddata = load(myfile1);
    if length(loaddata)~=1 
        errordlg('ERROR! Wrong Num of matrix!','ERROR');
    end
    loaddata1 = struct2cell(loaddata);
    IRImageData = loaddata1{1,1};
    clear loaddata loaddata1
    
    [fname2,dirpath2]=uigetfile({'*.mat','MATLAB Files(*.mat)'},'Choose WaveData for IR image');
    myfile2=[dirpath2 fname2];
    loaddata = load(myfile2);
    if length(loaddata)~=1 
        errordlg('ERROR! Wrong Num of matrix!','ERROR');
    end
    loaddata1 = struct2cell(loaddata);
    xAxis = loaddata1{1,1};
    if size(xAxis,1)-1 && size(xAxis,2)-1
        errordlg('ERROR! Wrong dimention for WaveData, please reload','ERROR');        
        if ishandle(hBar)
            delete(hBar);
        end
        return
    end
    clear loaddata loaddata1
end
clear c

[m,n,p]=size(IRImageData);      %%%the size of IR Data
VisImageData = imresize(VisImageData, [m,n]);
fData2D=real(reshape(2-log10(IRImageData),m*n,p));     %%% %T to A, unfold

%%%swap the peak of CO2
%button = questdlg('Correct for CO2 ?','Question','Yes','No','Yes');
%if strcmp(button,'Yes')
    %a=find(xAxis==2550);
    %b=find(xAxis==2450);
    %c=find(xAxis==2250);
    %d=find(xAxis==2150);
    %X=xAxis(:,[a:b,c:d]);        
    %Y=fData2D(:,[a:b,c:d]);                %%%reading 2550~2450cm-1,2250~2150cm-1
    %xi=xAxis(:,b+1:c-1);
    %for i=1:1:m*n
        %yi(i,:)=interp1(X,Y(i,:),xi,'spline');       %%%inter 2450~2250cm-1['spline']for smooth and continume
    %end
    %fData2D(:,b+1:c-1)=yi;
    %clear a b c d X Y i xi yi 
%end

fDataAve=reshape(mean(fData2D,2),m,n);

waitbar(1,hBar,'Done for IR image');
pause(1);
if ishandle(hBar)
    delete(hBar);
end

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes2);
imagesc (fDataAve);
colormap(jet);
axis image off;
set(handles.axes2,'YDir','reverse');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fore
global fData2D
global fDataAve
global m
global n
global p
global VisImageData

global QQ
QQ=0;
%global VisImageData

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

fDataAve=reshape(mean(fData2D,2),m,n);
%set(handles.figure1,'Visible','off');%set welcome invisible

fore=A02_1Foreground(handles.figure1);

fore1DE=(reshape(fore,m*n,1))*ones(1,p);

fore3=im2uint8(fore);
for ii=1:3
    VisImageData(:,:,ii)=VisImageData(:,:,ii).*fore3;
end

fData2D=fData2D.*fore1DE;
fDataAve=reshape(mean(fData2D,2),m,n);

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes3);
imagesc(fDataAve);
colormap(jet); 
axis image off;
set(handles.axes3,'YDir','reverse');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global fore
global fData2D
global fDataAve
global PurgeBefore
global PurgeAfter
global PurgeStr
global VisImageData

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

PurgeBefore = fore;
PurgeStr = A01_1Main;
set(handles.figure1,'Visible','off');
PurgeAfter = A03_1Purge(handles.figure1);
close gcf
fore=PurgeAfter;
clear PurgeBefore PurgeAfter PurgeStr

fore3=im2uint8(fore);
for ii=1:3
    VisImageData(:,:,ii)=VisImageData(:,:,ii).*fore3;
end

[m,n]=size(fData2D);
fore1DE=(reshape(fore,m,1))*ones(1,n);
fData2D=fData2D.*fore1DE;

[p,q]=size(fore);
fDataAve=reshape(mean(fData2D,2),p,q,1);

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes3);
imagesc(fDataAve);
colormap(jet); 
axis image off;
set(handles.axes3,'YDir','reverse');


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global xAxis
global fData2D
global Xaxis
global Data2D
Xaxis=xAxis;
Data2D = fData2D;
%set(handles.figure1,'Visible','off');
open A12_1CharacteristicBand.fig 


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

%set(handles.figure1,'Visible','off');
open A10_1BandCombine.fig


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global xAxis
global fData2D
global Xaxis
global Data2D
Xaxis=xAxis;
Data2D = fData2D;

%set(A01_1Main,'Visible','off');
open A14_1FNNLS.fig


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%set(A01_1Main,'Visible','off');
open A13_1CharacteristicTissue.fig


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%set(A01_1Main,'Visible','off');
open A15_1FnnlsTissue.fig


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close gcf
clear all
clc
open A00Welcome.fig


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
clear all
clc


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global xAxis
global fData2D
global Xaxis
global Data2D
Xaxis=xAxis;
Data2D = fData2D;

%set(A01_1Main,'Visible','off');
open A05_1SetPretreatment.fig
