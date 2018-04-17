function varargout = A05_1SetPretreatment(varargin)
% A05_1SETPRETREATMENT MATLAB code for A05_1SetPretreatment.fig
%      A05_1SETPRETREATMENT, by itself, creates a new A05_1SETPRETREATMENT or raises the existing
%      singleton*.
%
%      H = A05_1SETPRETREATMENT returns the handle to a new A05_1SETPRETREATMENT or the handle to
%      the existing singleton*.
%
%      A05_1SETPRETREATMENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in A05_1SETPRETREATMENT.M with the given input arguments.
%
%      A05_1SETPRETREATMENT('Property','Value',...) creates a new A05_1SETPRETREATMENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before A05_1SetPretreatment_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to A05_1SetPretreatment_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help A05_1SetPretreatment

% Last Modified by GUIDE v2.5 29-Jan-2018 13:39:22



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
                   'gui_OpeningFcn', @A05_1SetPretreatment_OpeningFcn, ...
                   'gui_OutputFcn',  @A05_1SetPretreatment_OutputFcn, ...
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


% --- Executes just before A05_1SetPretreatment is made visible.
function A05_1SetPretreatment_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to A05_1SetPretreatment (see VARARGIN)

%%%set windows middle
% set(hObject,'Units','pixels');
% figuresize=get(hObject,'Position');
% screensize=get(0,'screensize');
% set(gcf,'outerposition',[(screensize(3)-figuresize(3))/2,(screensize(4)-figuresize(4))/2,figuresize(3),figuresize(4)]);

% Choose default command line output for A05_1SetPretreatment
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes A05_1SetPretreatment wait for user response (see UIRESUME)
%uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = A05_1SetPretreatment_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

global a;
a = [];
set(hObject,'string',a);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
global i;
global clickon;

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

if isempty(clickon)
    selected_index = get(handles.listbox1,'value');%Get Value for Choosed
    
    if selected_index == 1 
        A07SetBaseline;
        str = get(handles.listbox1,'string');
        i = length(a)+1;
        a{i} = str{selected_index};
        i = i+1;
        set(handles.listbox2,'string',a);
        
    elseif selected_index == 3 
        A08SetDerivative;
        str = get(handles.listbox1,'string');
        i = length(a)+1;
        a{i} = str{selected_index};
        i = i+1;
        set(handles.listbox2,'string',a);
        
    elseif  selected_index == 4
        A09SetSmoothing;
        str = get(handles.listbox1,'string');
        i = length(a)+1;
        a{i} = str{selected_index};
        i = i+1;
        set(handles.listbox2,'string',a);
        
    else
        str = get(handles.listbox1,'string');
        i = length(a)+1;
        a{i} = str{selected_index};
        i = i+1;
        set(handles.listbox2,'string',a);
    end
else
    a = a;
    selected_index = get(handles.listbox1,'value');%Get value for Choosed
    
    if selected_index == 1 
        A07SetBaseline;
        str = get(handles.listbox1,'string');
        i = length(a)+1;
        a{i} = str{selected_index};
        i = i+1;
        set(handles.listbox2,'string',a);
    
    elseif selected_index == 3 
        A08SetDerivative;
        str = get(handles.listbox1,'string');
        i = length(a)+1;
        a{i} = str{selected_index};
        i = i+1;
        set(handles.listbox2,'string',a);
        
    elseif  selected_index == 4
        A09SetSmoothing;
        str = get(handles.listbox1,'string');
        i = length(a)+1;
        a{i} = str{selected_index};
        i = i+1;
        set(handles.listbox2,'string',a);
        
    else
        str = get(handles.listbox1,'string');
        i = length(a)+1;
        a{i} = str{selected_index};
        i = i+1;
        set(handles.listbox2,'string',a);
    end
end
clickon = [];


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
% a = [];
% set(handles.listbox2,'string',a);
% axes(handles.axes2);
% cla reset

global clickon;
clickon = 1;

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

L = get(handles.listbox2,{'string','value'}) ; % Get the users choice.
delnum(clickon,1) = L{1,2}(1,:);
if ~isempty(L{1})
    L{1}(L{2}(:)) = [];  % Delete the selected strings.
    set(handles.listbox2,'string',L{1},'val',1) % Set the new string.
%     if ~isempty(L{1,1})
%     mid = L{1,1}(:,1);
%    [m,n] = size(mid);
%         for i=1:m
%             newstr1(i,1) = str2num(cell2mat(mid(i,1)));
%         end
%     end
end
a = L{1};


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global SpData;
global Xaxis
global k
global xAxis
global Data2D
global SpDataP
global Data2DP
global inputwidths
global inputorders
global inputwidth
global inputorder
global inputderiv
global lambda
global p
global a
global fData2D

if isempty(SpData)
    errordlg('ERROR! No Reference Spectrum!','ERROR');
    return;
end

Xaxis = xAxis(k(1):k(2));
%SpDataN = SpData(:,k(1):k(2));        
%clear SpData
%SpData = SpDataN;
%clear SpDataN
Data2D = fData2D(:,k(1):k(2));

kk=getappdata(0,'kk');
if kk==2
    SpDataN = SpData(:,k(1):k(2));        
    clear SpData
    SpData = SpDataN;
    clear SpDataN
end

%%%get current_GUI handles(when not only one GUI has axes)
%handles = guihandles(gcf);
%axes(handles.axes1);
%plot(Xaxis,SpData);    
%xlabel('WaveNumber/cm-1');
%ylabel('Absorbance/A');
%axis([min(Xaxis) max(Xaxis) -0.2 1.2]);
%set(handles.axes1,'XTick',[min(Xaxis):200:max(Xaxis)]);
%set(handles.axes1,'XDir','reverse');
%set(handles.axes1,'YTick',[-0.2:0.2:1.2]);

x = SpData;
y = Data2D;
num = length(a);
if num == 0
       msgbox('Choosing Pre-processing Method','Hint','warn'); 
       return;
end
for i=1:length(a)
    switch a{i}
        
    case 'Baseline'
        hBar=waitbar(0,'Calculating for Baseline, please wait...');
        [x_awf,bg]=asymcorr(x,lambda,p);
        x = x_awf;
        [y_awf,bg]=asymcorr(y,lambda,p);
        y = y_awf;
        waitbar(1,hBar,'Done for Baseline');
        delete(hBar);
        
    case 'SNV'
        hBar=waitbar(0,'Calculating for SNV, please wait...');
        [x_snv] = snv(x);
        x = x_snv;
        [y_snv] = snv(y);
        y = y_snv;
        waitbar(1,hBar,'Done for SNV');
        delete(hBar);
        
    case 'S-G Derivative'
       width=inputwidth;order=inputorder;deriv=inputderiv;
       hBar=waitbar(0,'Calculating for S-G Derivative, please wait...');
       [x_sg]= sav_gol(x,width,order,deriv);
       x = x_sg;
       [y_sg]= sav_gol(y,width,order,deriv);
       y = y_sg;
       waitbar(1,hBar,'Done for S-G Derivative');
       delete(hBar);
       
    case 'S-G Smoothing'
       width=inputwidths;order=inputorders;deriv=0;
       hBar=waitbar(0,'Calculating for S-G Smoothing, please wait...');
       [x_sg]= sav_gol(x,width,order,deriv);
       x = x_sg;
       [y_sg]= sav_gol(y,width,order,deriv);
       y = y_sg;
       waitbar(1,hBar,'Done for S-G Smoothing');
       delete(hBar);
       
    case 'Normalize'
       hBar=waitbar(0,'Calculating for Normalize, please wait...');
       [xnorm,norms] = normaliz(x,[],1);
       x = xnorm;
       [ynorm,norms] = normaliz(y,[],1);
       y = ynorm;   
       waitbar(1,hBar,'Done for Normalize');
       delete(hBar);
       
    case 'MSC'
       hBar=waitbar(0,'Calculating for MSC, please wait...');
       xref = mean(x);
       [x_msc]=MSC(x,xref);
       x = x_msc;
       yref = mean(y);
       [y_msc]=MSC(y,yref);
       y = y_msc;
       waitbar(1,hBar,'Done for MSC');
       delete(hBar);
        
    case 'Meancenter'
       hBar=waitbar(0,'Calculating for Meancenter, please wait...');
       [mcx,mx] = Center(x);
       x = mcx;
       [mcy,my] = Center(y);
       y = mcy;
       waitbar(1,hBar,'Done for Meancenter');
       delete(hBar);
       
    case 'Autoscale'
       hBar=waitbar(0,'Calculating for Autoscale, please wait...');
       [ax,mx,stdx] = Auto(x);
       x = ax;
       [ay,my,stdy] = Auto(y);
       y = ay;
       waitbar(1,hBar,'Done for Autoscale');
       delete(hBar);
        
    case 'None'
       x = x; 
       y = y;
    end
end

SpDataP = x;
Data2DP = y;

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);
axes(handles.axes2);
plot(Xaxis,SpDataP);    
xlabel('WaveNumber/cm-1');
ylabel('Absorbance/A');
axis([min(Xaxis) max(Xaxis) -0.2 1.2]);
set(handles.axes2,'XTick',[min(Xaxis):200:max(Xaxis)]);
set(handles.axes2,'XDir','reverse');
set(handles.axes2,'YTick',[-0.2:0.2:1.2]);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%get current_GUI handles(when not only one GUI has axes)
%handles = guihandles(gcf);    
%uiresume(handles.figure1);
close gcf


%-----------------Pre-process Methods
function [ycorr,bg]=asymcorr(y,lambda,p)
% Method for Baseline From Eilers Anal Chem 2005
% lambda = smoothness
% p = asymmetry

starttime = now;
maxtime = 600;

[m,n]=size(y);
p = min((1-1e-10),p);  %keep p <1

D = diff(speye(n), 2);
DtD = lambda * (D' * D);

bg    = y;
w = ones(n, 1);
for j=1:m
  
  y1 = y(j,:)';
  for it = 1:20
    W = spdiags(w, 0, n, n);
    [C,ok] = chol(W + DtD);
    z = C \ (C' \ (w .* y1));
    w_old = w;
    w = p * (y1 > z) + (1 - p) * (y1 <= z);
    if all(w_old == w);
      break;
    end
  end
  bg(j,:)    = z';
  
  if (now-starttime)*60*60*24 > maxtime; break; end

end
ycorr = y - bg;


function [ax,mx,stdx] = Auto(x)
% Autoscales matrix to zero mean and unit variance
% [ax,mx,stdx] = auto(x)
% input:
% x 	data to autoscale
% output:
% ax	autoscaled data
% mx	means of data
% stdx	stantard deviations of data
% By Cleiton A. Nunes
% UFLA,MG,Brazil
[m,n] = size(x);
mx    = mean(x);
stdx  = std(x);
ax    = (x-mx(ones(m,1),:))./stdx(ones(m,1),:);


function [mcx,mx] = Center(x)
% Mean center scales matrix to zero mean
% [mcx,mx] = center(x)
% input:
% x 	data to mean center
% output:
% ax	mean center data
% mx	means of data
% By Cleiton A. Nunes
% UFLA,MG,Brazil
[m,n] = size(x);
mx    = mean(x);
mcx   = (x-mx(ones(m,1),:));


function [x_msc]=MSC(x,xref)
% Multiplicative Scatter Correction
% [x_msc]=msc(x,xref)
% input 
% x (samples x variables)      spectra to correct
% xref (1 x variables)         reference spectra (in general mean(x) is used)
% Output
% x_msc (samples x variables)  corrected spectra  
% By Cleiton A. Nunes
% UFLA,MG,Brazil
[m n]=size(x);
rs=xref;
cw=ones(1,n);
mz=[];mz=[mz ones(1,n)'];mz=[mz rs'];
[mm,nm]=size(mz);
wmz=mz.*(cw'*ones(1,nm));
wz=x.*(ones(m,1)*cw);
z=wmz'*wmz;
[u,s,v]=svd(z);sd=diag(s)'; 
cn=10^12;
ms=sd(1)/sqrt(cn);
cs=max(sd,ms ); 
cz=u*(diag(cs))*v';  
zi=inv(cz);
b=zi*wmz'*wz';B=b';
x_msc=x; 
p=B(:,1);x_msc=x_msc-(p*ones(1,mm));
p=B(:,2);x_msc=x_msc./(p*ones(mm,1)');


function [dat,norms] = normaliz(dat,out,normtype,window)
%NORMALIZ Normalize rows of matrix.
%  This function can be used for pattern normalization, which is useful for
%  preprocessing in some pattern recognition applications and also for
%  correction of pathlength effects for some quantification applications.
%
% INPUTS:
%         dat = the data matrix
% OPTIONAL INPUTS:
%         out = a flag which suppress warnings when set to 0 {default = 0}
%    normtype = the type of norm to use {default = 2}. The following are
%               typical values of normtype:
%                normtype       description              norm
%                  1       normalize to unit area       sum(abs(dat))
%                  2       normalize to unit LENGTH     sqrt(sum(dat^2))
%                  inf     normalize to maximum value   max(dat)
%               Generically, for row i of dat:
%                 norms(i) = sum(abs(dat(i,:)).^normtype)^(1/normtype)
%               If (normtype) is specified then (out) must be included,
%               although it can be empty [].
%      window = indicies which should be used to calculate the norm.
% ALTERNATIVE INPUT:
%     options = An options structure can be passed as third input along
%               with (dat) and (normtype). This input takes the place 
%               of the remaining inputs and should contain one or more of
%               the following fields: 
%          display : [ 'off' |{'on'}] controls display (replacement for
%                     (out) input above)
%          window  : [] replacement for standard (window) input above.
% OUTPUTS: 
%    ndat = the matrix of normalized data where the rows have been normalized. 
%   norms = the vector of norms used for normalization of each row.
%
% Unless out = 0, warnings are given when any vectors have zero norm.
%
%Example: [ndat,norms] = normaliz(x,[],1);
%
%%I/O:  [ndat,norms] = normaliz(dat,out,normtype,window);
%I/O:  [ndat,norms] = normaliz(dat,normtype,options);
%

% Copyright ?Eigenvector Research, Inc. 1997-2015
% Licensee shall not re-compile, translate or convert "M-files" contained
%  in PLS_Toolbox for use with any software other than MATLAB? without
%  written permission from Eigenvector Research, Inc.


if nargin == 0; dat = 'io'; end
if ischar(dat)
  options = [];
  options.display = 'on';
  options.window  = [];
  if nargout==0; evriio(mfilename,dat,options); clear dat; else; dat = evriio(mfilename,dat,options); end
  return; 
end

if nargin<2 || isempty(out)
  out = 0;
end
if nargin==2 && isstruct(out)
  %I/O:   (data,options)
  options  = reconopts(out,mfilename);
  out      = strcmp(options.display,'on');
  window   = options.window;
  normtype = [];
elseif nargin==3 && isstruct(normtype)
  %I/O:   (data,normtype,options)
  options = reconopts(normtype,mfilename);
  normtype = out;
  out      = strcmp(options.display,'on');
  window   = options.window;
else
  %other I/O:
  if nargin == 2 && out > 1;
    error('Unrecognized input option for ''out''');
  end
  if nargin<3
    normtype = [];
  end
  if nargin<4
    window = [];
  end
end

%default values for missing inputs
if isempty(normtype)
  normtype = 2;
end
origsize = size(dat);
if isempty(window)
  window = 1:prod(origsize(2:end));
end

if length(origsize)>2
  dat = dat(:,:);
end

%make sure window is valid
window = intersect(window,1:prod(origsize(2:end))); 
if isempty(window)
  error('All normalization window points are excluded')
end

%calculate norms (but use loop to avoid memory hogging)
sampwinsize = 100;
norms = zeros(size(dat,1),1);
for j=1:sampwinsize:size(dat,1)
  sampwin = j:min(size(dat,1),j+sampwinsize-1);
  fdat = dat(sampwin,window);
  switch normtype
    case 1
      fdat(~isfinite(fdat)) = 0;  %missing data can be replaced with zero
      norms(sampwin,1) = sum(abs(fdat),2);
    case inf
      norms(sampwin,1) = max(abs(fdat),[],2);
    otherwise
      fdat(~isfinite(fdat)) = 0;  %missing data can be replaced with zero
      norms(sampwin,1) = sum(abs(fdat).^normtype,2).^(1/normtype);
  end
end


%locate any zero norms
ii    = find(norms==0);
if ~isempty(ii) && out
  if length(ii)==1
    fprintf('The norm of sample %g is zero; sample not normalized\n',ii)
  else
    fprintf('%g samples have a norm of zero and were not normalized\n',length(ii))
  end
end
ii    = find(norms~=0);

%normalize data
if length(ii)<50  %fewer than n samples? use matrix
  dat(ii,:) = dat(ii,:)./norms(ii,ones(1,size(dat,2)));
else   %otherwise use loop
  for ij = ii(:)'
    dat(ij,:) = dat(ij,:)./norms(ij,1);
  end
end

if length(origsize)>2
  dat = reshape(dat,origsize);
end


function [x_sg]= sav_gol(x,width,order,deriv)
% Savitsky-Golay smoothing and differentiation
% [x_sg]= savgol(x,width,order,deriv)
% input:
% x (samples x variables) data to preprocess
% width (1 x 1)           number of points (optional, default=15)
% order (1 x 1)           polynomial order (optional, default=2)
% deriv (1 x 1)           derivative order (optional, default=0)
% output:
% x_sg (samples x variables) preprocessed data
% By Cleiton A. Nunes
% UFLA,MG,Brazil
[m,n]=size(x);
x_sg=x;
if nargin<4
  deriv=0;
end
if nargin<3
  order=2; 
end
if nargin<2
  width=min(15,floor(n/2)); 
end
w=max( 3, 1+2*round((width-1)/2) );
o=min([max(0,round(order)),5,w-1]);
d=min(max(0,round(deriv)),o);
p=(w-1)/2;
xc=((-p:p)'*ones(1,1+o)).^(ones(size(1:w))'*(0:o));
we=xc\eye(w);
b=prod(ones(d,1)*[1:o+1-d]+[0:d-1]'*ones(1,o+1-d,1),1);
di=spdiags(ones(n,1)*we(d+1,:)*b(1),p:-1:-p,n,n);
w1=diag(b)*we(d+1:o+1,:);
di(1:w,1:p+1)=[xc(1:p+1,1:1+o-d)*w1]'; 
di(n-w+1:n,n-p:n)=[xc(p+1:w,1:1+o-d)*w1]';
x_sg=x*di;


function [x_snv] = snv(x)
% Standard Normal Variate
% [x_snv] = snv(x) 
% input:
% x (samples x variables) data to preprocess
% output:
% x_snv (samples x variables) preprocessed data
% By Cleiton A. Nunes
% UFLA,MG,Brazil
[m,n]=size(x);
rmean=mean(x,2);
dr=x-repmat(rmean,1,n);
x_snv=dr./repmat(sqrt(sum(dr.^2,2)/(n-1)),1,n);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Xaxis
global xAxis
global SpData
global k
global Data2D
global fData2D

[fname, dirpath]=uigetfile({'*.mat','MATLAB Files(*.mat)'},'Choose the Reference Spectrum ');
FNlength=length(fname);
if FNlength<5
    errordlg('ERROR! No file loaded!','ERROR');
    return;
end

hBar=waitbar(0,'Loading for Reference Spectrum, please wait...');
myfile=[dirpath fname];
loaddata = load(myfile);
if length(loaddata)~=1 
    errordlg('ERROR! Wrong Num of matrix!','ERROR');
end
loaddata1 = struct2cell(loaddata);
SpData = loaddata1{1,1};
waitbar(1,hBar,'Done for Reference Spectrum');

pause(1);
if ishandle(hBar)
    delete(hBar);
end  

%%%Intercepted characteristic band
button = questdlg('Whether the characteristic band has been intercepted?','Question','Yes','No','Yes');
if strcmp(button,'Yes')
    kk=1;
    A06SetSpEnd;
    close A06SetSpEnd
    k =getappdata(0,'End');    
    clear Data2D Xaxis
    Data2D = fData2D(:,k(1):k(2));
    Xaxis = xAxis(k(1):k(2));
elseif strcmp(button,'No')
    button = questdlg('Intercepting characteristic band NOW?','Question','Yes','No','Yes');
    if strcmp(button,'Yes')
        kk=2;
        A06SetSpEnd;
        close A06SetSpEnd
        k =getappdata(0,'End');        
        Data2D = fData2D(:,k(1):k(2));
        Xaxis = xAxis(k(1):k(2));
        SpDataN = SpData(:,k(1):k(2));        
        clear SpData
        SpData = SpDataN;
        clear SpDataN
    else
        kk=3;
        k(1)=1;
        k(2)=size(Data2D,2);
        Xaxis = xAxis(:,k(1):k(2));
        Data2D = fData2D(:,k(1):k(2));
    end        
end

setappdata(0,'kk',kk);

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes1);
plot(Xaxis,SpData);    
xlabel('Wavenumber/cm-1');
ylabel('Absorbance/A');
axis([min(Xaxis) max(Xaxis) -0.2 1.2]);
set(handles.axes1,'XTick',[min(Xaxis):200:max(Xaxis)]);
set(handles.axes1,'XDir','reverse');
set(handles.axes1,'YTick',[-0.2:0.2:1.2]);
