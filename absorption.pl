:- op(500, xfy, <-).
absorption(X <- A, Z <- B, X <- C, Z <- B) :-
    intersection(A, B, I),
    subset(B, A),
    subtract(A, I, A1),
    append(A1, [Z], C).