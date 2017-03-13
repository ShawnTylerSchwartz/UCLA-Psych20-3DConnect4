function [column, slice] = secondMove(board, firstMoveCol, firstMoveSlice)
%move one space away to the right or left 

secMoveCol = firstMoveCol + 2; %look at spot one over to the right

if board(numRow, secMoveCol, firstMoveSlice) ~= 0 %if it's filled  
    secMoveCol = firstMoveCol - 2; %change to spot one over to the left
    %if board(numRow, firstMoveCol - 2, firstMoveSlice) ~= 0
end 

column = secMoveCol; 
slice = firstMoveSlice;      

end 