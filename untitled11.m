function [storeCol, storeSlice]=untitled11(board)

% store the dimensions of the board
dimBoard = size(board);
numRows = dimBoard(1);
numCols = dimBoard(2);
numSlice = dimBoard(3);

storeCol = 0; % round up
storeSlice = 0;

move = 0;
if move ==0
    for z = 1:numSlice
        for x = 1:numRows
            for y = 1:numCols
                yValue=y;
                if board(x,y,z) ~= 0 % check if a spot is full
                    if yValue <= numCols-1
                        if board(x,yValue,z) == board(x,yValue+1,z) % two in a row
                            if yValue <= numCols-2
                                if board(x,yValue+2,z) == 0 % if third spot is empty, place piece there
                                    if x ~= numRows
                                        
                                        if board(x+1,yValue+2,z)==0 % check below
                                            move = 0;
                                        end
                                    else
                                        board(x,yValue+2,z) = -1;
                                        move = 1;
                                        storeCol=yValue+2;
                                        storeSlice=z;
                                        break
                                    end
                                end
                            elseif yValue <= numCols-3
                                if board(x,yValue+1,z) == board(x,yValue+2,z) == board(x,yValue)
                                    if board(x,yValue+3,z) == 0
                                        if x ~= numRows
                                            
                                            if board(x+1,yValue+3,z)==0 % check below
                                                move = 0;
                                            end
                                        else
                                            board(x,yValue+3,z) = -1;
                                            move = 1;
                                            storeCol=yValue+3;
                                            storeSlice=z;
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

if move == 0
    for z = 1:numSlice
        for x = 1:numRows
            for y = 1:numCols
                board=fliplr(board);
                yValue=y;
                if board(x,y,z) ~= 0 % check if a spot is full
                    
                    if yValue <= numCols-1
                        if board(x,yValue,z) == board(x,yValue+1,z) % two in a row
                            
                            if yValue <= numCols-2
                                if board(x,yValue+2,z) == 0 % if third spot is empty, place piece there
                                    if x ~= numRows
                                        if  board(x+1,yValue+2,z)==0 % check below
                                            move = 0;
                                        end
                                    else
                                        board(x,yValue+2,z) = -1;
                                        move = 1;
                                        board=fliplr(board);
                                        storeCol=yValue+2;
                                        storeSlice=z;
                                        break
                                    end
                                end
                                
                            elseif yValue <= numCols-3
                                if board(x,yValue+1,z) == board(x,yValue+2,z) == board(x,yValue,z)
                                    if x ~= numRows
                                        if  board(x+1,yValue+2,z)==0 % check below
                                            move = 0;
                                        end
                                    else
                                        board(x,yValue+2,z) = -1;
                                        move = 1;
                                        board=fliplr(board);
                                        storeCol=yValue+2;
                                        storeSlice=z;
                                        break
                                    end
                                end
                            end
                        end
                    end
                end
                
            end
        end
        board=fliplr(board);
    end
end

if move == 0
    for z = 1:numSlice
        for x = 1:numRows
            for y = 1:numCols
                board=flipud(board);
                xValue=x;
                if board(x,y,z) ~= 0 % check if a spot is full
                    
                    if xValue <= numRows-3
                        if board(xValue,y,z) == board(xValue+1,y,z) % two in a row
                            
                            if xValue <= numRows-2
                                if board(xValue+2,y,z) == 0 % if third spot is empty, place piece there
                                    board(xValue+2,y,z) = -1;
                                    move = 1;
                                    board=flipud(board);
                                    storeCol=y;
                                    storeSlice=z;
                                    break
                                elseif xValue <= numRows-1
                                    if board(xValue+1,y,z) == board(xValue+2,y,z) == board(xValue,y,z)
                                        if board(xValue+3,y,z) == 0
                                            board(xValue+3,y,z) = -1;
                                            move = 1;
                                            board=flipud(board);
                                            storeCol=y;
                                            storeSlice=z;
                                            break
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                
            end
        end
        board=flipud(board);
    end
end

if move == 0
    storeCol = randi(numCols); 
    storeSlice=randi(numSlice); 
end

disp(board); 
end