function [storeCol, storeSlice]=untitled11(board)

% store the dimensions of the board
dimBoard = size(board);
numRows = dimBoard(1);
numCols = dimBoard(2);
numSlice = dimBoard(3);

move = 0;

if move ==0 % blocking 3 in a row vetically % successfully works 
    for z = 1:numSlice
        for y = 1:numCols
            for x = 1:numRows
                if board(x,y,z) == 0 % for each empty space
                    if (x+3<=numRows && x+2<=numRows && x+1<=numRows) % if not out of bounds 
                        if board(x+1,y,z)~=0 % if not suspended
                            if (board(x+1,y,z)==board(x+2,y,z) && board(x+2,y,z)==board(x+3,y,z))% if three in  a row 
                                storeCol=y; 
                                storeSlice=z; 
                                move = 1; % store the location to make a move 
                            end
                        end
                    end
                end    
            end
        end
    end
end

if move ==0 % blocking three in a row horizontally to the left % does not work, not quite sure why 
    for z = 1:numSlice
        for x = 1:numRows
            for y = 1:numCols
                if board(x,y,z) == 0 % for each empty space
                    if (y+1<=numCols && y+2<=numCols && y+3<=numCols) % if not out of bounds 
                        if x==numRows % can place if on the bottom 
                            if (board(x,y+1,z)==board(x,y+2,z) && board(x,y+2,z)==board(x,y+3,z))% if three in  a row
                                storeCol=y;
                                storeSlice=z;
                                move = 1; % store the location to make a move 
                            end
                        elseif board(x+1,y,z)~=0 % can place if not suspended
                            if (board(x,y+1,z)==board(x,y+2,z) && board(x,y+2,z)==board(x,y+3,z))% if three in  a row
                                storeCol=y;
                                storeSlice=z;
                                move = 1; % store the location to make a move 
                            end
                        end
                    end
                end
            end
        end
    end
end

if move ==0 % blocking three in a row horizontally to the right  % does not work, not quite sure why 
    for z = 1:numSlice
        for x = 1:numRows
            for y = 1:numCols
                if board(x,y,z) == 0 % for each empty space
                    if ( y>=4) % if not out of bounds 
                        if x==numRows % can place if on the bottom 
                            if (board(x,y-1,z)==board(x,y-2,z) && board(x,y-2,z)==board(x,y-3,z))% if three in  a row 
                                storeCol=y; 
                                storeSlice=z; 
                                move = 1; % store the location to make a move 
                            end
                        elseif board(x+1,y,z)~=0 % can place if not suspended
                            if (board(x,y-1,z)==board(x,y-2,z) && board(x,y-2,z)==board(x,y-3,z))% if three in  a row
                                storeCol=y;
                                storeSlice=z;
                                move = 1; % store the location to make a move 
                            end                         
                        end
                    end
                end
            end
        end
    end
end

if move ==0 % blocking two in a row vertically % successfully works 
    for z = 1:numSlice
        for y = 1:numCols
            for x = 1:numRows
                if board(x,y,z) == 0 % for each empty space
                    if (x+2<=numRows && x+1<=numRows)
                        if x-1>=1
                            if board(x+1,y,z)~=0
                                if (board(x+1,y,z)==board(x+2,y,z) )% if three in  a row 
                                    storeCol=y; 
                                    storeSlice=z;
                                    move = 1; 
                                end
                            end
                        end
                    end
                end    
            end
        end
    end
end






if move == 0 % if still hasn't found a good location, make a random move 
    storeCol = randi(numCols); 
    storeSlice=randi(numSlice); 
end

end




