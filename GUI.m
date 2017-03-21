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

% Last Modified by GUIDE v2.5 21-Mar-2017 15:32:02

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
contents = cellstr(get(hObject, 'String')); %returns as cell array
popChoice = contents{get(hObject, 'Value')}; %returns selected item
%setting type as global variable to use later
global type

if (strcmp(popChoice,  'Human vs AI')) %if player chooses Human vs AI
    type = 1; %set as type 1
elseif (strcmp(popChoice,  'Human vs Human')) %choose 2 player
    type = 2;
elseif (strcmp(popChoice,  'AI vs AI')) %chose AI vs AI
    type = 3;
end

assignin('base', 'type', type) %output type to the workspace


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
%set numRows as global variable to use later
global numRows

%taking input of number of rows
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

assignin('base', 'numRows', numRows) %output to workspace


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

contents = cellstr(get(hObject, 'String')); %returns selectCols contents as cell array
popChoice = contents{get(hObject, 'Value')}; %returns selected item from selectRows
%set numCols as global
global numCols

%taking input of number of cols
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
%setting as global variable
global numSlices

%taking input of number of slices
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
assignin('base', 'numSlices', numSlices) %output to workspace

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

%DISPLAY EMPTY BOARD

%access global variables
global numRows
global numSlices
global numCols
global type

%set input variables to board dimensions
boardDepth = numSlices;
boardWidth = numCols;
boardHeight = numRows;
gameType = type;

%initialize board as all zeros
board = zeros(boardWidth, boardHeight, boardDepth);

%create display board, empty
for i = 1:boardDepth
    subplot(4,round(boardDepth/2),i); %position in the top of the gui
    xlim([1 boardWidth]); %set dimensions
    ylim([-boardHeight 0]);
    xticks([0:boardWidth]); %set ticks
    yticks([-boardHeight:1]);
    set(gca, 'YTickLabelMode', 'manual', 'YTickLabel', []); %don't show y axis label
    axis square; %set graphs as square
    grid on %set grid
    
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

if gameType == 1 %if they choose Human vs AI
    
    %asking for name and storing for use later
    prompt = {'Enter your Name: '};
    name = inputdlg(prompt);
    
    while checkWin(board) == 0 %while no one has won yet
        
        % if 1, it is the humans turn
        if player == 1
            % call the makeConnect4MoveHuman function and store the coordinate locations
            %  for formatted plotting (i.e. proper color of the game piece: red)
            [board, player, x_loc, y_loc, z_loc] = makeConnect4MoveHuman(board, player);
            hold on; %keep board
            subplot(4,round(boardDepth/2),z_loc); %access right subplot
            drawredcircle(x_loc, -y_loc); %plot piece
            %reformat board
            xlim([1 boardWidth]);
            ylim([-boardHeight 0]);
            xticks([0:boardWidth]);
            yticks([-boardHeight:0]);
            axis square;
            set(gca, 'YTickLabelMode', 'manual', 'YTickLabel', []);
            grid on;
            
            % if -1, it is the AIs turn
        elseif player == -1
            % call the makeConnect4MoveAI function and store the coordinate locations
            %  for formatted plotting (i.e. proper color of the game piece: black)
            [board, player, x_loc, y_loc, z_loc] = makeConnect4MoveAI(board, player);
            hold on;
            subplot(4,round(boardDepth/2),z_loc); %access subplot
            drawblackcircle(x_loc, -y_loc); %Place Piece
            %format board
            xlim([1 boardWidth]);
            ylim([-boardHeight 0]);
            xticks([0:boardWidth]);
            yticks([-boardHeight:0]);
            axis square;
            set(gca, 'YTickLabelMode', 'manual', 'YTickLabel', []);
            grid on;
            
        end
        
    end
    
    % now that we know its a win, find out which player has won
    [win, winner] = checkWin(board);
    
    if winner == 1 % if the human wins, congratulate them using name from above
        humanwin = msgbox({['Congratulations, ' name{1} '! You won!']});
    else % if the AI wins, say that black won
        aiwin = msgbox({'Black Won!'});
    end
    
end


if gameType == 2 %if they select gameType 2 (Human vs Human)
    
    %ask for each player's name, store for use later
    prompt = {'Enter Red Player Name: ' 'Enter Black Player Name: '};
    names = inputdlg(prompt);
    
    while checkWin(board) == 0 %while no one has won yet
        
        % if 1, it red play / player 1 's turn
        if player == 1
            % call the makeConnect4MoveHumanRed function and store the coordinate locations
            %  for formatted plotting (i.e. proper color of the game piece: red)
            [board, player, x_loc, y_loc, z_loc] = makeConnect4MoveHumanRed(board, player);
            hold on;
            subplot(4,round(boardDepth/2),z_loc); %access subplot
            drawredcircle(x_loc, -y_loc); %place piece
            %format board
            xlim([1 boardWidth]);
            ylim([-boardHeight 0]);
            xticks([0:boardWidth]);
            yticks([-boardHeight:0]);
            axis square;
            set(gca, 'YTickLabelMode', 'manual', 'YTickLabel', []);
            grid on;
            
            % if -1, it is black player / player 2's  turn
        elseif player == -1
            % call the makeConnect4MoveAI function and store the coordinate locations
            %  for formatted plotting (i.e. proper color of the game piece: black)
            [board, player, x_loc, y_loc, z_loc] = makeConnect4MoveHumanBlack(board, player);
            hold on;
            subplot(4,round(boardDepth/2),z_loc); %access subplot
            drawblackcircle(x_loc, -y_loc); %place piece
            %format board
            xlim([1 boardWidth]);
            ylim([-boardHeight 0]);
            xticks([0:boardWidth]);
            yticks([-boardHeight:0]);
            axis square;
            set(gca, 'YTickLabelMode', 'manual', 'YTickLabel', []);
            grid on;
        end
    end
    
    % now that we know its a win, find out which player has won
    [win, winner] = checkWin(board);
    
    if winner == 1 % if player 1 wins, congratulate them using name from above
        humanwin = msgbox({['Congratulations, ' names{1} '! You won!']});
    else % if player 2 wins, congratulate them using name from above
        aiwin = msgbox({['Congratulations, ' names{2} '! You won!']});
    end
end

if gameType == 3 %if they chose game type 3 (AI vs AI)
    
    while checkWin(board) == 0 %while no one has won yet
        
        % if 1, it is red turn
        if player == 1
            % call the makeConnect4MoveHuman function and store the coordinate locations
            %  for formatted plotting (i.e. proper color of the game piece: red)
            [board, player, x_loc, y_loc, z_loc] = makeConnect4MoveAI(board, player);
            hold on;
            subplot(4,round(boardDepth/2),z_loc); %open right subplot
            drawredcircle(x_loc, -y_loc); %place piece
            %format board
            xlim([1 boardWidth]);
            ylim([-boardHeight 0]);
            xticks([0:boardWidth]);
            yticks([-boardHeight:0]);
            axis square;
            set(gca, 'YTickLabelMode', 'manual', 'YTickLabel', []);
            grid on;
            
            % if -1, it black turn
        elseif player == -1
            % call the makeConnect4MoveAI function and store the coordinate locations
            %  for formatted plotting (i.e. proper color of the game piece: black)
            [board, player, x_loc, y_loc, z_loc] = makeConnect4MoveAI(board, player);
            hold on;
            subplot(4,round(boardDepth/2),z_loc); %open right subplot
            drawblackcircle(x_loc, -y_loc); %place piece
            %format board
            xlim([1 boardWidth]);
            ylim([-boardHeight 0]);
            xticks([0:boardWidth]);
            yticks([-boardHeight:0]);
            axis square;
            set(gca, 'YTickLabelMode', 'manual', 'YTickLabel', []);
            grid on;
        end
    end
    
    % now that we know its a win, find out which player has won
    [win, winner] = checkWin(board);
    
    if winner == 1 % if red wins
        humanwin = msgbox({'Red Won!'}); %output red wins
    else % if black wins
        aiwin = msgbox({'Black Won!'}); %output black wins
    end
end