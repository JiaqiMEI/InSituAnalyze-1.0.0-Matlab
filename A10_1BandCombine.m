function varargout = A10_1BandCombine(varargin)
% A10_1BANDCOMBINE MATLAB code for A10_1BandCombine.fig
%      A10_1BANDCOMBINE, by itself, creates a new A10_1BANDCOMBINE or raises the existing
%      singleton*.
%
%      H = A10_1BANDCOMBINE returns the handle to a new A10_1BANDCOMBINE or the handle to
%      the existing singleton*.
%
%      A10_1BANDCOMBINE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in A10_1BANDCOMBINE.M with the given input arguments.
%
%      A10_1BANDCOMBINE('Property','Value',...) creates a new A10_1BANDCOMBINE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before A10_1BandCombine_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to A10_1BandCombine_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help A10_1BandCombine

% Last Modified by GUIDE v2.5 19-Jan-2018 12:41:29



% Copyright [Jiaqi MEI, China Agricultural University]

  %   Licensed under the Apache License, Version 2.0 (the "License");
  %   you may not use this file except in compliance with the License.
  %   You may obtain a copy of the License at

  %   http://www.apache.org/licenses/LICENSE-2.0

  %   Unless required by applicable law or agreed to in writing, software
  %   distributed under the License is distributed on an "AS IS" BASIS,
  %   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  %   See the License for the specific language governing permissions and
  %   limitations under the License.  
  
  

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @A10_1BandCombine_OpeningFcn, ...
                   'gui_OutputFcn',  @A10_1BandCombine_OutputFcn, ...
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


% --- Executes just before A10_1BandCombine is made visible.
function A10_1BandCombine_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to A10_1BandCombine (see VARARGIN)

% Choose default command line output for A10_1BandCombine
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes A10_1BandCombine wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = A10_1BandCombine_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7


% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9


% --- Executes on button press in checkbox10.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox10


% --- Executes on button press in checkbox11.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox11


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global VisImageData;
global fDataAve

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes1);
imagesc(VisImageData);
colormap(gray);
axis image off;
set(handles.axes1,'YDir','reverse');

axes(handles.axes2);
imagesc(fDataAve);
colormap(jet); 
axis image off;
set(handles.axes2,'YDir','reverse');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global VisImageData
global VR
global VG
global VB
global VL
global Va
global Vb
global VH
global VS
global VV


%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

VR=VisImageData(:,:,1); VR = normalization(VR,1); %Red
VG=VisImageData(:,:,2); VG = normalization(VG,1); %Green
VB=VisImageData(:,:,3); VB = normalization(VB,1); %Blue

axes(handles.axes3);
imagesc(VR);
colormap(gray);
axis image off;
set(handles.axes3,'YDir','reverse');

axes(handles.axes4);
imagesc(VG);
colormap(gray);
axis image off;
set(handles.axes4,'YDir','reverse');

axes(handles.axes5);
imagesc(VB);
colormap(gray);
axis image off;
set(handles.axes5,'YDir','reverse');

Lab=rgb2lab(VisImageData);
VL=Lab(:,:,1); VL = normalization(VL,1); %Lightness
Va=Lab(:,:,2); Va = normalization(Va,1); %Bottle green--grey--Bright pink
Vb=Lab(:,:,3); Vb = normalization(Vb,1); %Brillant blue--grey--yellow

axes(handles.axes6);
imagesc(VL);
colormap(gray);
axis image off;
set(handles.axes6,'YDir','reverse');

axes(handles.axes7);
imagesc(Va);
colormap(gray);
axis image off;
set(handles.axes7,'YDir','reverse');

axes(handles.axes8);
imagesc(Vb);
colormap(gray);
axis image off;
set(handles.axes8,'YDir','reverse');

HSV=rgb2hsv(VisImageData);
VH=HSV(:,:,1);  VH = normalization(VH,1);%Hue
VS=HSV(:,:,2);  VS = normalization(VS,1);%Saturability
VV=HSV(:,:,3);  VV = normalization(VV,1);%Value/BRIGHTNESS

axes(handles.axes9);
imagesc(VH);
colormap(gray);
axis image off;
set(handles.axes9,'YDir','reverse');

axes(handles.axes10);
imagesc(VS);
colormap(gray);
axis image off;
set(handles.axes10,'YDir','reverse');

axes(handles.axes11);
imagesc(VV);
colormap(gray);
axis image off;
set(handles.axes11,'YDir','reverse');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global fDataAve
global Combine
global VR
global VG
global VB
global VL
global Va
global Vb
global VH
global VS
global VV

Cn=0;
fDataAve1 = normalization(fDataAve,1);

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

if get(handles.checkbox1,'Value')==1
    Cn=Cn+1;
    Combine(:,:,Cn)=VR;
end

if get(handles.checkbox2,'Value')==1
    Cn=Cn+1;
    Combine(:,:,Cn)=VG;
end

if get(handles.checkbox3,'Value')==1
    Cn=Cn+1;
    Combine(:,:,Cn)=VB;
end

if get(handles.checkbox4,'Value')==1
    Cn=Cn+1;
    Combine(:,:,Cn)=VL;
end

if get(handles.checkbox5,'Value')==1
    Cn=Cn+1;
    Combine(:,:,Cn)=Va;
end

if get(handles.checkbox6,'Value')==1
    Cn=Cn+1;
    Combine(:,:,Cn)=Vb;
end

if get(handles.checkbox7,'Value')==1
    Cn=Cn+1;
    Combine(:,:,Cn)=VH;
end

if get(handles.checkbox8,'Value')==1
    Cn=Cn+1;
    Combine(:,:,Cn)=VS;
end

if get(handles.checkbox9,'Value')==1
    Cn=Cn+1;
    Combine(:,:,Cn)=VV;
end

if get(handles.checkbox10,'Value')==1
    Cn=Cn+1;
    Combine(:,:,Cn)=fDataAve1;
end

clear handles

if Cn
    
    %%%get current_GUI handles(when not only one GUI has axes)
    handles = guihandles(gcf);

    axes(handles.axes12);
    imagesc(mean(Combine,3));
    colormap(gray);
    axis image off;
    set(handles.axes12,'YDir','reverse');
else
    errordlg('ERROR! No image selected','ERROR');
    return;
end

clear Cn handles


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);
set(handles.figure1,'Visible','off');
open A11_1Kmeans.fig 


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close gcf
%set(A01_1Main,'Visible','on');
