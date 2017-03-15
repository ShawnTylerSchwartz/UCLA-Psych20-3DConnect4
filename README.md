# UCLA Psychology 20 Final Project: 3D Connect 4

![3D Connect 4](http://sinclairsmithco.com/wp-content/uploads/2012/11/Sinclair_Smith_Wood_Toy.jpg)

### Allow the AI to play itself in order to test AI functionality
```MATLAB
board = zeros(4,4,4);
playerID = 1;
while ~checkWin(board)
  [board, playerID] = makeConnect4MoveAI(board, playerID);
  displayBoard(board);
end
```
