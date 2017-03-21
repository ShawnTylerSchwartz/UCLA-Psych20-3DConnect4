function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 19-Mar-2017 18:52:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @GUI_OpeningFcn, ...
    'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%SETTING UP NEW GAME

% --- Executes on selection change in selectGameType.
function selectGameType_Callback(hObject, eventdata, handles)
% hObject    handle to selectGameType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject, 'String'));
popChoice = contents{get(hObject, 'Value')};

if (strcmp(popChoice,  'Human vs AI'))
    type = 1;
elseif (strcmp(popChoice,  'Human vs Human'))
    type = 2;
elseif (strcmp(popChoice,  'AI vs AI'))
    type = 3;
end

assignin('base', 'type', type)


% --- Executes during object creation, after setting all properties.
function selectGameType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to selectGameType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in selectRows.
function selectRows_Callback(hObject, eventdata, handles)
% hObject    handle to selectRows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contents = cellstr(get(hObject, 'String')); %returns selectRows contents as cell array
popChoice = contents{get(hObject, 'Value')}; %returns selected item from selectRows
global numRows
if (strcmp(popChoice,  ' 4'))
    numRows = 4;
elseif (strcmp(popChoice,  ' 5'))
    numRows = 5;
elseif (strcmp(popChoice,  ' 6'))
    numRows = 6;
elseif (strcmp(popChoice,  ' 7'))
    numRows = 7;
elseif (strcmp(popChoice,  ' 8'))
    numRows = 8;
elseif (strcmp(popChoice,  ' 9'))
    numRows = 9;
end

assignin('base', 'numRows', numRows)


% --- Executes during object creation, after setting all properties.
function selectRows_CreateFcn(hObject, eventdata, handles)
% hObject    handle to selectRows (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in selectCols.
function selectCols_Callback(hObject, eventdata, handles)
% hObject    handle to selectCols (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


contents = cellstr(get(hObject, 'String')); %returns selectRows contents as cell array
popChoice = contents{get(hObject, 'Value')}; %returns selected item from selectRows

global numCols

if (strcmp(popChoice,  ' 4'))
    numCols = 4;
elseif (strcmp(popChoice,  ' 5'))
    numCols = 5;
elseif (strcmp(popChoice,  ' 6'))
    numCols = 6;
elseif (strcmp(popChoice,  ' 7'))
    numCols = 7;
elseif (strcmp(popChoice,  ' 8'))
    numCols = 8;
elseif (strcmp(popChoice,  ' 9'))
    numCols = 9;
end

% guidata(object_handle,numCols)
% data = guidata(object_handle)

assignin('base', 'numCols', numCols)


% --- Executes during object creation, after setting all properties.
function selectCols_CreateFcn(hObject, eventdata, handles)
% hObject    handle to selectCols (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in selectSlices.
function selectSlices_Callback(hObject, eventdata, handles)
% hObject    handle to selectSlices (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

contents = cellstr(get(hObject, 'String')); %returns selectRows contents as cell array
popChoice = contents{get(hObject, 'Value')}; %returns selected item from selectRows

global numSlices

if (strcmp(popChoice,  ' 4'))
    numSlices = 4;
elseif (strcmp(popChoice,  ' 5'))
    numSlices = 5;
elseif (strcmp(popChoice,  ' 6'))
    numSlices = 6;
elseif (strcmp(popChoice,  ' 7'))
    numSlices = 7;
elseif (strcmp(popChoice,  ' 8'))
    numSlices = 8;
elseif (strcmp(popChoice,  ' 9'))
    numSlices = 9;
end
assignin('base', 'numSlices', numSlices)

% --- Executes during object creation, after setting all properties.
function selectSlices_CreateFcn(hObject, eventdata, handles)
% hObject    handle to selectSlices (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%START GAME BUTTON

% --- Executes on button press in startGame.
function startGame_Callback(hObject, eventdata, handles)
% hObject    handle to startGame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

rng('shuffle');

%DISPLAY EMPTY BOARD, should be getting these from popup menus


global numRows
global numSlices
global numCols

boardDepth = numSlices;
boardWidth = numCols;
boardHeight = numRows;

maxDims = max([boardWidth boardHeight]);

board = zeros(boardWidth, boardHeight, boardDepth);

for i = 1:boardDepth
    subplot(maxDims,1,i);
    grid on
    xlim([1 boardWidth]);
    ylim([-boardHeight 0]);
    xticks([0:boardWidth]);
    yticks([-boardHeight:1]);
    %     set(gca, 'XTickLabelMode', 'manual', 'XTickLabel', []);
    %     set(gca, 'YTickLabelMode', 'manual', 'YTickLabel', []);
    
end

% randomly decide which player will start (AI or Human)
randTurn = randi(10);
if rem(randTurn,2) == 1 % if its odd
    player = 1; % it is the humans turn
else  % if its even
    player = -1; % its the AIs turn
end

% continue to check if any player has won and if not continue allowing
% gameplay
while checkWin(board) == 0
    
    % if 1, it is the humans turn
    if player == 1
        %         disp('Human turn'); % tell the console whos turn it is
        % call the makeConnect4MoveHuman function and store the coordinate locations
        %  for formatted plotting (i.e. proper color of the game piece: red)
        
        
        [board, player, x_loc, y_loc, z_loc] = makeConnect4MoveHuman(board, player);
        %         subplot(5,1,5)
        
        
        %displayBoard(boardWidth,boardHeight,x_loc,-y_loc,z_loc,'red');
        %(xdim,ydim,x,y,zdim,color)
        %         subplot(maxDim,1,zdim
        % maxDim = max([xdim ydim]
        hold on;
        subplot(maxDims,1,z_loc)
        drawredcircle(x_loc, -y_loc);
        xlim([1 boardWidth]);
        ylim([-boardHeight 0]);
        xticks([0:boardWidth]);
        yticks([-boardHeight:1]);
        grid on;
        
        
        
        % if -1, it is the AIs turn
    elseif player == -1
        %disp('AI Turn'); % tell the console whos turn it is
        % call the makeConnect4MoveAI function and store the coordinate locations
        %  for formatted plotting (i.e. proper color of the game piece: black)
        [board, player, x_loc, y_loc, z_loc] = makeConnect4MoveAI(board, player);
        hold on;
        subplot(maxDims,1,z_loc)
        drawblackcircle(x_loc, -y_loc);
        xlim([1 boardWidth]);
        ylim([-boardHeight 0]);
        xticks([0:boardWidth]);
        yticks([-boardHeight:1]);
        grid on;
        
    end
    
    %disp(board); % display the updated version of the game board in the console
    
end

[win, winner] = checkWin(board);

if winner == 1
   humanWin = msgbox({'Human Won!'});
else
   aiWin = msgbox({'AI Won!'});
end



% %GETTING COL THAT THEY SELECTED
% [xpos, ypos] = ginput(1);
% assignin('base', 'xpos', xpos);
% assignin('base', 'ypos', ypos);
%
% h = findobj('Tag','selectCols');
% data = h.UserData;
%
% % finding which column they clicked
% % 1 = end , the max number of cols
% % 5 = numCols
% for n = 1:numCols
%     if n*(1/numCols) > xpos && (n-1)*(1/numCols) < xpos
%         col = n;
%     else
%         col = 1;
%     end
% end
%
%  assignin('base', 'col', col);

%IF IT'S HUMAN VS AI
