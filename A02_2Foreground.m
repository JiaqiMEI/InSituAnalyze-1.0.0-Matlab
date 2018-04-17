function varargout = A02_2Foreground(varargin)
% A02_2FOREGROUND MATLAB code for A02_2Foreground.fig
%      A02_2FOREGROUND, by itself, creates a new A02_2FOREGROUND or raises the existing
%      singleton*.
%
%      H = A02_2FOREGROUND returns the handle to a new A02_2FOREGROUND or the handle to
%      the existing singleton*.
%
%      A02_2FOREGROUND('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in A02_2FOREGROUND.M with the given input arguments.
%
%      A02_2FOREGROUND('Property','Value',...) creates a new A02_2FOREGROUND or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before A02_2Foreground_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to A02_2Foreground_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help A02_2Foreground

% Last Modified by GUIDE v2.5 31-Oct-2017 13:43:59


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
                   'gui_OpeningFcn', @A02_2Foreground_OpeningFcn, ...
                   'gui_OutputFcn',  @A02_2Foreground_OutputFcn, ...
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


% --- Executes just before A02_2Foreground is made visible.
function A02_2Foreground_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to A02_2Foreground (see VARARGIN)

%%%set windows middle
% set(hObject,'Units','pixels');
% figuresize=get(hObject,'Position');
% screensize=get(0,'screensize');
% set(gcf,'outerposition',[(screensize(3)-figuresize(3))/2,(screensize(4)-figuresize(4))/2,figuresize(3),figuresize(4)]);

% Choose default command line output for A02_2Foreground
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes A02_2Foreground wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = A02_2Foreground_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
global fore
varargout{1}=fore;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fDataAve
global iteration
global homogeneity
global Distance
global local
global Otus
global comentropy
global CN

[m,n]=size(fDataAve);

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

CN=0;

%%%Iteration
try
if get(handles.checkbox1,'Value')==1    
    CN=CN+1;
    hBar=waitbar(0,'Calculating for Iteration, please wait...');

    T=0.3*(min(fDataAve(:))+max(fDataAve(:)));
    done=false;
    while ~done
        g=fDataAve>=T;
        Tn=0.5*(mean(fDataAve(g))+mean(fDataAve(~g)));
        done=abs(T-Tn)<0.001;
        T=Tn;
    end
    iteration=fDataAve;
    iteration(iteration>=T)=1;iteration(iteration<T)=0;

    waitbar(1,hBar,'Done for Iteration');
    delete(hBar);

    axes(handles.axes1)
    imagesc(iteration); 
    colormap(jet);
    axis image;
    set(handles.axes1,'YDir','reverse');
end
end


%%%homogeneity
try
if get(handles.checkbox2,'Value')==1
    CN=CN+1;
    hBar=waitbar(0,'Calculating for Homogeneity, please wait...');

    Smin=-1;
    p=min(fDataAve);
    q=max(fDataAve);
    for T=p:(p+q)/10000:q
        sum1=0;	num1=0;
        sum2=0;	num2=0;
        for i=1:m
            for j=1:n
                if fDataAve(i,j)>=T
                    sum2=sum2+fDataAve(i,j);
                    num2=num2+1;
                else
                    sum1=sum1+fDataAve(i,j);
                    num1=num1+1;
                end
            end
        end
        ave1=sum1/num1;
        ave2=sum2/num2;
        d1=-1;
        d2=-1;
        for i=1:m
            for j=1:n
                if fDataAve(i,j)>=T
                    d=(fDataAve(i,j)-ave2)^2;
                    if d2==-1
                        d2=d;
                    else
                        d2=d2+d;
                    end
                else
                    d=(fDataAve(i,j)-ave1)^2;
                    if d1==-1
                        d1=d;
                    else
                        d1=d1+d;
                    end
                end
            end	
        end
        p1=num1/(m*n);
        p2=num2/(m*n);
        S=p1*d1+p2*d2;
        if (Smin==-1)
            Smin=S;
        else
            if(S<Smin) 
                Smin=S; 
                Th=T; 
            end 
        end
    end
    homogeneity=fDataAve;
    homogeneity(homogeneity>=Th)=1;homogeneity(homogeneity<Th)=0;

    waitbar(1,hBar,'Done for Homogeneity');
    delete(hBar);

    axes(handles.axes2);
    imagesc(homogeneity);
    colormap(jet);
    axis image off;
    set(handles.axes2,'YDir','reverse');
end
end


%%%The maximum distance method between classes.
try
if get(handles.checkbox3,'Value')==1
    CN=CN+1;
    hBar=waitbar(0,'Calculating for Distance, please wait...');

    Smax=0;
    p=min(fDataAve);
    q=max(fDataAve);
    for T=p:(p+q)/10000:q
        sum1=0;	num1=0;
        sum2=0;	num2=0;
        for i=1:m
            for j=1:n
                if fDataAve(i,j)>=T
                    sum2=sum2+fDataAve(i,j);
                    num2=num2+1;
                else
                    sum1=sum1+fDataAve(i,j);
                    num1=num1+1;
                end
            end
        end
        ave1=sum1/num1;
        ave2=sum2/num1;
        S=((ave2-T)*(T-ave1))/(ave2-ave1)^2;
        if (S>Smax)
            Smax=S;
            Th=T;
        end
    end
    Distance=fDataAve;
    Distance(Distance>=Th)=1;Distance(Distance<Th)=0;

    waitbar(1,hBar,'Done for Distance');
    delete(hBar);

    axes(handles.axes3);
    imagesc(Distance);
    colormap(jet);
    axis image off;
    set(handles.axes3,'YDir','reverse');
end
end


%%%Local Thresholding
try
if get(handles.checkbox4,'Value')==1
    CN=CN+1;
    hBar=waitbar(0,'Calculating for Local Threshold, please wait...');

    se=strel('disk',5);
    ft=imtophat(fDataAve,se);
    Th=graythresh(ft);
    local=fDataAve;
    local(local>=Th)=1;local(local<Th)=0;

    waitbar(1,hBar,'Done for Local Threshold');
    delete(hBar);

    axes(handles.axes5);
    imagesc(local);
    colormap(jet);
    axis image off;
    set(handles.axes5,'YDir','reverse');
end
end


%%OTSU
try
if get(handles.checkbox5,'Value')==1
    CN=CN+1;
    hBar=waitbar(0,'Calculating for OTSU,please wait...');

    B=mapminmax(fDataAve,0,255);
    for i=1:m
        for j=1:n
            if B(i,j)~=0
                C(i,j)=ceil(B(i,j))-1;
            end
        end
    end
    count=zeros(256,1);
    pcount=zeros(256,1);
    for i=1:m
        for j=1:n
            pixel=C(i,j);
            count(pixel+1)=count(pixel+1)+1;
        end
    end
    dw=0;
    for i=0:255
        pcount(i+1)=count(i+1)/(m*n);
        dw=dw+i*pcount(i+1);
    end
    Th=0;Thbest=0;
    dfc=0;dfcmax=0;
    while(Th>=0 && Th<=255)
        dp1=0;
        dw1=0;
        for i=0:Th
            dp1=dp1+pcount(i+1);
            dw1=dw1+i*pcount(i+1);
        end
	
        if dp1>0
            dw1=dw1/dp1;
        end	
        dp2=0;
        dw2=0;	
        for i=Th+1:255
            dp2=dp2+pcount(i+1);
            dw2=dw2+i*pcount(i+1);
        end
        if dp2>0
            dw2=dw2/dp2;
        end	
        dfc=dp1*(dw1-dw)^2+dp2*(dw2-dw)^2;	
        if dfc>=dfcmax
            dfcmax=dfc;
            Thbest=Th;
        end
        Th=Th+1;
    end
    T=Thbest;
    Otus=C;
    Otus(Otus<=T)=0;Otus(Otus>T)=1;

    waitbar(1,hBar,'Done for OTSU');
    delete(hBar);

    axes(handles.axes6);
    imagesc(Otus);
    colormap(jet);
    axis image off;
    set(handles.axes6,'YDir','reverse');
end
end


%%maximum entropy
try
if get(handles.checkbox6,'Value')==1
    CN=CN+1;
    hBar=waitbar(0,'Calculating for entropy, please wait...');

    h=imhist(fDataAve);
    h1=h;
    len=length(h);
    h1=h1/(m*n);
    for i=1:(len-1)
        if h(i)~=0
            P1=sum(h1(1:i));
            P2=sum(h1(i+1):len);
        else
            continue;
        end
        H1(i)=-(sum(P1.*log(P1)));
        H2(i)=-(sum(P2.*log(P2)));
        H(i)=H1(i)+H2(i);
    end
    m1=max(H);
    p=(find(H==max(H)));
    
    r=size(p,2);   
    if r-1
       for j=1:r-1
          cp(j)=p(j+1)-p(j);
       end
        q=find(cp==max(cp));    
        PP=sum(h(1:p(q+1)));
    else
        PP=sum(h(1:p));
    end    
    
    k=sort(reshape(fDataAve,m*n,1));   
        
    if PP==0
        waitbar(1,hBar,'Done for entropy');
        delete(hBar);
        warndlg('Cannot find suitable entropy ','WARNING')
    else
        Th=k(PP);
        comentropy=fDataAve;
        comentropy(comentropy>=Th)=1;comentropy(comentropy<Th)=0;
        
        waitbar(1,hBar,'Done for entropy');
        delete(hBar);

        axes(handles.axes7);
        imagesc(comentropy);
        colormap(jet);
        axis image off;
        set(handles.axes7,'YDir','reverse');        
    end
end 
end

if CN==0
    errordlg('ERROR! No method for Foreground extraction!','ERROR'); 
    return
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fore
global iteration

global QQ
QQ=1;

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

set(handles.radiobutton1,'Value',1);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton5,'Value',0);
set(handles.radiobutton6,'Value',0);
set(handles.radiobutton7,'Value',0);
fore=iteration;

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fore
global homogeneity

global QQ
QQ=1;

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',1);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton5,'Value',0);
set(handles.radiobutton6,'Value',0);
set(handles.radiobutton7,'Value',0);
fore=homogeneity;

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fore
global Distance

global QQ
QQ=1;

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',1);
set(handles.radiobutton5,'Value',0);
set(handles.radiobutton6,'Value',0);
set(handles.radiobutton7,'Value',0);
fore=Distance;

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fore
global local

global QQ
QQ=1;

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton5,'Value',1);
set(handles.radiobutton6,'Value',0);
set(handles.radiobutton7,'Value',0);
fore=local;

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fore
global Otus

global QQ
QQ=1;

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton5,'Value',0);
set(handles.radiobutton6,'Value',1);
set(handles.radiobutton7,'Value',0);
fore=Otus;

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fore
global comentropy

global QQ
QQ=1;

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

set(handles.radiobutton1,'Value',0);
set(handles.radiobutton2,'Value',0);
set(handles.radiobutton3,'Value',0);
set(handles.radiobutton5,'Value',0);
set(handles.radiobutton6,'Value',0);
set(handles.radiobutton7,'Value',1);
fore=comentropy;

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fDataAve
%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes4)
imshow(fDataAve);
colormap(jet);
axis image off
set(handles.axes4,'YDir','reverse');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global CN
global QQ

if CN==0
    errordlg('ERROR! Not extract Foreground yet!','ERROR'); 
    return
end

if ~QQ
    errordlg('ERROR! No Foreground selected','ERROR');
    return
end

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

clear iteration homogeneity Distance local Otus comentropy
%set(A01_2Main,'Visible','on');
uiresume(handles.figure1);
closereq


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
