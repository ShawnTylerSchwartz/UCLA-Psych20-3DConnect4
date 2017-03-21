function [updatedBoard, player, x_loc, y_loc, z_loc] = makeConnect4MoveAI(board, currentPlayer)
%RANDOMLY places piece somewhere on board 
% input = board (any size, of all zeros) , current player (symbolized by 1
% or -1) 
%
% to use: [updatedBoard, player] = makeConnect4MoveAI(board, currentPlayer)
%   this will store the new board in updatedBoard and set player to the
%   opposite you used originally 
%
% to use a second time: [updatedBoard, player] = makeConnect4MoveAI(updatedBoard, player)
%   with this you can just keep looping through 



%find the dimensions of the board 
dimBoard = size(board);
numRows = dimBoard(1); 
numCols = dimBoard(2);
numSlice = dimBoard(3);

[storeCol,storeSlice] = AISmartDecision(board); 
col = storeCol; 
slice = storeSlice; 



%use gravity function 
for r = 1:numRows
    %if the spot is not filled and it's the last one, put their piece there
    if board(r, col, slice) == 0 && r == numRows
        board(r,col, slice) = currentPlayer;
        storeRow = r;
        
    end
    %if the spot isn't filled  and the one right after is, put their piece
    %there
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

updatedBoard = board; 
player = currentPlayer * (-1); 
x_loc = col;
y_loc = storeRow;
z_loc = slice;

end