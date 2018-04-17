function varargout = A14_2FNNLS(varargin)
% A14_2FNNLS MATLAB code for A14_2FNNLS.fig
%      A14_2FNNLS, by itself, creates a new A14_2FNNLS or raises the existing
%      singleton*.
%
%      H = A14_2FNNLS returns the handle to a new A14_2FNNLS or the handle to
%      the existing singleton*.
%
%      A14_2FNNLS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in A14_2FNNLS.M with the given input arguments.
%
%      A14_2FNNLS('Property','Value',...) creates a new A14_2FNNLS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before A14_2FNNLS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to A14_2FNNLS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help A14_2FNNLS

% Last Modified by GUIDE v2.5 19-Jan-2018 12:45:23



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
                   'gui_OpeningFcn', @A14_2FNNLS_OpeningFcn, ...
                   'gui_OutputFcn',  @A14_2FNNLS_OutputFcn, ...
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


% --- Executes just before A14_2FNNLS is made visible.
function A14_2FNNLS_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to A14_2FNNLS (see VARARGIN)

%%%set windows middle
% set(hObject,'Units','pixels');
% figuresize=get(hObject,'Position');
% screensize=get(0,'screensize');
% set(gcf,'outerposition',[(screensize(3)-figuresize(3))/2,(screensize(4)-figuresize(4))/2,figuresize(3),figuresize(4)]);

% Choose default command line output for A14_2FNNLS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes A14_2FNNLS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = A14_2FNNLS_OutputFcn(hObject, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Calculating for FNNLS and fig
global SpDataP
global Data2DP
global m
global n
global b

%fastnnls calculating
hBar=waitbar(0,'Calculating for fastnnls, please wait...');

[b,xi]=f_nnls(SpDataP',Data2DP');
b=b';

waitbar(1,hBar,'Calculating for fastnnls, please wait...');

pause(1);
if ishandle(hBar)
    delete(hBar);
end

%%%get current_GUI handles(when not only one GUI has axes)
handles = guihandles(gcf);

axes(handles.axes3);
imagesc(reshape(b(:,1),m,n));
colormap(jet); 
axis image off;
set(handles.axes3,'YDir','reverse');
set(handles.axes3,'CLim',[0,1]);

try
    axes(handles.axes4);
    imagesc(reshape(b(:,2),m,n));
    colormap(jet); 
    axis image off;
    set(handles.axes4,'YDir','reverse');
    set(handles.axes4,'CLim',[0,1]);
end

try
    axes(handles.axes5);
    imagesc(reshape(b(:,3),m,n));
    colormap(jet); 
    axis image off;
    set(handles.axes5,'YDir','reverse');
    set(handles.axes5,'CLim',[0,1]);
end

try
    axes(handles.axes6);
    imagesc(reshape(b(:,4),m,n));
    colormap(jet); 
    axis image off;
    set(handles.axes6,'YDir','reverse');
    set(handles.axes6,'CLim',[0,1]);
end

try
    axes(handles.axes7);
    imagesc(reshape(b(:,5),m,n));
    colormap(jet); 
    axis image off;
    set(handles.axes7,'YDir','reverse');
    set(handles.axes7,'CLim',[0,1]);
end

try
    axes(handles.axes8);
    imagesc(reshape(b(:,6),m,n));
    colormap(jet); 
    axis image off;
    set(handles.axes8,'YDir','reverse');
    set(handles.axes8,'CLim',[0,1]);
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% save fig&mat
global b
global m
global n

handles = guihandles(gcf);

figure('visible','on');
axes; 

fig1=reshape(b(:,1),m,n);
imagesc(fig1);
colormap(jet); 
axis image off  
[f,p]=uiputfile({'*.fig'},'Save Files');
str=strcat(p,f);
savefig(figure(1),str);

try
    fig2=reshape(b(:,2),m,n);
    imagesc(fig2);
    colormap(jet); 
    axis image off  
    [f,p]=uiputfile({'*.fig'},'Save Files');
    str=strcat(p,f);
    savefig(figure(1),str);
end

try
    fig3=reshape(b(:,3),m,n);
    imagesc(fig3);
    colormap(jet); 
    axis image off  
    [f,p]=uiputfile({'*.fig'},'Save Files');
    str=strcat(p,f);
    savefig(figure(1),str);
end

try
    fig4=reshape(b(:,4),m,n);
    imagesc(fig4);
    colormap(jet); 
    axis image off  
    [f,p]=uiputfile({'*.fig'},'Save Files');
    str=strcat(p,f);
    savefig(figure(1),str);
end

try
    fig5=reshape(b(:,5),m,n);
    imagesc(fig5);
    colormap(jet); 
    axis image off  
    [f,p]=uiputfile({'*.fig'},'Save Files');
    str=strcat(p,f);
    savefig(figure(1),str);
end

try
    fig6=reshape(b(:,6),m,n);
        imagesc(fig6);
        colormap(jet); 
        axis image off  
        [f,p]=uiputfile({'*.fig'},'Save Files');
        str=strcat(p,f);
        savefig(figure(1),str);
    
end
close gcf

[fname,dirpath,index]=uiputfile({'*.mat','MATLAB Files(*.mat)'},'Save Data File');
FNlength=length(fname);

myfile=[dirpath fname];

save (myfile, 'm','n');
try
    save (myfile,'fig1','-append');
end
try
    save (myfile,'fig2','-append');
end
try
    save (myfile,'fig3','-append');
end
try
    save (myfile,'fig4','-append');
end
try
    save (myfile,'fig5','-append');
end
try
    save (myfile,'fig6','-append');
end

hMsg=msgbox(['Successfully Saved!'],'Prompt');
pause(1);
if ishandle(hMsg)
    delete(hMsg);
end 


%---------------------------------function [b,xi] = f_nnls(x,y)
function [b,xi] = f_nnls(x,y)
%FASTNNLS Fast non-negative least squares.
%  FASTNNLS finds b that minimizes X*b-y in a constrained least squares
%  sense. It is similar to b = X\y except that b cannot contain negative
%  values.

%  INPUTS:
%    x : the matrix of predictor variables
%    y : vector or matrix of predicted variables. If (y) is a matrix, the
%        result is the solution for each column calculated independently. 
% 
%  OUTPUTS: 
%     b : the non-negatively constrained least squares solution 
%    xi : the cache of x inverses (unless caching was disabled)
%  
%  FASTNNLS is fastest when a good estimate of the regression vector is
%  input. This eliminates much of the computation involved in determining
%  which coefficients will be nonzero in the final regression vector. This
%  makes it very useful in alternating least squares routines. Note that
%  the input b0 must be a feasible (i.e. nonnegative) solution, unless
%  eqconst is set appropriately. If (y) is a matrix, cacheing of the inverse
%  of (x) is used  to improve speed. As a result, the NNLS solution for
%  many  columns of y will be the fastest when all columns are passed  to
%  FASTNNLS at once or when the x inverse cache (xi) is passed back to
%  FASTNNLS on each call in which X is the same.
%
%  The FASTNNLS algorithm is based on the one developed by
%  Bro and de Jong, J. Chemometrics, Vol. 11, No. 5, 393-401, 1997


if nargin == 0; x = 'io'; end
varargin{1} = x;
if ischar(varargin{1});
  options = [];
  if nargout==0; evriio(mfilename,varargin{1},options); else; b = evriio(mfilename,varargin{1},options); end
  return; 
end

[m,n] = size(x);
tol = max(size(x))*norm(x,1)*eps;

b = ones(n,size(y,2));
if size(b,2)==1 && size(y,2)>1;  %is b a column vector but y a matrix?
  b(:,2:size(y,2)) = b(:,1);    %copy to every column to match y.
end

eqconst = zeros(size(b))*nan;  %default is no constraints
if size(eqconst,2)==1 && size(b,2)>1;  %is eqconst a column vector but b a matrix?
  eqconst(:,2:size(b,2)) = eqconst(:,1);    %copy to every column to match b.
end
if size(eqconst,1)==1 && size(b,1)>1;  %is eqconst a row vector but b a matrix?
  eqconst(2:size(b,1),:) = eqconst(1,:);    %copy to every row to match b.
end

xi = struct('Cache',[]);

fn = @f_nnlsProj;  %use caching projection

%loop across y columns
y_all = y;
b_all = b;
const_all = eqconst;
for col = 1:size(y,2);
  
  y = y_all(:,col);
  b = b_all(:,col);
  
  eqconst = const_all(:,col);
  noneqconstmap = isnan(eqconst);   %map where 1=non-equality constrained factor
  noneqconstind = find(noneqconstmap);  %lookup table of non-equality constrained factors
  if any(~noneqconstmap);
    %pre-subtract the equality constrained factors from the data (these can't be
    %changed anyway so we might as well work from the residual)
    y = y - x(:,~noneqconstmap)*eqconst(~noneqconstmap);
    b(~noneqconstmap) = 0;  %set their weight to be zero
  end
  
  p    = (noneqconstmap & b>0)';    %variables which are NOT held at zero
  %           anything unconstrained and with a positive reg coef
  r    = ~p;                    %variables which ARE held at zero
  %           constrained factor, or zero or negative reg coef
  b(r) = 0;
  
  [sp,xi] = feval(fn,x,xi,p,y);   %do one projection
  %exert positive control over any negative regression values
  b(p) = sp;   %select reg coef for those factors which were not controlled
  while min(sp) < 0
    %initial pass to exhert control over any reg coef with a negative value
    b(b<0) = 0;  %assign a zero
    p = (noneqconstmap & b>0)';    %redetermine controlled and uncontrolled vars
    r = ~p;
    [sp,xi] = feval(fn,x,xi,p,y);
    b(p) = sp;
  end
  
  w = x'*(y-x*b);   %correlation beteween x and residuals
  [wmax,ind] = max(w(noneqconstmap));
  ind = noneqconstind(ind);  %locate actual index in unconstrained index list
  inloop = 0;
  while (wmax > tol && any(r(noneqconstmap)))
    p(ind) = 1;     %allow that given index to be free
    r(ind) = 0;
    [sp,xi] = feval(fn,x,xi,p,y);
    while (min(sp) < 0) && any(p)   %while any are negative and uncontrolled
      tsp    = zeros(n,1);
      tsp(p) = sp;  
      fb     = (b~=0);
      nrm    = (b(fb)-tsp(fb));
      nrm(nrm<0) = inf;
      rat    = b(fb)./nrm;
      alpha  = min(rat(rat>0));
      alpha  = min([alpha 1]);      %limit to 1
      b = b + alpha*(tsp-b);
      p = (b > tol)';
      r = ~p;
      b(r) = 0;
      [sp,xi] = feval(fn,x,xi,p,y);
    end
    b(p) = sp;
    w = x'*(y-x*b);   %correlation beteween x and residuals
    [wmax,ind] = max(w(noneqconstmap));
    ind = noneqconstind(ind);  %locate actual index in unconstrained index list
    inloop = inloop+1;
    if inloop>100;
      warning('EVRI:FastnnlsDegenerate','Degenerate Non-Negative Least Squares solution (poorly defined scale?) Skipping');
      break
    end
    if p(ind)    %already free or stuck in iterations? just leave
      wmax = 0;
    end
  end
  
  %replace constrained items with constrained values
  if any(~noneqconstmap);
    b(~noneqconstmap) = eqconst(~noneqconstmap);
  end
  
  b_all(:,col) = b;  %store this column's result

  %every n'th point, do a drawnow to allow control-c
  switch mod(col,200)
    case 0
      drawnow;
  end
  
end

b = b_all;


%----------------------------
function [sp,xi] = f_nnlsProj(x,xi,p,y)

try
  %QUICKLY create the index pattern which matches the included variables:
  ind = char(p+97);  
  %Now, try to pull the associated inverse out of the X_inverse (xi) structure. If
  %we get an error, then we know we haven't calculated that inverse yet and
  %we need to do it.
  try
    xi_ind = xi.(ind);    %try to extract the inverse from the matrix.
    sp = xi_ind*y;        %and do the regression
  catch
    %We got here because our x_inverse (xi) matrix didn't have the inverse we
    %were looking for (the field name in "ind" didn't exist).
    xi_ind = pinv(x(:,p));  %calculate inverse
    xi(1).(ind) = xi_ind;   %create a field with alphanumeric "ind" as name, and store that inverse
    sp = xi_ind*y;          %do the regression
  end
  
catch
  %--plain method--
  %if something goes wrong above, just default to using the plain method
  % (note, because some of the code above still gets executed, this apprach
  % will still be SLOWER than the plain method called outright so,
  % therefore, it is advantageous to just use the plain method explictly
  % when that is desired)
  sp = x(:,p)\y;
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close gcf
%set(A01_1Main,'Visible','on');
