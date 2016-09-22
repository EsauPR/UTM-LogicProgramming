% Autor:
% Fecha: 25/11/2014

bebida(jugo).
bebida(agua).
bebida(cerveza).
bebida(refresco).
bebida(vino).

elige2(X,Y):-bebida(X),bebida(Y).
elige2a(X,Y):-bebida(X),bebida(Y),!.

lista_numero(N,N,[N]).
lista_numero(N,M,[N|Resto]):- N < M, N1 is N + 1, lista_numero( N1, M, Resto ) .

%sumaParImpar
suma_Par_Impar([],0,0).
suma_Par_Impar([X|Resto],Spar,SImpar):- X1 is X mod 2, X1 =:= 0, suma_Par_Impar(Resto,SparR,SImpar), Spar is SparR + X.
suma_Par_Impar([X|Resto],Spar,SImpar):- X1 is X mod 2, X1 =:= 1, suma_Par_Impar(Resto,Spar,SImparR), SImpar is SImparR + X.

p(1).
p(2):-!.
p(3).

good_standard(jeanluis).
good_standard(francesco).
expensive(jeanluis).
reasonable(R):-not(expensive(R)).

% Un elemento pertence a un conjunto
concatenar([],L2,L2).
concatenar(L1,[],L1).
concatenar([X1|R1],[X2|R2],LR):-LR=[X1|RR],concatenar(R1,[X2|R2],RR).
pertenece(X,Lista):-concatenar(_Sublista,[X|_Resto],Lista).

%Intersección de dos conjuntos
interseccion([], _L2, []).
interseccion([X1,R1], L2, SetR ):-pertenece( X1, L2 ), !, SetR = [X1, SetRR], interseccion(R1, L2, SetRR).
interseccion([_X1,R1], L2, SetR):-interseccion( R1, L2, SetR ).

%Unión de dos conjuntos
union([], L2, L2).
union( [X1,R1], L2, SetR ):-not(pertenece(X1,L2)), !, union(R1, L2, SetRR), SetR = [X1,SetRR].