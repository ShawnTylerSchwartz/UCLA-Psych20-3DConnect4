function [updatedBoard, player, x_loc, y_loc, z_loc] = makeConnect4MoveHuman(board, currentPlayer)
% Places piece in the column that player specifies  
% input = board (any size, of all zeros) , current player (symbolized by 1
% or -1) 
%
% to use: [updatedBoard, player] = human(board, currentPlayer)
%   this will store the new board in updatedBoard and set player to the
%   opposite you used originally 
%
% to use a second time: [updatedBoard, player] = human(updatedBoard, player)
%   with this you can just keep looping through 

% store the dimensions of the board 
dimBoard = size(board);
numRows = dimBoard(1); 
numCols = dimBoard(2);
numSlice = dimBoard(3);

prompt = {'Please enter column number:','Please enter slice number:'};
dlg_title = 'Input';
num_lines = 1;
defaultans = {'1','1'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
col = str2num(answer{1});
slice = str2num(answer{2});

% ask the user which column to drop piece in 
% col = input('Please enter column number: ');
% slice = input('Please enter in slice number: ');

if col > numCols
    error('Please select a valid column')
end

if slice > numSlice
    error('Please select a valid slice')
end 

% use gravity function (for dropping pieces) 
for r = 1:numRows
    
    % if the spot is not filled and it's the last one, put their piece there
    if board(r, col, slice) == 0 && r == numRows
        board(r,col, slice) = currentPlayer; 
        storeRow = r;
    end 
    
    % if the spot isn't filled  and the one right after is, put their piece there 
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

% setup output values for output matrix
updatedBoard = board; 
player = currentPlayer * (-1); 
x_loc = col;
y_loc = storeRow;
z_loc = slice;

end