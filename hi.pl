progenitor(alex, john).
add(X,L,[X|L]).

del(X,[X|Tail],[Tail]).
del(X,[Y|Tail],[Y|Tail1]):-del(X,Tail,Tail1).

del1(X,[X|Tail],Tail).
del1(X,[Y|Tail],[Y|Tail1]):- del(X,Tail,Tail1).

del2(X,[X|Tail],Tail).
del2(X,[Y|Tail],[Y|Tail1]):- del(X,Tail,Tail1).