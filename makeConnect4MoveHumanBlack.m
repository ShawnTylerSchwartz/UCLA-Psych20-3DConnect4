function [updatedBoard, player, x_loc, y_loc, z_loc] = makeConnect4MoveHumanBlack(board, currentPlayer)
% Places piece in the column that player specifies. Specifies whose turn it is by titling the dialog box
% input = board (any size, of all zeros) , current player (symbolized by 1
% or -1)
% output = updated board ; next player ; column number ; row number ; slice
% number

% store the dimensions of the board
dimBoard = size(board);
numRows = dimBoard(1);
numCols = dimBoard(2);
numSlice = dimBoard(3);

%creating dialog box
prompt = {'Enter slice number: ' 'Enter column number: '};
dlg_title = 'Black Turn'; %title
answer = inputdlg(prompt,dlg_title);
slice = str2num(answer{1}); %getting the input to use later
col = str2num(answer{2});

%checking to make sure they inputed valid numbers
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