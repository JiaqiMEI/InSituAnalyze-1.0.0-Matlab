function varargout = A08SetDerivative(varargin)
% A08SETDERIVATIVE MATLAB code for A08SetDerivative.fig
%      A08SETDERIVATIVE, by itself, creates a new A08SETDERIVATIVE or raises the existing
%      singleton*.
%
%      H = A08SETDERIVATIVE returns the handle to a new A08SETDERIVATIVE or the handle to
%      the existing singleton*.
%
%      A08SETDERIVATIVE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in A08SETDERIVATIVE.M with the given input arguments.
%
%      A08SETDERIVATIVE('Property','Value',...) creates a new A08SETDERIVATIVE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before A08SetDerivative_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to A08SetDerivative_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help A08SetDerivative

% Last Modified by GUIDE v2.5 19-Jan-2018 12:40:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @A08SetDerivative_OpeningFcn, ...
                   'gui_OutputFcn',  @A08SetDerivative_OutputFcn, ...
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

% --- Executes just before A08SetDerivative is made visible.
function A08SetDerivative_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to A08SetDerivative (see VARARGIN)

% ´°¿Ú¾ÓÖÐ
% set(hObject,'Units','pixels');
% figuresize=get(hObject,'Position');
% screensize=get(0,'screensize');
% set(gcf,'outerposition',[(screensize(3)-figuresize(3))/2,(screensize(4)-figuresize(4))/2,figuresize(3),figuresize(4)]);

% Choose default command line output for A08SetDerivative
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes A08SetDerivative wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = A08SetDerivative_OutputFcn(hObject, eventdata, handles) 
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

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global inputwidth
global inputorder
global inputderiv
global h1  h2  h3
inputwidth = str2double(get(handles.edit1,'string'));
remainder = mod(inputwidth,2);
inputorder = str2double(get(handles.edit2,'string'));
inputderiv = str2double(get(handles.edit3,'string'));
h1 = get(handles.edit1,'string');
h2 = get(handles.edit2,'string');
h3 = get(handles.edit3,'string');
if remainder == 0 || inputwidth < 3
     msgbox('Please enter an odd number greater than 3','Error','warn');
else
    if isempty(h1) == 1 || isempty(h2) == 1 || isempty(h3) == 1
    msgbox('Please input parameters','Error','warn');
    else
         close(gcf);
    end
end
