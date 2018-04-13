function varargout = A12_2CharacteristicBand(varargin)
% A12_2CHARACTERISTICBAND MATLAB code for A12_2CharacteristicBand.fig
%      A12_2CHARACTERISTICBAND, by itself, creates a new A12_2CHARACTERISTICBAND or raises the existing
%      singleton*.
%
%      H = A12_2CHARACTERISTICBAND returns the handle to a new A12_2CHARACTERISTICBAND or the handle to
%      the existing singleton*.
%
%      A12_2CHARACTERISTICBAND('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in A12_2CHARACTERISTICBAND.M with the given input arguments.
%
%      A12_2CHARACTERISTICBAND('Property','Value',...) creates a new A12_2CHARACTERISTICBAND or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before A12_2CharacteristicBand_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to A12_2CharacteristicBand_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help A12_2CharacteristicBand

% Last Modified by GUIDE v2.5 01-Mar-2018 20:54:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @A12_2CharacteristicBand_OpeningFcn, ...
                   'gui_OutputFcn',  @A12_2CharacteristicBand_OutputFcn, ...
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


% --- Executes just before A12_2CharacteristicBand is made visible.
function A12_2CharacteristicBand_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to A12_2CharacteristicBand (see VARARGIN)

%%%set windows middle
% set(hObject,'Units','pixels');
% figuresize=get(hObject,'Position');
% screensize=get(0,'screensize');
% set(gcf,'outerposition',[(screensize(3)-figuresize(3))/2,(screensize(4)-figuresize(4))/2,figuresize(3),figuresize(4)]);

% Choose default command line output for A12_2CharacteristicBand
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes A12_2CharacteristicBand wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = A12_2CharacteristicBand_OutputFcn(hObject, eventdata, handles) 
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
global aaa
global bbb
global ccc
global ddd
global eee
global fff
global ggg
global hhh
global m
global n

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

if get(handles.checkbox1,'Value')==1
    figure('visible','on');
    axes;
    
    if ~isempty(aaa)
        fig1=reshape(aaa,m,n);
        imagesc(fig1);
        colormap(jet); 
        axis image off  
        [f,p]=uiputfile({'*.fig'},'Save Files');
        str=strcat(p,f);
        savefig(figure(1),str);
    end
    
    if ~isempty(bbb)
        fig2=reshape(bbb,m,n);
        imagesc(fig2);
        colormap(jet); 
        axis image off  
        [f,p]=uiputfile({'*.fig'},'Save Filse');
        str=strcat(p,f);
        savefig(figure(1),str);
    end
    
    if ~isempty(ccc)
        fig3=reshape(ccc,m,n);
        imagesc(fig3);
        colormap(jet); 
        axis image off  
        [f,p]=uiputfile({'*.fig'},'Save Files');
        str=strcat(p,f);
        savefig(figure(1),str);
    end
    
    if ~isempty(ddd)
        fig4=reshape(ddd,m,n);
        imagesc(fig4);
        colormap(jet); 
        axis image off  
        [f,p]=uiputfile({'*.fig'},'Save Files');
        str=strcat(p,f);
        savefig(figure(1),str);
    end
     
    if ~isempty(hhh)
        fig5=reshape(hhh,m,n);
        imagesc(fig5);
        colormap(jet); 
        axis image off  
        [f,p]=uiputfile({'*.fig'},'Save Files');
        str=strcat(p,f);
        savefig(figure(1),str);
    end
    
    if ~isempty(ggg)
        fig6=reshape(ggg,m,n);
        imagesc(fig6);
        colormap(jet); 
        axis image off  
        [f,p]=uiputfile({'*.fig'},'Save Files');
        str=strcat(p,f);
        savefig(figure(1),str);
    end
    
      
    if ~isempty(fff)
        fig7=reshape(fff,m,n);
        imagesc(fig7);
        colormap(jet); 
        axis image off  
        [f,p]=uiputfile({'*.fig'},'Save Files');
        str=strcat(p,f);
        savefig(figure(1),str);
    end
    
    if ~isempty(eee)
        fig8=reshape(eee,m,n);
        imagesc(fig8);
        colormap(jet); 
        axis image off  
        [f,p]=uiputfile({'*.fig'},'Save Files');
        str=strcat(p,f);
        savefig(figure(1),str);
    end   
    close gcf
end

if get(handles.checkbox4,'Value')==1
    clear aaa bbb ccc ddd eee fff ggg hhh f p str
    
    [fname,dirpath,index]=uiputfile({'*.mat','MATLAB Files(*.mat)'},'Save Data File');
    FNlength=length(fname);

    myfile=[dirpath fname];

    save (myfile, 'm','n');
    try
        fig1=reshape(aaa,m,n);
        save (myfile,'fig1','-append');
    end
    try
        fig2=reshape(bbb,m,n);
        save (myfile,'fig2','-append');
    end
    try
        fig3=reshape(ccc,m,n);
        save (myfile,'fig3','-append');
    end
    try
        fig4=reshape(ddd,m,n);
        save (myfile,'fig4','-append');
    end
    try
        fig5=reshape(hhh,m,n);
        save (myfile,'fig5','-append');
    end
    try
        fig6=reshape(ggg,m,n);
        save (myfile,'fig6','-append');
    end
    try
        fig7=reshape(fff,m,n);
        save (myfile,'fig7','-append');
    end
    try
        fig8=reshape(eee,m,n);
        save (myfile,'fig8','-append');
    end
end

clear aaa bbb ccc ddd eee fff ggg hhh f p str

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

axes(handles.axes6);
imagesc(fDataAve);
colormap(jet); 
axis image off;
set(handles.axes6,'YDir','reverse');


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


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
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
global Data2D
global m
global n
global aaa
global bbb
global ccc
global ddd
global eee
global fff
global ggg
global hhh
global k
global xAxis

Xaxis = xAxis(k(1):k(2));

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
    axes(handles.axes2);
    imagesc(reshape(aaa,m,n));
    colormap(jet); 
    axis image off;
    set(handles.axes2,'YDir','reverse');
end

if ~isempty(get(handles.edit2,'String'))
    a=str2double(get(handles.edit2,'String'));
    if (mod(a,2)==1)
        aa=find(Xaxis==(a+1));
        bbb=mean(Data2D(:,(aa-2):(aa+1)),2);
    else
        aa=find(Xaxis==a);
        bbb=mean(Data2D(:,(aa-2):(aa+2)),2);
    end
    axes(handles.axes3);
    imagesc(reshape(bbb,m,n));
    colormap(jet); 
    axis image off;
    set(handles.axes3,'YDir','reverse');
end

if ~isempty(get(handles.edit3,'String'))
    a=str2double(get(handles.edit3,'String'));
    if (mod(a,2)==1)
        aa=find(Xaxis==(a+1));
        ccc=mean(Data2D(:,(aa-2):(aa+1)),2);
    else
        aa=find(Xaxis==a);
        ccc=mean(Data2D(:,(aa-2):(aa+2)),2);
    end
    axes(handles.axes4);
    imagesc(reshape(ccc,m,n));
    colormap(jet); 
    axis image off;
    set(handles.axes4,'YDir','reverse');
end

if ~isempty(get(handles.edit4,'String'))
    a=str2double(get(handles.edit4,'String'));
    if (mod(a,2)==1)
        aa=find(Xaxis==(a+1));
        ddd=mean(Data2D(:,(aa-2):(aa+1)),2);
    else
        aa=find(Xaxis==a);
        ddd=mean(Data2D(:,(aa-2):(aa+2)),2);
    end
    axes(handles.axes5);
    imagesc(reshape(ddd,m,n));
    colormap(jet); 
    axis image off;
    set(handles.axes5,'YDir','reverse');
end

if ~isempty(get(handles.edit5,'String'))
    a=str2double(get(handles.edit5,'String'));
    if (mod(a,2)==1)
        aa=find(Xaxis==(a+1));
        eee=mean(Data2D(:,(aa-2):(aa+1)),2);
    else
        aa=find(Xaxis==a);
        eee=mean(Data2D(:,(aa-2):(aa+2)),2);
    end
    axes(handles.axes10);
    imagesc(reshape(eee,m,n));
    colormap(jet); 
    axis image off;
    set(handles.axes10,'YDir','reverse');
end

if ~isempty(get(handles.edit6,'String'))
    a=str2double(get(handles.edit6,'String'));
    if (mod(a,2)==1)
        aa=find(Xaxis==(a+1));
        fff=mean(Data2D(:,(aa-2):(aa+1)),2);
    else
        aa=find(Xaxis==a);
        fff=mean(Data2D(:,(aa-2):(aa+2)),2);
    end
    axes(handles.axes9);
    imagesc(reshape(fff,m,n));
    colormap(jet); 
    axis image off;
    set(handles.axes9,'YDir','reverse');
end

if ~isempty(get(handles.edit7,'String'))
    a=str2double(get(handles.edit7,'String'));
    if (mod(a,2)==1)
        aa=find(Xaxis==(a+1));
        ggg=mean(Data2D(:,(aa-2):(aa+1)),2);
    else
        aa=find(Xaxis==a);
        ggg=mean(Data2D(:,(aa-2):(aa+2)),2);
    end
    axes(handles.axes8);
    imagesc(reshape(ggg,m,n));
    colormap(jet); 
    axis image off;
    set(handles.axes8,'YDir','reverse');
end

if ~isempty(get(handles.edit8,'String'))
    a=str2double(get(handles.edit8,'String'));
    if (mod(a,2)==1)
        aa=find(Xaxis==(a+1));
        hhh=mean(Data2D(:,(aa-2):(aa+1)),2);
    else
        aa=find(Xaxis==a);
        hhh=mean(Data2D(:,(aa-2):(aa+2)),2);
    end
    axes(handles.axes7);
    imagesc(reshape(hhh,m,n));
    colormap(jet); 
    axis image off;
    set(handles.axes7,'YDir','reverse');
end
