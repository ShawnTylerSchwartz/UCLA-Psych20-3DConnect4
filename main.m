% clear console, variables and plots for fresh game
clc
clear;
close all;
rng('shuffle');

%count AI moves 
AIcount = 0; 

% take in dimensions of the game playing board
boardWidth = input('Input width of board: ');
boardHeight = input('Input height of board: ');
boardDepth = input('Depth of board: ');

% create the game playing board object
board = zeros(boardWidth, boardHeight, boardDepth);

% randomly decide which player will start (AI or Human)
randTurn = randi(10);
if rem(randTurn,2) == 1 % if its odd
    player = 1; % it is the humans turn
else  % if its even
    player = -1; % its the AIs turn
end

% display the empty game board in the console
disp(board);

% calculate the maximum dimensions of the game playing board from input
maxDims = max([boardWidth boardHeight]);

% create properly formatted subplots for each dimension of the depth of the
% game board
for i = 1:boardDepth
    subplot(maxDims,1,i);
    grid on
    xlim([1 boardWidth]);
    ylim([-boardHeight 0]);
    xticks([0:boardWidth]);
    yticks([-boardHeight:1]);
end

% continue to check if any player has won and if not continue allowing
% gameplay
while checkWin(board) == 0
    
    % if 1, it is the humans turn
    if player == 1
        disp('Human turn'); % tell the console whos turn it is
        % call the makeConnect4MoveHuman function and store the coordinate locations
        %  for formatted plotting (i.e. proper color of the game piece: red)
        [board, player, x_loc, y_loc, z_loc] = makeConnect4MoveHuman(board, player);
        displayBoard(boardWidth,boardHeight,x_loc,-y_loc,z_loc,'red');
    
    % if -1, it is the AIs turn
    elseif player == -1
        disp('AI Turn'); % tell the console whos turn it is
        % call the makeConnect4MoveAI function and store the coordinate locations
        %  for formatted plotting (i.e. proper color of the game piece: black)
        [board, player, x_loc, y_loc, z_loc] = makeConnect4MoveAI(board, player);
        displayBoard(boardWidth,boardHeight,x_loc,-y_loc,z_loc,'black');      
    end
    
    disp(board); % display the updated version of the game board in the console
    
end

% now that we know its a win, find out which player has won
[win, winner] = checkWin(board);

if winner == 1 % if the human wins
    disp('Human won!'); % print this to the console
else % if the AI wins
    disp('AI won!'); % print this to the console
end