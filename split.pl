% % split([],_,[],[]). % Base case nothing given
% split(L,0,[],L).

% split([H|T],X,[X,Ys],Ks):- X > 0, X1 is X - 1, split([T],X1,Ys,Ks).

% split(L,N,F,S) :- the list F contains the first N elements
%    of the list L, the list S contains the remaining elements.

split(L,0,[],L). % Base Case: N = 0

split([X|Xs],N,[X|Ys],Zs):- N > 0, N1 is N-1, split(Xs,N1,Ys,Zs).
