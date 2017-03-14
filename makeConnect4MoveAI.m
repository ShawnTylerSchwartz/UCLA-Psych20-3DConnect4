function [updatedBoard, player, x_loc, y_loc, z_loc] = makeConnect4MoveAI(board, currentPlayer)
% RANDOMLY places piece somewhere on board 
% input = board (any size, of all zeros) , current player (symbolized by 1
% or -1) 
%
% to use: [updatedBoard, player] = makeConnect4MoveAI(board, currentPlayer)
%   this will store the new board in updatedBoard and set player to the
%   opposite you used originally 
%
% to use a second time: [updatedBoard, player] = makeConnect4MoveAI(updatedBoard, player)
%   with this you can just keep looping through 

rng('shuffle'); 

% store the dimensions of the board 
dimBoard = size(board);
numRows = dimBoard(1); 
numCols = dimBoard(2);
numSlice = dimBoard(3);

% decide whether to use SmartAI:instantWin function during gameplay
randomPlayDecision = randi(10);
if rem(randomPlayDecision, 2) == 1 % if its odd
    useSmartAI = 1; % use the instant win AI algorithm
else  % if its even
    useSmartAI = 0; % let the AI play randomly
end

% using the SmartAI:instantWin function for AI gameplay
if (useSmartAI == 1)
    [col_loc, row_loc, slice_loc] = instantWin(board); % call the instantWin function
    
    % ensure that pieces still follow the gravity function when they fall
    % into the game board
    for r = 1:numRows
        if board(r, col_loc, slice_loc) == 0 && r == numRows
            board(row_loc, col_loc, slice_loc) = currentPlayer;
            storeRow = r;
        end
        if board(r, col_loc, slice_loc) == 0 && board(r+1, col_loc, slice_loc) ~= 0
            board(r, col_loc, slice_loc) = currentPlayer;
            storeRow = r;
        end 
        if board(r, col_loc, slice_loc) == 0 && board(r+1, col_loc, slice_loc) == 0
            board(r,col_loc, slice_loc) = 0; 
            storeRow = r;
        end
    end
    
    % store the x y z coordinate locations for the game piece after each
    % smart AI decision is made
    x_loc = col_loc;
    y_loc = row_loc;
    z_loc = slice_loc;

% not using the SmartAI:instantWin function for AI gameplay and instead
% using primitive methods
elseif(useSmartAI == 0)
    % randomly select column for primitive AI gameplay 
    col = randi(numCols); 
    slice = randi(numSlice);

    % use gravity function (for dropping pieces) 
    for r = 1:numRows

        %if the spot is not filled and it's the last one, put their piece there
        if board(r, col, slice) == 0 && r == numRows
            board(r,col, slice) = currentPlayer; 
            storeRow = r;
        end

        %if the spot isn't filled  and the one right after is, put their piece there 
        if board(r,col, slice) == 0 && board(r+1, col, slice) ~= 0
            board(r,col, slice) = currentPlayer;
            storeRow = r;
        end 

        %if the spot isn't filled and neither is the one below, break out 
        if board(r, col, slice) == 0 && board(r+1, col, slice) == 0
            board(r,col, slice) = 0; 
            storeRow = r;
        end
    end
    
    % store the x y z coordinate locations for the game piece after each
    % primitive decision is made
    x_loc = col;
    y_loc = storeRow;
    z_loc = slice;
end

% setup output values for output matrix
updatedBoard = board; 
player = currentPlayer * (-1); 

end