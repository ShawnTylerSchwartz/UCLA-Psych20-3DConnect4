function [column, slice] = instantWin(board)
%outputs the best space

% store the dimensions of the board 
dimBoard = size(board);
numRows = dimBoard(1); 
numCols = dimBoard(2);
numSlice = dimBoard(3);

middleCol = round(numCols/2); 
middleSlice = round(numSlice/2);

%AI first move 
if board(numRows, middleCol, middleSlice) == 0
    middleSlice = middleSlice - 1; 
end 

end 