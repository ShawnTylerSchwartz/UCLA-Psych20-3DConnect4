function [col_loc, row_loc, slice_loc] = instantWin(board)
% instantWin is a 'smart' AI function that attempts to win using a
% preprogrammed set of strategic moves

% store the dimensions of the board 
dimBoard = size(board);
numRows = dimBoard(1); 
numCols = dimBoard(2);
numSlice = dimBoard(3);

minCol = 1; % the lower bound of the game board

% calculate the middle coordinates of the column and slice dimensions of
% the game board
middleCol = round(numCols/2); 
middleSlice = round(numSlice/2);
    
    % strategic move function to determine piece position based on
    % conditions such as where current pieces are located
    if board(numRows, middleCol, middleSlice) == 0
        middleCol = middleCol;
    elseif board(numRows, middleCol, middleSlice) ~= -1
        middleSlice = middleSlice - 1;
    elseif board(numRows, middleCol - 1, middleSlice) == 0
        middleCol = middleCol - 1;
    elseif (board(numRows, middleCol - 1, middleSlice) == 1) || (board(numRows, middleCol + 1, middleSlice) == 0)
        middleCol = middleCol + 1;
    elseif (board(numRows, middleCol + 1, middleSlice) == 0)
        middleCol = middleCol + 1;
    elseif (board(numRows, minCol, middleSlice) == 0)
        middleCol = minCol;
    elseif (board(numRows, minCol, middleSlice) == 1) || (board(numRows, minCol, middleSlice) == -1)
        middleCol = numCols;
    end

% store the coordinates x y z coordinates of the piece positions after each
% AI gameplay decision is made
col_loc = middleCol;  % x coordinate location
row_loc = numRows; % y coordinate location
slice_loc = middleSlice;  % z coordinate location

end 