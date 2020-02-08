function varargout = GUIDEunitconverter(varargin)
% GUIDEUNITCONVERTER MATLAB code for GUIDEunitconverter.fig
%      GUIDEUNITCONVERTER, by itself, creates a new GUIDEUNITCONVERTER or raises the existing
%      singleton*.
%
%      H = GUIDEUNITCONVERTER returns the handle to a new GUIDEUNITCONVERTER or the handle to
%      the existing singleton*.
%
%      GUIDEUNITCONVERTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDEUNITCONVERTER.M with the given input arguments.
%
%      GUIDEUNITCONVERTER('Property','Value',...) creates a new GUIDEUNITCONVERTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIDEunitconverter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIDEunitconverter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIDEunitconverter

% Last Modified by GUIDE v2.5 11-May-2015 16:11:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIDEunitconverter_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIDEunitconverter_OutputFcn, ...
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


% --- Executes just before GUIDEunitconverter is made visible.
function GUIDEunitconverter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUIDEunitconverter (see VARARGIN)

% Choose default command line output for GUIDEunitconverter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUIDEunitconverter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIDEunitconverter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function SampleFigure_Callback(hObject, eventdata, handles)
% hObject    handle to SampleFigure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SampleFigure as text
%        str2double(get(hObject,'String')) returns contents of SampleFigure as a double


% --- Executes during object creation, after setting all properties.
function SampleFigure_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SampleFigure (see GCBO)
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


% --- Executes on button press in pushbutton1converter.
function pushbutton1converter_Callback(hObject, eventdata, handles)
       set(handles.edit3,...
           'Visible','on');
       printstr = get(handles.edit3,'String');
       
       printstr = str2num(printstr); %convert input to a number
       printstr = (2.54 * printstr); %convert to centimeters
       printstr = num2str(printstr); %convert back into a string
       printstr = [printstr 'cm']; %add units
       
       hstr = uicontrol;
       set(hstr,'Style','text',...
           'BackgroundColor','white',...
           'Position',[210,130,150,50],...
           'String',printstr,...
           'ForegroundColor','Red',...
           'Fontsize',15,...
           'Visible','on');
% hObject    handle to pushbutton1converter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)