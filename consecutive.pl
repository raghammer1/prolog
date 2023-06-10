compress([],[]). % Base case: L is empty
compress([H],[H]). % Base case: L has only one element

compress([X,X|T],S):-compress([X|T],S). % Works if list only contains one type of element meaning only 3's or e's etc

compress([X,Y|T],[X|S]):-X \= Y, compress([Y|T],S).