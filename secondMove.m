function [col_loc, row_loc, slice_loc] = secondMove(board)
% outputs the best space

% store the dimensions of the board 
dimBoard = size(board);
numRows = dimBoard(1); 
numCols = dimBoard(2);
numSlice = dimBoard(3);
    
middleCol = round(numCols/2); 
middleSlice = round(numSlice/2);
    
    if board(numRows, middleCol - 1, middleSlice) == 0
        middleCol = middleCol - 1;
    elseif (board(numRows, middleCol - 1, middleSlice) == 1) && (board(numRows, middleCol + 1, middleSlice) == 0)
        middleSlice = middleSlice + 1;
    end
    
col_loc = middleCol; 
row_loc = numRows;
slice_loc = middleSlice; 

end 