function varargout = A00Welcome(varargin)
% A00WELCOME MATLAB code for A00Welcome.fig
%      A00WELCOME, by itself, creates a new A00WELCOME or raises the existing
%      singleton*.
%
%      H = A00WELCOME returns the handle to a new A00WELCOME or the handle to
%      the existing singleton*.
%
%      A00WELCOME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in A00WELCOME.M with the given input arguments.
%
%      A00WELCOME('Property','Value',...) creates a new A00WELCOME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before A00Welcome_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to A00Welcome_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help A00Welcome

% Last Modified by GUIDE v2.5 12-Sep-2017 16:19:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @A00Welcome_OpeningFcn, ...
                   'gui_OutputFcn',  @A00Welcome_OutputFcn, ...
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


% --- Executes just before A00Welcome is made visible.
function A00Welcome_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to A00Welcome (see VARARGIN)

% Choose default command line output for A00Welcome
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes A00Welcome wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = A00Welcome_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

set(handles.radiobutton1,'Value',1);
set(handles.radiobutton2,'Value',0);


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',1);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

if get(handles.radiobutton1,'Value');
    close gcf
    open A01_1Main.fig
elseif get(handles.radiobutton2,'Value');
    close gcf
    open A01_2Main.fig
else
    errordlg('Please choose the type for image data!','No type for image data');
    return;
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
clear all
clc
