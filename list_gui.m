function varargout = list_gui(varargin)
% LIST_GUI MATLAB code for list_gui.fig
%      LIST_GUI, by itself, creates a new LIST_GUI or raises the existing
%      singleton*.
%
%      H = LIST_GUI returns the handle to a new LIST_GUI or the handle to
%      the existing singleton*.
%
%      LIST_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LIST_GUI.M with the given input arguments.
%
%      LIST_GUI('Property','Value',...) creates a new LIST_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before list_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to list_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help list_gui

% Last Modified by GUIDE v2.5 23-Dec-2016 13:13:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @list_gui_OpeningFcn, ...
    'gui_OutputFcn',  @list_gui_OutputFcn, ...
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


% --- Executes just before list_gui is made visible.
function list_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to list_gui (see VARARGIN)

% Choose default command line output for list_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes list_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = list_gui_OutputFcn(hObject, eventdata, handles)
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


% --- Executes on button press in pb_loadimages.
function pb_loadimages_Callback(hObject, eventdata, handles)
% hObject    handle to pb_loadimages (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
folder_dir = uigetdir;
% file_lists_dir(folder_name);
file_lists= dir(fullfile(folder_dir,'*.jpg'));

for iter1 = 1: size(file_lists,1)
    new_line{iter1} = file_lists(iter1).name;
end

initial_name=cellstr(get(handles.listbox1,'String'));
new_name = [initial_name  new_line];
new_name = [new_line];
set(handles.listbox1,'String',new_name);

handles.folder_dir = folder_dir;
guidata(hObject, handles);



% --- Executes on button press in pb_draw_image.
function pb_draw_image_Callback(hObject, eventdata, handles)
% hObject    handle to pb_draw_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
full_list = cellstr(get(handles.listbox1,'String'));
sel_val=get(handles.listbox1,'value');
sel_item=full_list(sel_val);
sel_item_full_name = fullfile(handles.folder_dir,sel_item);
img = imread(sel_item_full_name{1});
axes(handles.axes1), imshow(img);





