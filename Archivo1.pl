% Autor:
% Fecha: 25/11/2014

bebida(jugo).
bebida(agua).
bebida(cerveza).
bebida(refresco).
bebida(vino).

elige2(X,Y):-bebida(X),bebida(Y).
elige2a(X,Y):-bebida(X),!,bebida(Y).
