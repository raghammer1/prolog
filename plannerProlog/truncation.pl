:- op(500, xfy, <-).
truncation(X <- A, X <- B, X <- C) :-
    intersection(A, B, C).
