:- op(500, xfy, <-).

intra_construction(X <- A, X <- B, X <- C, Z1 <- A1, Z1 <- B1) :-
    intersection(A, B, I),
    I \= [],
    gensym(z, Z1),
    subtract(A, I, A1),
    subtract(B, I, B1),
    append(I, [Z1], C).
    
absorption(X <- A, Z <- B, X <- C, Z <- B) :-
    intersection(A, B, I),
    subset(B, A),
    subtract(A, I, A1),
    append(A1, [Z], C).


truncation(X <- A, X <- B, X <- C) :-
    intersection(A, B, C).