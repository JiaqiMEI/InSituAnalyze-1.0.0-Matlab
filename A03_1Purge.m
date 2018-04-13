function varargout = A03_1Purge(varargin)
% A03_1PURGE MATLAB code for A03_1Purge.fig
%      A03_1PURGE, by itself, creates a new A03_1PURGE or raises the existing
%      singleton*.
%
%      H = A03_1PURGE returns the handle to a new A03_1PURGE or the handle to
%      the existing singleton*.
%
%      A03_1PURGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in A03_1PURGE.M with the given input arguments.
%
%      A03_1PURGE('Property','Value',...) creates a new A03_1PURGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before A03_1Purge_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to A03_1Purge_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help A03_1Purge

% Last Modified by GUIDE v2.5 03-Nov-2017 15:02:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @A03_1Purge_OpeningFcn, ...
                   'gui_OutputFcn',  @A03_1Purge_OutputFcn, ...
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


% --- Executes just before A03_1Purge is made visible.
function A03_1Purge_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to A03_1Purge (see VARARGIN)

%%%set windows middle
% set(hObject,'Units','pixels');
% figuresize=get(hObject,'Position');
% screensize=get(0,'screensize');
% set(gcf,'outerposition',[(screensize(3)-figuresize(3))/2,(screensize(4)-figuresize(4))/2,figuresize(3),figuresize(4)]);

% Choose default command line output for A03_1Purge
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global PurgeBefore
global PurgeAfter
PurgeAfter = PurgeBefore;

% UIWAIT makes A03_1Purge wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = A03_1Purge_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
global PurgeAfter
varargout{1}=PurgeAfter;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global PurgeAfter
global pos

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes1);
imagesc(PurgeAfter);
colormap(jet); 
axis image off;
set(handles.axes1,'YDir','reverse');

rect=getrect(handles.axes1);
pos=real(round(rect));
[m,n]=size(PurgeAfter);
edge=[m-pos(2),m-(pos(4)+pos(2)),n-pos(1),n-(pos(1)+pos(3))];
if ~isempty(find(edge<0, 1))
    errordlg('ERROR! Out of edge! Please capture again','ERROR');
    return
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global PurgeAfter
global pos

[m,n]=size(PurgeAfter);
edge=[m-pos(2),m-(pos(4)+pos(2)),n-pos(1),n-(pos(1)+pos(3))];
if ~isempty(find(edge<0, 1))
    errordlg('ERROR! Out of edge! Please capture again','ERROR');
    return
else
    PurgeAfter(pos(2):pos(4)+pos(2),pos(1):pos(1)+pos(3))=0;
end

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes1);
imagesc(PurgeAfter);
colormap(jet);
axis image off;
set(handles.axes1,'YDir','reverse');
clear pos


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global PurgeAfter
global PurgeBefore

PurgeAfter=PurgeBefore;

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes1);
imagesc(PurgeAfter);
colormap(jet); 
axis image off;
set(handles.axes1,'YDir','reverse');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global PurgeAfter

dilate=PurgeAfter;
se = strel('disk',1);
dilate = imdilate(dilate, se);

PurgeAfter = dilate;

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes1);
imagesc(PurgeAfter);
colormap(jet); 
axis image off;
set(handles.axes1,'YDir','reverse');


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%global PurgeStr
%set(PurgeStr,'Visible','on');
uiresume(handles.figure1);
closereq
