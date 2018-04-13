function varargout = A15_1FnnlsTissue(varargin)
% A15_1FNNLSTISSUE MATLAB code for A15_1FnnlsTissue.fig
%      A15_1FNNLSTISSUE, by itself, creates a new A15_1FNNLSTISSUE or raises the existing
%      singleton*.
%
%      H = A15_1FNNLSTISSUE returns the handle to a new A15_1FNNLSTISSUE or the handle to
%      the existing singleton*.
%
%      A15_1FNNLSTISSUE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in A15_1FNNLSTISSUE.M with the given input arguments.
%
%      A15_1FNNLSTISSUE('Property','Value',...) creates a new A15_1FNNLSTISSUE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before A15_1FnnlsTissue_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to A15_1FnnlsTissue_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help A15_1FnnlsTissue

% Last Modified by GUIDE v2.5 19-Jan-2018 12:45:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @A15_1FnnlsTissue_OpeningFcn, ...
                   'gui_OutputFcn',  @A15_1FnnlsTissue_OutputFcn, ...
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


% --- Executes just before A15_1FnnlsTissue is made visible.
function A15_1FnnlsTissue_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to A15_1FnnlsTissue (see VARARGIN)

% Choose default command line output for A15_1FnnlsTissue
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes A15_1FnnlsTissue wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = A15_1FnnlsTissue_OutputFcn(hObject, eventdata, handles) 
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
%set(A01_1Main,'Visible','on');


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

global b_Epidermis
global b_VascularBundle
global b_Sclerenchyma
global b_Parenchymal
global m n

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

if get(handles.checkbox1,'Value')==1
    figure('visible','on');
    axes;
    
    if ~isempty(b_Epidermis)
        fig1=b_Epidermis;
        imagesc(fig1);
        colormap(jet); 
        axis image off  
        [f,p]=uiputfile({'*.fig'},'Save Files');
        str=strcat(p,f);
        savefig(figure(1),str);
    end
    
    if ~isempty(b_VascularBundle)
        fig2=b_VascularBundle;
        imagesc(fig2);
        colormap(jet); 
        axis image off  
        [f,p]=uiputfile({'*.fig'},'Save Files');
        str=strcat(p,f);
        savefig(figure(1),str);
    end
    
    if ~isempty(b_Sclerenchyma)
        fig3=b_Sclerenchyma;
        imagesc(fig3);
        colormap(jet); 
        axis image off  
        [f,p]=uiputfile({'*.fig'},'Save Files');
        str=strcat(p,f);
        savefig(figure(1),str);
    end
    
    if ~isempty(b_Parenchymal)
        fig4=b_Parenchymal;
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
        fig1=b_Epidermis;
        save (myfile,'fig1','-append');
    end
    try
        fig2=b_VascularBundle;
        save (myfile,'fig2','-append');
    end
    try
        fig3=b_Sclerenchyma;
        save (myfile,'fig3','-append');
    end
    try
        fig4=b_Parenchymal;
        save (myfile,'fig4','-append');
    end
end

clear b_Epidermis b_VascularBundle b_Sclerenchyma b_Parenchymal f p str

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
    errordlg('ERROR! No file loaded','ERROR');
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
global b
global m
global n
global Epidermis
global VascularBundle
global Sclerenchyma
global Parenchymal
global b_Epidermis
global b_VascularBundle
global b_Sclerenchyma
global b_Parenchymal

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

if ~isempty(get(handles.edit1,'String'))
    a=str2double(get(handles.edit1,'String'));
    
    b_im = reshape(b(:,a),m,n);
    
    b_Epidermis = b_im.*Epidermis;
    b_VascularBundle = b_im.*VascularBundle;
    b_Sclerenchyma = b_im.*Sclerenchyma;
    b_Parenchymal = b_im.*Parenchymal;
    
    axes(handles.axes3);
    imagesc(b_Epidermis);
    colormap(jet); 
    axis image off;
    set(handles.axes3,'YDir','reverse');
    
    axes(handles.axes4);
    imagesc(b_VascularBundle);
    colormap(jet); 
    axis image off;
    set(handles.axes4,'YDir','reverse');
    
    axes(handles.axes5);
    imagesc(b_Sclerenchyma);
    colormap(jet); 
    axis image off;
    set(handles.axes5,'YDir','reverse');
    
    axes(handles.axes6);
    imagesc(b_Parenchymal);
    colormap(jet); 
    axis image off;
    set(handles.axes6,'YDir','reverse');
end
