function displayBoard(xdim,ydim,x,y,zdim,color)
maxDim = max([xdim ydim]);

hold on;


if (strcmp(color,'red') == 1)
    subplot(maxDim,1,zdim)
    drawredcircle(x,y);
elseif (strcmp(color,'black') == 1)
    subplot(maxDim,1,zdim)
    drawblackcircle(x,y);
end

 xlim([1 xdim]);
 ylim([-ydim 0]);
 xticks([0:xdim]);
 yticks([-ydim:1]);

grid on
end