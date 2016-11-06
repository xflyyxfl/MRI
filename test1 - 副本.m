function varargout = test1(varargin)
% TEST1 MATLAB code for test1.fig
%      TEST1, by itself, creates a new TEST1 or raises the existing
%      singleton*.
%
%      H = TEST1 returns the handle to a new TEST1 or the handle to
%      the existing singleton*.
%
%      TEST1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST1.M with the given input arguments.
%
%      TEST1('Property','Value',...) creates a new TEST1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test1

% Last Modified by GUIDE v2.5 05-Sep-2016 20:16:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test1_OpeningFcn, ...
                   'gui_OutputFcn',  @test1_OutputFcn, ...
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


% --- Executes just before test1 is made visible.
function test1_OpeningFcn(hObject, eventdata, handles, varargin)
set(0,'RecursionLimit',10000000);
global rreal aabs iimage;
rreal=1;
aabs=1;
iimage=1;

set(handles.checkbox1,'value',1);
set(handles.checkbox2,'value',1);
set(handles.checkbox3,'value',1);
set(handles.checkbox4,'value',0);
set(handles.checkbox5,'value',0);
set(handles.checkbox6,'value',0);
set(handles.text12,'Visible','off');

axes(handles.axes2)
cla;
axes(handles.axes2)
imagx=5.5;          
alpha=0:pi/20:2*pi;  
x3=imagx*cos(alpha);  
y3=imagx*sin(alpha); 
patch(x3,y3,'y');           
display1=sprintf('%s','bean oil');   
text(-2,0,display1,'FontSize',8,'color','black');
axis off
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test1 (see VARARGIN)

% Choose default command line output for test1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
global B0;
B0=get(handles.edit1,'String');
B0=str2double(B0);
if B0<0.1||B0>3
    helpdlg('B0超出范围，请在0.1T～3T之间设置B0','提示');
end

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
global SF1;
SF1=get(handles.edit2,'String');
SF1=str2double(SF1).*1000000;
if SF1<4||SF1>127
    helpdlg('SF1超出范围，请在4MHz～127MHz之间设置SF1','提示');
end

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
global O1;
O1=get(handles.edit3,'String');
O1=str2double(O1);
if O1<0||O1>=1000
    helpdlg('O1超出范围，请在0KHz～1000KHz之间设置O1','提示');
end

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
global TD;
TD=get(handles.edit4,'String');
TD=str2double(TD);
if TD~=64&&TD~=128&&TD~=256&&TD~=512&&TD~=1024&&TD~=2048&&TD~=4096&&TD~=8192&&TD~=16384;
    helpdlg('TD设置有误，TD应满足TD=2^n(n取整数，且5<n<15)','提示');
end


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



function edit5_Callback(hObject, eventdata, handles)
global SW;
SW=get(handles.edit5,'String');
SW=str2double(SW);
if SW<10||SW>500
    helpdlg('SW超出范围，请在10KHz～500KHz之间设置SW','提示');
end

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



function edit7_Callback(hObject, eventdata, handles)
global B1;
B1=get(handles.edit7,'String');
B1=str2double(B1);
if B1<1||B1>40
    helpdlg('B1超出范围，请在1Gs～40Gs之间设置B1','提示');
end

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


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
global rreal;
rreal=get(handles.checkbox1,'Value');
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
global iimage;
iimage=get(handles.checkbox2,'Value');
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
global aabs;
aabs=get(handles.checkbox3,'Value');
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --------------------------------------------------------------------
function start_ClickedCallback(hObject, eventdata, handles)
global rreal aabs iimage stop B0 SF1 O1 TD SW TR B1;
stop=0;
B=get(handles.checkbox4,'value');
RF=get(handles.checkbox5,'value');
sample=get(handles.checkbox6,'value');
set(handles.stop,'enable','on');
set(handles.start,'enable','off');
SF1=get(handles.edit2,'String');
O1=get(handles.edit3,'String');
TD=get(handles.edit4,'String');
SW=get(handles.edit5,'String');
TR=get(handles.edit8,'String');

SF1=str2double(SF1).*1000000;
O1=str2double(O1).*1000;
TD=str2double(TD);
SW=str2double(SW);
TR=str2double(TR).*0.001;

if B==1
B0=get(handles.edit1,'String');
B0=str2double(B0);
else
B0=0;
end

nx=61;    
ny=61;
rx=30;        
ry=30; 
p=zeros(ny,nx);
T1=zeros(ny,nx);
T2=zeros(ny,nx);
  for x=1:nx   
     for y=1:ny 
         if ((x-nx/2).^2)./(rx.^2)+((y-ny/2).^2)./(ry.^2)<=1                           
             if sample==1 
             p(y,x)=1; 
             T1(y,x)=284.*0.001;
             T2(y,x)=50.*0.001;
             else
             p(y,x)=0; 
             T1(y,x)=0;
             T2(y,x)=0;
             end
        end
     end
  end


tao=3.*0.000001;
BW=1.21./tao;
r=42580000;
f=SF1+O1;
if RF==1;
B1=get(handles.edit7,'String');
B1=str2double(B1).*0.0001;
  if f>((r.*B0)+BW)||f<((r.*B0)-BW);
    B1=0;
  else
    B1=B1.*sinc((f-r.*B0).*tao./1.21);
  end
else
    B1=0;
end
sinda=2.*pi.*r.*B1.*tao;

T=TD/SW;
t=0:1/SW:T;
% noisy=1;
% snr=cos(1.*(1+10.*noisy.*rand(1)).*t)+i.*sin(10.*(1+10.*noisy.*rand(1)).*t);
% sig=sqrt(1./(2.^(snr./(0.1.*(1+10.*noisy.*rand(1))))));
% sig1= (-1).^(t.*100).*sqrt(1./(2.^(snr./(0.1))));

s=0;
s12=0;

if B==0||RF==0||sample==0;
    s=rand(size(t));
else
   if f>((r.*B0)+BW)||f<((r.*B0)-BW);
       %s=sig;
       s=rand(size(t));
     
       
   else for n1=1:1:61
        for n11=1:1:61
    %s1=(sin(sinda)).*(p(n1,n11).*(1-exp(-TR./T1(n1,n11))).*(cos( 0.000628.*(r.*B0-f).*t)+i.*sin( 0.000628.*(r.*B0-f).*t)).*exp(-t./(1./(1./(50.*(T2(n1,n11)))+(r.*0.001.*0.0001)./2))));%不均匀性0.001Gs
    s1=(3+(1-3)*rand()).*(sin(sinda)).*(p(n1,n11).*(1-exp(-TR./T1(n1,n11))).*(cos( 0.000628.*(r.*B0-f).*t)+i.*sin( 0.000628.*(r.*B0-f).*t)).*exp(-t./(1./(1./(50.*(T2(n1,n11)))+(r.*0.001.*0.0001)./2))));
    s=s+s1;
  
    %s11=(sin(sinda)).*(p(n1,n11).*1.07.*(1-exp(-TR./T1(n1,n11))).*exp(-(t./(50.*T2(n1,n11))))).*(1.05+(0.90-1.05)*rand());
    s11=(sin(sinda)).*(p(n1,n11).*1.07.*(1-exp(-TR./T1(n1,n11))).*exp(-(t./(50.*T2(n1,n11))))).*(3+(0.75-3)*rand());
    s12=s12+s11;
       end
       end
   end
end
%s=(s+sig1).*(1+0.08.*noisy.*rand(1));
s=s;
axes(handles.axes1);

if aabs==1&&rreal==1&&iimage==1    
     plot(t,real(s),'color','red','LineWidth', 0.5);
     hold on;
     plot(t,abs(s),'color','blue','LineWidth', 0.5);
     plot(t,imag(s),'color','green','LineWidth', 0.5);
     plot(t,s12,'--k','LineWidth', 0.5);
     hold off;
end
if aabs==1&&rreal==0&&iimage==1    
     plot(t,abs(s),'color','b','LineWidth', 1);
     hold on;
     plot(t,imag(s),'color','green','LineWidth', 1); 
     plot(t,s12,'--k','LineWidth', 1);
     hold off;
end
if aabs==1&&rreal==1&&iimage==0    
     plot(t,abs(s),'color','b','LineWidth', 1); 
     hold on;
     plot(t,real(s),'color','r','LineWidth', 1); 
     plot(t,s12,'--k','LineWidth', 1);
     hold off;
end
if aabs==1&&rreal==0&&iimage==0    
   plot(t,abs(s),'color','b','LineWidth', 1);
   hold on;
   plot(t,s12,'--k','LineWidth', 1);
   hold off;
end
if rreal==0&&iimage==1&&aabs==0  
     plot(t,imag(s),'color','green','LineWidth', 1);  
end
if rreal==1&&iimage==0&&aabs==0    
     plot(t,real(s),'color','red','LineWidth', 1); 
end
if rreal==1&&iimage==1&&aabs==0    
     plot(t,real(s),'color','red','LineWidth', 1); 
     hold on;
     plot(t,imag(s),'color','green','LineWidth', 1); 
     hold off;
end

if rreal==0&&iimage==0&&aabs==0      
    s=0;
     plot(t,s,'color','blue','LineWidth', 1);
end
hold on;
set(gca,'xcolor','black','ycolor','black','color','white');
set(gca, 'XGrid','on');
set(gca, 'YGrid','on');
xlabel(gca, '\fontsize{10}ms','color','black');
hold off;

if B==0||RF==0||sample==0;
  set(handles.text12,'String','');
  textstr={'';'现象：无磁共振信号';'';'原因提示：是否满足产生';'磁共振现象的物质条件？';'请检查主磁场、射频场';'和磁性核样品';'开关是否开启？'};
  set(handles.text12,'String',textstr,'FontSize',11,'backgroundcolor','w');
  set(handles.text12,'Visible','on');
end
if B==1&&RF==1&&sample==1;
 if f>((r.*B0)+BW)||f<((r.*B0)-BW);
  set(handles.text12,'String',''); 
  textstr={'';'现象：无磁共振信号';'';'提示：                      ';'射频频率不在质子共振频率范围内，请重新调节O1，寻找信号'};
   set(handles.text12,'String',textstr,'FontSize',11,'backgroundcolor','w');
   set(handles.text12,'Visible','on');
 end
end
if B==1&&RF==1&&sample==1;
   if f==21290000;
   set(handles.text12,'String','');
   textstr={'';'现象：完美共振信号';'';'提示：                      ';'此时射频频率f与拉莫尔频率相等，f=SF1+O1=γ×B0'};
   set(handles.text12,'String',textstr,'FontSize',11,'backgroundcolor','w');
  set(handles.text12,'Visible','on'); 
   end
end
if B==1&&RF==1&&sample==1;
   if f>=21210000&&f<=21370000&&f~=21290000;
   set(handles.text12,'String','');
   textstr={'';'现象：接近共振';'';'提示：                      ';'微调O1寻找完美共振信号'};
   set(handles.text12,'String',textstr,'FontSize',11,'backgroundcolor','w');
   set(handles.text12,'Visible','on');
   end
end

if B==1&&RF==1&&sample==1;
   if f>((r.*B0)-BW)&&f<21210000;
   set(handles.text12,'String','');
   textstr={'';'现象：偏置共振';'';'提示：                      ';'粗调O1使其逐步接近共振状态'};
   set(handles.text12,'String',textstr,'FontSize',11,'backgroundcolor','w');
   set(handles.text12,'Visible','on');
  end
end

if B==1&&RF==1&&sample==1;
   if f>21370000&&f<((r.*B0)+BW);
   set(handles.text12,'String','');
   textstr={'';'现象：偏置共振';'';'提示：                      ';'粗调O1使其逐步接近共振状态'};
   set(handles.text12,'String',textstr,'FontSize',11,'backgroundcolor','w');
   set(handles.text12,'Visible','on');
   end
end

pause(TR);
if stop==0
   start_ClickedCallback(hObject, eventdata, handles);
end

% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
ButtonName = questdlg('Do you want to close test1 window?', ...
                         'Close test1...', ...
                         'Yes', 'No', 'Yes');
if strcmp(ButtonName,'Yes')
    clc;     
    clear all; 
    delete(gcf);                                    
else 
     return;
end
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
%delete(hObject);


% --------------------------------------------------------------------
function quit_ClickedCallback(hObject, eventdata, handles)
ButtonName = questdlg('Do you want to close test1 window?', ...
                         'Close test1...', ...
                         'Yes', 'No', 'Yes');
if strcmp(ButtonName,'Yes')
    clc;     
    clear all; 
    delete(gcf);                                    
else 
     return;
end
% hObject    handle to quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function stop_ClickedCallback(hObject, eventdata, handles)
global stop;
stop=1;
set(handles.stop,'enable','off');
set(handles.start,'enable','on');
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit8_Callback(hObject, eventdata, handles)
global TR;
TR=get(handles.edit8,'String');
TR=str2double(TR);
if TR<300||TR>3000
    helpdlg('TR超出范围，请在300ms～3000ms之间设置TR','提示');
end


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


% --------------------------------------------------------------------
function save_ClickedCallback(hObject, eventdata, handles)
[filename, pathname, filterindex] = uiputfile( {'*.png';'*.jpeg';'*.jif';'*.bmp';'*.*'},'Save as');
image=getframe(handles.axes1);
switch filterindex
    case 1
         imwrite(image.cdata,filename,'png');
    case 2
         imwrite(image.cdata,filename,'jpeg');
    case 3
         imwrite(image.cdata,filename,'jif');
    case 4
         imwrite(image.cdata,filename,'bmp');
end
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function new_ClickedCallback(hObject, eventdata, handles)
axes(handles.axes1)
cla reset;
set(handles.text12,'Visible','off');

% hObject    handle to new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function sequence_1_Callback(hObject, eventdata, handles)
% hObject    handle to sequence_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function exit_Callback(hObject, eventdata, handles)
ButtonName = questdlg('Do you want to close test1 window?', ...
                         'Close test1...', ...
                         'Yes', 'No', 'Yes');
if strcmp(ButtonName,'Yes')
    clc;     
    clear all; 
    delete(gcf);                                    
else 
     return;
end
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function h_fid_Callback(hObject, eventdata, handles)
% hObject    handle to h_fid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function save_1_Callback(hObject, eventdata, handles)
[filename, pathname, filterindex] = uiputfile( {'*.png';'*.jpeg';'*.jif';'*.bmp';'*.*'},'Save as');
image=getframe(handles.axes1);
switch filterindex
    case 1
         imwrite(image.cdata,filename,'png');
    case 2
         imwrite(image.cdata,filename,'jpeg');
    case 3
         imwrite(image.cdata,filename,'jif');
    case 4
         imwrite(image.cdata,filename,'bmp');
end
% hObject    handle to save_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function new_1_Callback(hObject, eventdata, handles)
axes(handles.axes1)
cla reset;
set(handles.text12,'Visible','off');
% hObject    handle to new_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6


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


% --- Executes during object creation, after setting all properties.


% --- Executes during object deletion, before destroying properties.
function text12_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to text12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function guide_Callback(hObject, eventdata, handles)
[Filename,Pathname]=uigetfile({'*.pdf'},'选择 ');
str=[Pathname Filename];
open(str);
% hObject    handle to guide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function text12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
