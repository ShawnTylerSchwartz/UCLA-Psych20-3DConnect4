clc
clear;
close all;
rng('shuffle');

boardWidth = input('Input width of board: ');
boardHeight = input('Input height of board: ');
boardDepth = input('Depth of board: ');

board = zeros(boardWidth, boardHeight, boardDepth);

randTurn = randi(10);
if rem(randTurn,2) == 1
    player = 1;
else 
    player = -1;
end

disp(board);
maxDims = max([boardWidth boardHeight]);
for i = 1:boardDepth
    subplot(maxDims,1,i);
    grid on
     xlim([1 boardWidth]);
 ylim([-boardHeight 0]);
 xticks([0:boardWidth]);
 yticks([-boardHeight:1]);
end
while checkWin(board) == 0
    if player == 1
        disp('Human turn');
        [board, player, x_loc, y_loc, z_loc] = makeConnect4MoveHuman(board, player);
        displayBoard(boardWidth,boardHeight,x_loc,-y_loc,z_loc,'red');
        
    
    
    elseif player == -1
        disp('AI Turn');
% %         board = makeConnect4MoveAI(board, player);
%         [~, ~, x_loc, y_loc] = makeConnect4MoveAI(board, player);
%         displayBoard(boardWidth,boardHeight,y_loc,x_loc,'black');

    [board, player, x_loc, y_loc, z_loc] = makeConnect4MoveAI(board, player);
        displayBoard(boardWidth,boardHeight,x_loc,-y_loc,z_loc,'black');
      
    end
%     player = player * (-1);
    disp(board);
%     displayBoard(boardWidth,boardHeight,y_loc,-x_loc,'red');
end

[win, winner] = checkWin(board);

if winner == 1
    disp('Human won!');
else
    disp('AI won!');
end
