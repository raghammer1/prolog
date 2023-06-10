size([],0). % base case

size([_|T],X):-size(T,X1), X is X1 + 1.
