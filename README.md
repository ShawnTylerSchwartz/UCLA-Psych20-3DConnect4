# UCLA Psychology 20 Final Project: 3D Connect 4

![3D Connect 4](http://sinclairsmithco.com/wp-content/uploads/2012/11/Sinclair_Smith_Wood_Toy.jpg)

### Descriptions of Files
**makeConnect4MoveAI.m** takes a matrix as input that represents a game-playing board and a number representing whose turn it is. The function updates the console with a matrix of -1's, 0's, and 1's.
- 0's represent empty positions in the board
- 1's represent one player's pieces
- -1's represent the other player's pieces
Accepts _any_ size 3D board as long as all of the dimensions are at least 4.

**makeConnect4MoveHuman.m** plays against the game's AI. Takes as input a board and a number that indicates whose move it is--just like the AI function. The function asks the user for an input to specify where they would like to make their move. It then updates the board and outputs the updated board and whose turn it is.

**GUI.m** 
- (1) Displays the board
- (2) Randomly decides who goes first, the human player or the AI player
- (3) Alternates between calling **makeConnect4MoveAI** and **makeConnect4MoveHuman** until someone wins. This function takes in as input the size of the board to be played.

### Allow the AI to play itself in order to test AI functionality
```MATLAB
board = zeros(4,4,4);
playerID = 1;
while ~checkWin(board)
  [board, playerID] = makeConnect4MoveAI(board, playerID);
  displayBoard(board);
end
```
