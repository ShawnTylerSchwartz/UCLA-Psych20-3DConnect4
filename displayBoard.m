function displayBoard(xdim,ydim,x,y,zdim,color)
% displayBoard displays the plot of the 3D game board and takes in values
% of x and y dimensions of the gameboard, x location, y location, z
% dimension of the board (depth) and color of the piece that is being
% played

maxDim = max([xdim ydim]); % find the maximum gameboard dimension value

hold on; % allow multiple game pieces to be plotted together on same game board

% determine the color of the piece that is being plotted on the game plot
if (strcmp(color,'red') == 1)
    subplot(maxDim,1,zdim)
    drawredcircle(x,y);
elseif (strcmp(color,'black') == 1)
    subplot(maxDim,1,zdim)
    drawblackcircle(x,y);
end

% format the game plot board to proper number of axis ticks and axis value
% limits & turn the axis grid on
xlim([1 xdim]);
ylim([-ydim 0]);
xticks([0:xdim]);
yticks([-ydim:1]);
grid on

end