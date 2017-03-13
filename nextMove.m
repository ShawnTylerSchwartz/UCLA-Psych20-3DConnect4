function [col, storeRow, slice] = nextMove(board, firstMoveCol, firstMoveSlice)
%move one space away to the right or left 

% store the dimensions of the board 
dimBoard = size(board);
numRows = dimBoard(1); 
numCols = dimBoard(2);
numSlice = dimBoard(3);

secMoveCol = firstMoveCol + 2; %look at spot one over to the right


if numCols == 4
    if board(numRow, secMoveCol, firstMoveSlice) ~= 0 %if it's filled  
        secMoveCol = firstMoveCol - 1; %change to spot one over to the left
        if board(numRow, secMoveCol, firstMoveSlice) ~= 0
            secMoveCol = firstMoveCol + 1; %put piece directly next to original (to the right) 
        end
 
    end

else
    if board(numRow, secMoveCol, firstMoveSlice) ~= 0 %if it's filled  
        secMoveCol = firstMoveCol - 2; %change to spot one over to the left
        if board(numRow, secMoveCol, firstMoveSlice) ~= 0
            secMoveCol = firstMoveCol + 1; %put piece directly next to original (to the right) 
            if board(numRow, secMoveCol, firstMoveSlice) ~= 0
                secMoveCol = firstMoveCol - 1; 
            end 
        end
 
end 
end 


col = secMoveCol; 
slice = firstMoveSlice; 
storeRow = numRows;    

end 