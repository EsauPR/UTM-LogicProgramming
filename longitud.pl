% Autor:
% Fecha: 24/11/2014

% Calcula la longitud de una lista
longitud([],0).
longitud([_X|Resto],Long):-longitud(Resto,LongR), Long is 1 + LongR.

% Devuelve el máximo de dos elementos
mayor(X,Y,X):- X > Y.
mayor(X,Y,Y):- Y > X.

% Devuelve el máximo de una lista
max([X],X).
max([X|Resto],Max):-max(Resto,R),mayor(X,R,Max).

%suma de los elementos de una lista
suma([X],X).
suma([X|Resto],Sum):-suma(Resto,R), Sum is X + R.

% Verificar si la lista está ordenada ascendentemente
aMayorB(X,Y) :- Y > X.
ordenada([_X]).
ordenada([X|[Y|Resto]]):-aMayorB(X,Y),ordenada([Y|Resto]).
