function varargout = A11_1Kmeans(varargin)
% A11_1KMEANS MATLAB code for A11_1Kmeans.fig
%      A11_1KMEANS, by itself, creates a new A11_1KMEANS or raises the existing
%      singleton*.
%
%      H = A11_1KMEANS returns the handle to a new A11_1KMEANS or the handle to
%      the existing singleton*.
%
%      A11_1KMEANS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in A11_1KMEANS.M with the given input arguments.
%
%      A11_1KMEANS('Property','Value',...) creates a new A11_1KMEANS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before A11_1Kmeans_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to A11_1Kmeans_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help A11_1Kmeans

% Last Modified by GUIDE v2.5 19-Jan-2018 12:42:05



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
                   'gui_OpeningFcn', @A11_1Kmeans_OpeningFcn, ...
                   'gui_OutputFcn',  @A11_1Kmeans_OutputFcn, ...
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


% --- Executes just before A11_1Kmeans is made visible.
function A11_1Kmeans_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to A11_1Kmeans (see VARARGIN)

% Choose default command line output for A11_1Kmeans
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes A11_1Kmeans wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = A11_1Kmeans_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global VisImageData
global Combine

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes1);
imagesc(mean(Combine,3));
colormap(gray);
axis image off;
set(handles.axes1,'YDir','reverse');

axes(handles.axes2);
imagesc(VisImageData);
colormap(gray);
axis image off;
set(handles.axes2,'YDir','reverse');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Combine
global pixel_1
global pixel_2
global pixel_3
global pixel_4
global pixel_5
global pixel_6
global pixel_7
global pixel_8
global Epidermis
global VascularBundle
global Sclerenchyma
global Parenchymal

[m,n,p]=size(Combine);
mCombine=reshape(Combine,m*n,p);

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);
Kn = str2double(get(handles.edit1,'String'));

[cluster_idx, cluster_center] = kmeans(mCombine,Kn,'distance','sqEuclidean', 'Replicates',3);     %%%default Kn=5
pixel_labels = reshape(cluster_idx,m,n);

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes3);
imagesc(pixel_labels);
colormap(jet);
axis image off;
set(handles.axes3,'YDir','reverse');

%%%---------------pixel_labels=1
pixel_1=pixel_labels; 
pixel_1(find(pixel_1~=1))=0;      
pixel_1(find(pixel_1~=0))=1;     

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes4);
imagesc(pixel_1);
colormap(jet);
axis image off;
set(handles.axes4,'YDir','reverse');

%%%---------------pixel_labels=2
pixel_2=pixel_labels; 
pixel_2(find(pixel_2~=2))=0;      
pixel_2(find(pixel_2~=0))=1;     

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes5);
imagesc(pixel_2);
colormap(jet);
axis image off;
set(handles.axes5,'YDir','reverse');

%%%---------------pixel_labels=3
pixel_3=pixel_labels; 
pixel_3(find(pixel_3~=3))=0;      
pixel_3(find(pixel_3~=0))=1;     

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes6);
imagesc(pixel_3);
colormap(jet);
axis image off;
set(handles.axes6,'YDir','reverse');

%%%---------------pixel_labels=4
pixel_4=pixel_labels; 
pixel_4(find(pixel_4~=4))=0;      
pixel_4(find(pixel_4~=0))=1;     

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes7);
imagesc(pixel_4);
colormap(jet);
axis image off;
set(handles.axes7,'YDir','reverse');

%%%---------------pixel_labels=5
pixel_5=pixel_labels; 
pixel_5(find(pixel_5~=5))=0;      
pixel_5(find(pixel_5~=0))=1;     

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes8);
imagesc(pixel_5);
colormap(jet);
axis image off;
set(handles.axes8,'YDir','reverse');

%%%---------------pixel_labels=6
pixel_6=pixel_labels; 
pixel_6(find(pixel_6~=6))=0;      
pixel_6(find(pixel_6~=0))=1;     

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes9);
imagesc(pixel_6);
colormap(jet);
axis image off;
set(handles.axes9,'YDir','reverse');

%%%---------------pixel_labels=7
pixel_7=pixel_labels; 
pixel_7(find(pixel_7~=7))=0;      
pixel_7(find(pixel_7~=0))=1;     

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes10);
imagesc(pixel_7);
colormap(jet);
axis image off;
set(handles.axes10,'YDir','reverse');

%%%---------------pixel_labels=8
pixel_8=pixel_labels; 
pixel_8(find(pixel_8~=8))=0;      
pixel_8(find(pixel_8~=0))=1;     

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes11);
imagesc(pixel_8);
colormap(jet);
axis image off;
set(handles.axes11,'YDir','reverse');

Epidermis = zeros(m,n);
VascularBundle = zeros(m,n);
Sclerenchyma = zeros(m,n);
Parenchymal = zeros(m,n);
 

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Epidermis
global VascularBundle
global Sclerenchyma
global Parenchymal
global pixel_1
global pixel_2
global pixel_3
global pixel_4
global pixel_5
global pixel_6
global pixel_7
global pixel_8
global PurgeBefore
global PurgeAfter
global PurgeStr
global fDataAve

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

if get(handles.checkbox1,'Value')==1
    Epidermis=Epidermis+pixel_1;
end

if get(handles.checkbox13,'Value')==1
    Epidermis=Epidermis-pixel_1;
end

if get(handles.checkbox2,'Value')==1
    Epidermis=Epidermis+pixel_2;
end

if get(handles.checkbox14,'Value')==1
    Epidermis=Epidermis-pixel_2;
end

if get(handles.checkbox3,'Value')==1
    Epidermis=Epidermis+pixel_3;
end

if get(handles.checkbox15,'Value')==1
    Epidermis=Epidermis-pixel_3;
end

if get(handles.checkbox4,'Value')==1
    Epidermis=Epidermis+pixel_4;
end

if get(handles.checkbox16,'Value')==1
    Epidermis=Epidermis-pixel_4;
end

if get(handles.checkbox5,'Value')==1
    Epidermis=Epidermis+pixel_5;
end

if get(handles.checkbox17,'Value')==1
    Epidermis=Epidermis-pixel_5;
end

if get(handles.checkbox6,'Value')==1
    Epidermis=Epidermis+pixel_6;
end

if get(handles.checkbox18,'Value')==1
    Epidermis=Epidermis-pixel_6;
end

if get(handles.checkbox7,'Value')==1
    Epidermis=Epidermis+pixel_7;
end

if get(handles.checkbox19,'Value')==1
    Epidermis=Epidermis-pixel_7;
end

if get(handles.checkbox8,'Value')==1
    Epidermis=Epidermis+pixel_8;
end

if get(handles.checkbox20,'Value')==1
    Epidermis=Epidermis-pixel_8;
end

if get(handles.checkbox10,'Value')==1
    Epidermis=Epidermis+VascularBundle;
end

if get(handles.checkbox22,'Value')==1
    Epidermis=Epidermis-VascularBundle;
end

if get(handles.checkbox11,'Value')==1
    Epidermis=Epidermis+Sclerenchyma;
end

if get(handles.checkbox23,'Value')==1
    Epidermis=Epidermis-Sclerenchyma;
end

if get(handles.checkbox12,'Value')==1
    Epidermis=Epidermis+Parenchymal;
end

if get(handles.checkbox24,'Value')==1
    Epidermis=Epidermis-Parenchymal;
end

Epidermis(find(Epidermis~=0))=1;      

PurgeBefore = Epidermis;
PurgeStr = A11_1Kmeans;
set(A11_1Kmeans,'Visible','off');
close gcf                              %%%shutdown needless window
PurgeAfter = A03_1Purge(handles.figure1);
Epidermis = PurgeAfter;
clear PurgeAfter PurgeBefore PurgeStr

%%%.*Foreground
Epidermis=Epidermis.*fDataAve;         %%%.*Forground, anticorrosion
Epidermis(find(Epidermis~=0))=1;

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes12);
imagesc(Epidermis);
colormap(jet); 
axis image off;
set(handles.axes12,'YDir','reverse');



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Epidermis
global VascularBundle
global Sclerenchyma
global Parenchymal
global pixel_1
global pixel_2
global pixel_3
global pixel_4
global pixel_5
global pixel_6
global pixel_7
global pixel_8
global PurgeBefore
global PurgeAfter
global PurgeStr
global fDataAve

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

if get(handles.checkbox1,'Value')==1
    VascularBundle=VascularBundle+pixel_1;
end

if get(handles.checkbox13,'Value')==1
    VascularBundle=VascularBundle-pixel_1;
end

if get(handles.checkbox2,'Value')==1
   VascularBundle=VascularBundle+pixel_2;
end

if get(handles.checkbox14,'Value')==1
   VascularBundle=VascularBundle-pixel_2;
end

if get(handles.checkbox3,'Value')==1
    VascularBundle=VascularBundle+pixel_3;
end

if get(handles.checkbox15,'Value')==1
    VascularBundle=VascularBundle-pixel_3;
end

if get(handles.checkbox4,'Value')==1
    VascularBundle=VascularBundle+pixel_4;
end

if get(handles.checkbox16,'Value')==1
    VascularBundle=VascularBundle-pixel_4;
end

if get(handles.checkbox5,'Value')==1
    VascularBundle=VascularBundle+pixel_5;
end

if get(handles.checkbox17,'Value')==1
    VascularBundle=VascularBundle-pixel_5;
end

if get(handles.checkbox6,'Value')==1
    VascularBundle=VascularBundle+pixel_6;
end

if get(handles.checkbox18,'Value')==1
    VascularBundle=VascularBundle-pixel_6;
end

if get(handles.checkbox7,'Value')==1
    VascularBundle=VascularBundle+pixel_7;
end

if get(handles.checkbox19,'Value')==1
    VascularBundle=VascularBundle-pixel_7;
end

if get(handles.checkbox8,'Value')==1
    VascularBundle=VascularBundle+pixel_8;
end

if get(handles.checkbox20,'Value')==1
    VascularBundle=VascularBundle-pixel_8;
end

if get(handles.checkbox9,'Value')==1
    VascularBundle=VascularBundle+Epidermis;
end

if get(handles.checkbox21,'Value')==1
    VascularBundle=VascularBundle-Epidermis;
end

if get(handles.checkbox11,'Value')==1
    VascularBundle=VascularBundle+Sclerenchyma;
end

if get(handles.checkbox23,'Value')==1
    VascularBundle=VascularBundle-Sclerenchyma;
end

if get(handles.checkbox12,'Value')==1
    VascularBundle=VascularBundle+Parenchymal;
end

if get(handles.checkbox24,'Value')==1
    VascularBundle=VascularBundle-Parenchymal;
end

VascularBundle(find(VascularBundle~=0))=1;      

PurgeBefore = VascularBundle;
PurgeStr = A11_1Kmeans;
set(A11_1Kmeans,'Visible','off');
PurgeAfter = A03_1Purge(handles.figure1);
VascularBundle = PurgeAfter;
clear PurgeAfter PurgeBefore PurgeStr

%%%.*Foreground
VascularBundle=VascularBundle.*fDataAve;  %%%.*Foreground, anticorrosion
VascularBundle(find(VascularBundle~=0))=1;

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes13);
imagesc(VascularBundle);
colormap(jet); 
axis image off;
set(handles.axes13,'YDir','reverse');


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Epidermis
global VascularBundle
global Sclerenchyma
global Parenchymal
global pixel_1
global pixel_2
global pixel_3
global pixel_4
global pixel_5
global pixel_6
global pixel_7
global pixel_8
global PurgeBefore
global PurgeAfter
global PurgeStr
global fDataAve

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

if get(handles.checkbox1,'Value')==1
    Sclerenchyma=Sclerenchyma+pixel_1;
end

if get(handles.checkbox13,'Value')==1
    Sclerenchyma=Sclerenchyma-pixel_1;
end

if get(handles.checkbox2,'Value')==1
   Sclerenchyma=Sclerenchyma+pixel_2;
end

if get(handles.checkbox14,'Value')==1
   Sclerenchyma=Sclerenchyma-pixel_2;
end

if get(handles.checkbox3,'Value')==1
    Sclerenchyma=Sclerenchyma+pixel_3;
end

if get(handles.checkbox15,'Value')==1
    Sclerenchyma=Sclerenchyma-pixel_3;
end

if get(handles.checkbox4,'Value')==1
    Sclerenchyma=Sclerenchyma+pixel_4;
end

if get(handles.checkbox16,'Value')==1
    Sclerenchyma=Sclerenchyma-pixel_4;
end

if get(handles.checkbox5,'Value')==1
    Sclerenchyma=Sclerenchyma+pixel_5;
end

if get(handles.checkbox17,'Value')==1
    Sclerenchyma=Sclerenchyma-pixel_5;
end

if get(handles.checkbox6,'Value')==1
   Sclerenchyma=Sclerenchyma+pixel_6;
end

if get(handles.checkbox18,'Value')==1
   Sclerenchyma=Sclerenchyma-pixel_6;
end

if get(handles.checkbox7,'Value')==1
    Sclerenchyma=Sclerenchyma+pixel_7;
end

if get(handles.checkbox19,'Value')==1
    Sclerenchyma=Sclerenchyma-pixel_7;
end

if get(handles.checkbox8,'Value')==1
    Sclerenchyma=Sclerenchyma+pixel_8;
end

if get(handles.checkbox20,'Value')==1
    Sclerenchyma=Sclerenchyma-pixel_8;
end

if get(handles.checkbox9,'Value')==1
    Sclerenchyma=Sclerenchyma+Epidermis;
end

if get(handles.checkbox21,'Value')==1
    Sclerenchyma=Sclerenchyma-Epidermis;
end

if get(handles.checkbox10,'Value')==1
    Sclerenchyma=Sclerenchyma+VascularBundle;
end

if get(handles.checkbox22,'Value')==1
    Sclerenchyma=Sclerenchyma-VascularBundle;
end

if get(handles.checkbox12,'Value')==1
    Sclerenchyma=Sclerenchyma+Parenchymal;
end

if get(handles.checkbox24,'Value')==1
    Sclerenchyma=Sclerenchyma-Parenchymal;
end

Sclerenchyma(find(Sclerenchyma~=0))=1;      

PurgeBefore = Sclerenchyma;
PurgeStr = A11_1Kmeans;
set(A11_1Kmeans,'Visible','off');
PurgeAfter = A03_1Purge(handles.figure1);
Sclerenchyma = PurgeAfter;
clear PurgeAfter PurgeBefore PurgeStr

%%%.*Foreground
Sclerenchyma=Sclerenchyma.*fDataAve;    %%%.*Foreground, anticorrosion
Sclerenchyma(find(Sclerenchyma~=0))=1;

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes14);
imagesc(Sclerenchyma);
colormap(jet); 
axis image off;
set(handles.axes14,'YDir','reverse');


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Epidermis
global VascularBundle
global Sclerenchyma
global Parenchymal
global pixel_1
global pixel_2
global pixel_3
global pixel_4
global pixel_5
global pixel_6
global pixel_7
global pixel_8
global PurgeBefore
global PurgeAfter
global PurgeStr
global fDataAve

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

if get(handles.checkbox1,'Value')==1
    Parenchymal=Parenchymal+pixel_1;
end

if get(handles.checkbox13,'Value')==1
    Parenchymal=Parenchymal-pixel_1;
end

if get(handles.checkbox2,'Value')==1
   Parenchymal=Parenchymal+pixel_2;
end

if get(handles.checkbox14,'Value')==1
   Parenchymal=Parenchymal-pixel_2;
end

if get(handles.checkbox3,'Value')==1
    Parenchymal=Parenchymal+pixel_3;
end

if get(handles.checkbox15,'Value')==1
    Parenchymal=Parenchymal-pixel_3;
end

if get(handles.checkbox4,'Value')==1
    Parenchymal=Parenchymal+pixel_4;
end

if get(handles.checkbox16,'Value')==1
    Parenchymal=Parenchymal-pixel_4;
end

if get(handles.checkbox5,'Value')==1
    Parenchymal=Parenchymal+pixel_5;
end

if get(handles.checkbox17,'Value')==1
    Parenchymal=Parenchymal-pixel_5;
end

if get(handles.checkbox6,'Value')==1
   Parenchymal=Parenchymal+pixel_6;
end

if get(handles.checkbox18,'Value')==1
   Parenchymal=Parenchymal-pixel_6;
end

if get(handles.checkbox7,'Value')==1
    Parenchymal=Parenchymal+pixel_7;
end

if get(handles.checkbox19,'Value')==1
    Parenchymal=Parenchymal-pixel_7;
end

if get(handles.checkbox8,'Value')==1
    Parenchymal=Parenchymal+pixel_8;
end

if get(handles.checkbox20,'Value')==1
    Parenchymal=Parenchymal-pixel_8;
end

if get(handles.checkbox9,'Value')==1
    Parenchymal=Parenchymal+Epidermis;
end

if get(handles.checkbox21,'Value')==1
    Parenchymal=Parenchymal-Epidermis;
end

if get(handles.checkbox10,'Value')==1
    Parenchymal=Parenchymal+VascularBundle;
end

if get(handles.checkbox22,'Value')==1
    Parenchymal=Parenchymal-VascularBundle;
end

if get(handles.checkbox11,'Value')==1
    Parenchymal=Parenchymal+Sclerenchyma;
end

if get(handles.checkbox23,'Value')==1
    Parenchymal=Parenchymal-Sclerenchyma;
end

Parenchymal(find(Parenchymal~=0))=1;      

PurgeBefore = Parenchymal;
PurgeStr = A11_1Kmeans;
set(A11_1Kmeans,'Visible','off');
PurgeAfter = A03_1Purge(handles.figure1);
Parenchymal = PurgeAfter;
clear PurgeAfter PurgeBefore PurgeStr

%%%.*Foreground
Parenchymal=Parenchymal.*fDataAve; %%%.*Foreground, anticorrosion
Parenchymal(find(Parenchymal~=0))=1;

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes15);
imagesc(Parenchymal);
colormap(jet); 
axis image off;
set(handles.axes15,'YDir','reverse');



% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%poor clustering result, back to BandCombine GUI
close gcf
set(A10_1BandCombine,'Visible','on');


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Epidermis
global VascularBundle
global Sclerenchyma
global Parenchymal

%%%Exclude inter-organizational interference
Sclerenchyma=Sclerenchyma.*(~VascularBundle).*(~Epidermis);
Parenchymal=Parenchymal.*(~VascularBundle).*(~Epidermis).*(~Sclerenchyma);

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes14);
imagesc(Sclerenchyma);
colormap(jet); 
axis image off;
set(handles.axes14,'YDir','reverse');

axes(handles.axes15);
imagesc(Parenchymal);
colormap(jet); 
axis image off;
set(handles.axes15,'YDir','reverse');


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Epidermis
global VascularBundle
global Sclerenchyma
global Parenchymal
global Data2DP

[m,n]=size(Data2DP);

ForeN=Epidermis+VascularBundle+Sclerenchyma+Parenchymal;
ForeN(isnan(ForeN)) = 0;
ForeN_P=reshape(ForeN,1,m);
ForeN_PP=repmat(ForeN_P',1,n);
Data2DP=Data2DP.*ForeN_PP;

close gcf
%set(A01_1Main,'Visible','on');


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


% --- Executes on button press in checkbox12.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox12


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


% --- Executes on button press in checkbox21.
function checkbox21_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox21


% --- Executes on button press in checkbox22.
function checkbox22_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox22


% --- Executes on button press in checkbox23.
function checkbox23_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox23


% --- Executes on button press in checkbox24.
function checkbox24_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox24


% --- Executes on button press in checkbox13.
function checkbox13_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox13


% --- Executes on button press in checkbox14.
function checkbox14_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox14


% --- Executes on button press in checkbox15.
function checkbox15_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox15


% --- Executes on button press in checkbox16.
function checkbox16_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox16


% --- Executes on button press in checkbox17.
function checkbox17_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox17


% --- Executes on button press in checkbox18.
function checkbox18_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox18


% --- Executes on button press in checkbox19.
function checkbox19_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox19


% --- Executes on button press in checkbox20.
function checkbox20_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox20
