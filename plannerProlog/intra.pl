:- op(500, xfy, <-).
intra_construction(X <- A, X <- B, X <- C, Z1 <- A1, Z1 <- B1) :-
    intersection(A, B, I),
    I \= [],
    gensym(z, Z1),
    subtract(A, I, A1),
    subtract(B, I, B1),
    append(I, [Z1], C).



% :- op(500, xfy, <-).
% list_intersection([], _, []).
% list_intersection([X|L1], L2, [X|L3]):- member(X, L2), !, remove_element(X, L2, NewL2), list_intersection(L1, NewL2, L3).
% list_intersection([_|L1], L2, L3):- list_intersection(L1, L2, L3).

% remove_element(X, L, NewL):- append(L1, [X|L2], L), append(L1, L2, NewL).

% intra_construction(X <- A, X <- B, X <- C, Z1 <- A1, Z1 <- B1) :-
%     list_intersection(A, B, I),
%     I \= [],  %  predicate should fail if there is no intersection between the two clauses A and B
%     subtract(A, I, A1),
%     subtract(B, I, B1),
%     append(I, [Z1], C).
   