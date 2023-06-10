:- op(300, xfx, <-).
inter(C1 <- B1, C2 <- B2, C1 <- Z1B, C2 <- Z2B, C <- B) :-
C1 \= C2,
intersection(B1, B2, B),
B \= [],
gensym(z, C),
subtract(B1, B, B11),
subtract(B2, B, B12),
append(B11, [C], Z1B),
append(B12, [C], Z2B).