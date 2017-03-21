function [storeCol, storeSlice]=smartAI(board)
rng('shuffle');

% store the dimensions of the board
dimBoard = size(board);
numRows = dimBoard(1);
numCols = dimBoard(2);
numSlice = dimBoard(3);

% FIRST, CHECK FOR THREE IN A ROW
for z = 1:numSlice
    for y = 1:numCols
        for x = 1:numRows
            if board(x,y,z) == 0 % for each empty space
                % CONNECT FOUR IN A ROW VERTICALLY
                if (x+3<=numRows && x+2<=numRows && x+1<=numRows) % if not out of bounds
                    if board(x+1,y,z)~=0 % if not suspended
                        if (board(x+1,y,z)==board(x+2,y,z) && board(x+2,y,z)==board(x+3,y,z))% if three in  a row
                            storeCol=y; % storeCol and storeSlice activates AI move
                            storeSlice=z;
                            return
                        end
                    end
                end
                % CONNECT FOUR IN A ROW HORIZONTALLY ON THE RIGHT
                if (y>=4) % if not out of bounds
                    if board(x,y-1,z)~=0 % as long as three in a row aren't three empties in a row
                        if (board(x,y-1,z)==board(x,y-2,z) && board(x,y-2,z)==board(x,y-3,z))% if three in  a row
                            if x==numRows % can place if on the bottom
                                storeCol=y; % storeCol and storeSlice activates AI move
                                storeSlice=z;
                                return
                            end
                            if board(x+1,y,z)~=0 % can place if not suspended
                                storeCol=y; % storeCol and storeSlice activates AI move
                                storeSlice=z;
                                return
                            end
                        end
                    end
                end
                % CONNECT FOUR IN A ROW HORIZONTALLY ON THE LEFT
                if (y+3<=numCols) % if not out of bounds
                    if board(x,y+1,z)~=0 % as long as three in a row aren't three empties in a row
                        if (board(x,y+1,z)==board(x,y+2,z) && board(x,y+2,z)==board(x,y+3,z))% if three in  a row
                            if x==numRows % can place if on the bottomstoreCol=y;
                                storeCol=y; % storeCol and storeSlice activates AI move
                                storeSlice=z;
                                return
                            end
                            if board(x+1,y,z)~=0 % can place if not suspended
                                storeCol=y; % storeCol and storeSlice activates AI move
                                storeSlice=z;
                                return
                            end
                        end
                    end
                end
            end % end search for empty space
        end
    end
end % end search through every space

% NEXT, CHECK FOR TWO IN A ROW
for z = 1:numSlice
    for y = 1:numCols
        for x = 1:numRows
            if board(x,y,z) == 0 % for each empty space
                % CONNECT THREE IN A ROW HORIZONTALLY ON THE RIGHT
                if (y>=3) % if not out of bounds
                    if board(x,y-1,z)~=0 % as long as two in a row aren't three two in a row
                        if (board(x,y-1,z)==board(x,y-2,z))% if three in  a row
                            if x==numRows % can place if on the bottom
                                storeCol=y; % storeCol and storeSlice activates AI move
                                storeSlice=z;
                                return
                            end
                            if board(x+1,y,z)~=0 % can place if not suspended
                                storeCol=y; % storeCol and storeSlice activates AI move
                                storeSlice=z;
                                return
                            end
                        end
                    end
                end
                % CONNECT THREE IN A ROW HORIZONTALLY ON THE LEFT
                if (y+2<numCols) % if not out of bounds
                    if board(x,y+1,z)~=0 % as long as two in a row aren't two empties in a row
                        if (board(x,y+1,z)==board(x,y+2,z))% if three in  a row
                            if x==numRows % can place if on the bottomstoreCol=y;
                                storeCol=y; % storeCol and storeSlice activates AI move
                                storeSlice=z;
                                return
                            end
                            if board(x+1,y,z)~=0 % can place if not suspended
                                storeCol=y; % storeCol and storeSlice activates AI move
                                storeSlice=z;
                                return
                            end
                        end
                    end
                end
                % CONNECT THREE IN A ROW VERTICALLY
                if (x+2<=numRows && x+1<=numRows)
                    if x-1>=1
                        if board(x+1,y,z)~=0
                            if (board(x+1,y,z)==board(x+2,y,z) )% if three in  a row
                                storeCol=y; % storeCol and storeSlice activates AI move
                                storeSlice=z;
                                return
                            end
                        end
                    end
                end
            end % end search for empty space
        end
    end
end % end search through every space

% NEXT, CONNECT TWO IN A ROW
for z = 1:numSlice
    for y = 1:numCols
        for x = 1:numRows
            if board(x,y,z) == 0 % for each empty space
                % CONNECT TWO IN A ROW VERTICALLY
                if (x+3<=numRows) % if enough space above that four in a row is possible
                    if board(x+1,y,z)==-1 % place piece if spot below is AI piece
                        storeCol=y; % storeCol and storeSlice activates AI move
                        storeSlice=z;
                        return
                    end
                end
                % CONNECT TWO IN A ROW HORIZONTALLY ON THE RIGHT
                if y<numCols && y>1 % if space the right
                    if board(x,y-1,z)== -1 % if piece to the left is AI piece
                        if x==numRows % can place if on the bottom
                            storeCol=y; % storeCol and storeSlice activates AI move
                            storeSlice=z;
                            return
                        end
                        if board(x+1,y,z)~=0 % can place if not suspended
                            storeCol=y; % storeCol and storeSlice activates AI move
                            storeSlice=z;
                            return
                        end
                    end
                end
                
                % CONNECT TWO IN A ROW HORIZONTALLY ON THE LEFT
                if y>=2 && y+1<=numCols % if space to the left
                    if board(x,y+1,z)== -1 % if piece the right is AI piece
                        if x==numRows % can place if on the bottom
                            storeCol=y+1; % storeCol and storeSlice activates AI move
                            storeSlice=z;
                            return
                        end
                        if board(x+1,y,z)~=0 % can place if not suspended
                            storeCol=y; % storeCol and storeSlice activates AI move
                            storeSlice=z;
                            return
                        end
                    end
                end
                
            end % end search for empty space
        end
    end
end % end search through every space


% if still hasn't found a good location, make a random move
storeCol = randi(numCols);
storeSlice = randi(numSlice);


end






