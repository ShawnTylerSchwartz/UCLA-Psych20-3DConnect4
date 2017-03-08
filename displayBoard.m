function displayBoard(xdim,ydim,x,y,color)
hold on;
if (strcmp(color,'red') == 1)
    drawredcircle(x,y);
elseif (strcmp(color,'black') == 1)
    drawblackcircle(x,y);
end

 xlim([1 xdim]);
 ylim([-ydim 0]);
 xticks([0:xdim]);
 yticks([-ydim:1]);

grid on
end