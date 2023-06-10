range(X,X,[X]). % Base Case X==Y

range(X,Y,[X|S]):-X < Y, X1 is X + 1, range(X1,Y,S). % This will also print the case where X == Y 
% as when X = Y - 1 it satisfied the condition X < Y then 1 was added to it and it was added to the list to unsatisfy the equation X < Y

