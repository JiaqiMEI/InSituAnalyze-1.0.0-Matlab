function varargout = A13_2CharacteristicTissue(varargin)
% A13_2CHARACTERISTICTISSUE MATLAB code for A13_2CharacteristicTissue.fig
%      A13_2CHARACTERISTICTISSUE, by itself, creates a new A13_2CHARACTERISTICTISSUE or raises the existing
%      singleton*.
%
%      H = A13_2CHARACTERISTICTISSUE returns the handle to a new A13_2CHARACTERISTICTISSUE or the handle to
%      the existing singleton*.
%
%      A13_2CHARACTERISTICTISSUE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in A13_2CHARACTERISTICTISSUE.M with the given input arguments.
%
%      A13_2CHARACTERISTICTISSUE('Property','Value',...) creates a new A13_2CHARACTERISTICTISSUE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before A13_2CharacteristicTissue_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to A13_2CharacteristicTissue_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help A13_2CharacteristicTissue

% Last Modified by GUIDE v2.5 01-Mar-2018 20:55:39



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
                   'gui_OpeningFcn', @A13_2CharacteristicTissue_OpeningFcn, ...
                   'gui_OutputFcn',  @A13_2CharacteristicTissue_OutputFcn, ...
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


% --- Executes just before A13_2CharacteristicTissue is made visible.
function A13_2CharacteristicTissue_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to A13_2CharacteristicTissue (see VARARGIN)

% Choose default command line output for A13_2CharacteristicTissue
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes A13_2CharacteristicTissue wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = A13_2CharacteristicTissue_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close gcf
%set(A01_2Main,'Visible','on');


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global a_Epidermis
global a_VascularBundle
global a_Sclerenchyma
global a_Parenchymal
global m n

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

if get(handles.checkbox1,'Value')==1
    figure('visible','on');
    axes;
    
    if ~isempty(a_Epidermis)
        fig1=a_Epidermis;
        imagesc(fig1);
        colormap(jet); 
        axis image off  
        [f,p]=uiputfile({'*.fig'},'Save Files');
        str=strcat(p,f);
        savefig(figure(1),str);
    end
    
    if ~isempty(a_VascularBundle)
        fig2=a_VascularBundle;
        imagesc(fig2);
        colormap(jet); 
        axis image off  
        [f,p]=uiputfile({'*.fig'},'Save Files');
        str=strcat(p,f);
        savefig(figure(1),str);
    end
    
    if ~isempty(a_Sclerenchyma)
        fig3=a_Sclerenchyma;
        imagesc(fig3);
        colormap(jet); 
        axis image off  
        [f,p]=uiputfile({'*.fig'},'Save Files');
        str=strcat(p,f);
        savefig(figure(1),str);
    end
    
    if ~isempty(a_Parenchymal)
        fig4=a_Parenchymal;
        imagesc(fig4);
        colormap(jet); 
        axis image off  
        [f,p]=uiputfile({'*.fig'},'Save Files');
        str=strcat(p,f);
        savefig(figure(1),str);
    end  
    close gcf
end

if get(handles.checkbox4,'Value')==1
        
    [fname,dirpath,index]=uiputfile({'*.mat','MATLAB Files(*.mat)'},'Save Data File');
    FNlength=length(fname);

    myfile=[dirpath fname];

    save (myfile, 'm','n');
    try
        fig1=a_Epidermis;
        save (myfile,'fig1','-append');
    end
    try
        fig2=a_VascularBundle;
        save (myfile,'fig2','-append');
    end
    try
        fig3=a_Sclerenchyma;
        save (myfile,'fig3','-append');
    end
    try
        fig4=a_Parenchymal;
        save (myfile,'fig4','-append');
    end
end

clear a_Epidermis a_VascularBundle a_Sclerenchyma a_Parenchymal f p str

hMsg=msgbox(['Successfully Saved!'],'Prompt');
pause(1);
if ishandle(hMsg)
    delete(hMsg);
end 


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[fname,dirpath]=uigetfile({'*.jpg','JPG Files(*.jpg)';'*.png','PNG Files(*.png)';'*.bmp','Bitmap Files(*.bmp)';},'Choose a dyeing image');

FNlength=length(fname);

if FNlength<5
    errordlg('ERROR! No file loaded!','ERROR');
    return;
end

hBar=waitbar(0,'Loading for dyeing image, please wait...');

myfile=[dirpath fname];
DyeData=imread(myfile);

waitbar(1,hBar,'Done for dyeing image');

pause(1);
if ishandle(hBar)
    delete(hBar);
end

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes1);
imagesc(DyeData);
colormap(gray);
axis image off;
set(handles.axes1,'YDir','reverse');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fDataAve

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes2);
imagesc(fDataAve);
colormap(jet); 
axis image off;
set(handles.axes2,'YDir','reverse');


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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Xaxis
global Data2D
global m
global n
global Epidermis
global VascularBundle
global Sclerenchyma
global Parenchymal
global a_Epidermis
global a_VascularBundle
global a_Sclerenchyma
global a_Parenchymal

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

if ~isempty(get(handles.edit1,'String'))
    a=str2double(get(handles.edit1,'String'));
    if (mod(a,2)==1)
        aa=find(Xaxis==(a+1));
        aaa=mean(Data2D(:,(aa-2):(aa+1)),2);
    else
        aa=find(Xaxis==a);
        aaa=mean(Data2D(:,(aa-2):(aa+2)),2);
    end
    
    a_im = reshape(aaa,m,n);
    
    a_Epidermis = a_im.*Epidermis;
    a_VascularBundle = a_im.*VascularBundle;
    a_Sclerenchyma = a_im.*Sclerenchyma;
    a_Parenchymal = a_im.*Parenchymal;
    
    axes(handles.axes3);
    imagesc(a_Epidermis);
    colormap(jet); 
    axis image off;
    set(handles.axes3,'YDir','reverse');
    
    axes(handles.axes4);
    imagesc(a_VascularBundle);
    colormap(jet); 
    axis image off;
    set(handles.axes4,'YDir','reverse');
    
    axes(handles.axes5);
    imagesc(a_Sclerenchyma);
    colormap(jet); 
    axis image off;
    set(handles.axes5,'YDir','reverse');
    
    axes(handles.axes6);
    imagesc(a_Parenchymal);
    colormap(jet); 
    axis image off;
    set(handles.axes6,'YDir','reverse');
end
