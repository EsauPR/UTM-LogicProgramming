/*
	Definir la relación trasladar(L1,L2) que permita trasladar una lista de números
	L1 a una lista de sus correspondientes nombres L2 
	
	Ejemplo 
	
	?- trasladar([1,2,3,7],[uno,dos,tres,siete]).
	True

*/

par(L):- 
	longitud(L,Long),
	L1 is Long mod 2,
	L1 =:= 0.

impar(L):- 
	longitud(L,Long),
	L1 is Long mod 2,
	L1 =:= 1.


/*
	Definir dos predicados: par(Lista), impar(Lista) que serán verdaderos si
	Lista tiene un número par e impar de elementos, respectivamente.
	?- par([1,2,3,7]).
	True
*/

/* Definir un predicado que reciba una lista de numero y un numero e indique si los elementos de la lista son menores al numero */

cota_Superior([],N):-N>=0.
cota_Superior([X|Resto],N):-
	X=<N,
	cota_Superior(Resto,N).

longitud([],0).
longitud([X|Resto],Long):-
	longitud(Resto,LongR),
	Long is 1 + LongR.

/* adicionar al final de una lista */
add_end(X, [], [X]).
add_end(X, [C|R], [C|R1]):-
	add_end(X, R, R1).

/* borrar el ultimo elemento de una lista */
eliminaU(L,L1):-
	add_end(_,L1,L). 

ultimo(X,Lista):-
	concatenar(Sublista,[X],Lista).

concatenar([],L2,L2).
concatenar(L1,[],L1).
concatenar([X1|R1],[X2|R2],LR):-
	LR=[X1|RR],
	concatenar(R1,[X2|R2],RR).


suma_posiciones([],N,0).
suma_posiciones(L1,N,Suma):-
	longitud(L1,Long),
	X1 is Long mod N,
	X1 =:= 0,!,
	ultimo(U,L1),
	eliminaU(L1,L2),
	suma_posiciones(L2,N,S1),
	Suma is U + S1.

suma_posiciones(L1,N,Suma):-
	eliminaU(L1,L2),
	suma_posiciones(L2,N,Suma).

sumadigitos(0,0).
sumadigitos(Num,Sum):-
	M is Num mod 10,
	NumN is Num // 10,
	sumadigitos(NumN,Sum1),
	Sum is M + Sum1.

reversa([],[]).
reversa([X|Resto],LR):-
	ultimo(X,LR),
	concatenar(LT,[X],LR),
	reversa(Resto,LT).

crecimiento([X],[X]).

crecimiento([X,Y|Resto],ListaR):-
	X < Y,!,
	crecimiento([Y|Resto],LTmp),
	concatenar([X,+],LTmp,ListaR).
	

crecimiento([X,Y|Resto],ListaR):-
	crecimiento([Y|Resto],LTmp),
	concatenar([X,-],LTmp,ListaR).
	
factorial(0,1).
factorial(1,1).
factorial(N,NumF):-
	N1 is N-1, 
	factorial(N1,NumF1),
	NumF is N * NumF1.

cuentavocales([],0).

cuentavocales([X|Resto],NumV):-
	X = a,!,
	cuentavocales(Resto,NumVR),
	NumV is 1 + NumVR.
cuentavocales([X|Resto],NumV):-
	X = e,!,
	cuentavocales(Resto,NumVR),
	NumV is 1 + NumVR.
cuentavocales([X|Resto],NumV):-
	X = i,!,
	cuentavocales(Resto,NumVR),
	NumV is 1 + NumVR.
cuentavocales([X|Resto],NumV):-
	X = o,!,
	cuentavocales(Resto,NumVR),
	NumV is 1 + NumVR.
cuentavocales([X|Resto],NumV):-
	X = u,!,
	cuentavocales(Resto,NumVR),
	NumV is 1 + NumVR.

cuentavocales([X|Resto],NumV):-
	cuentavocales(Resto,NumV).


sustituye([],E1,E2,[]).
sustituye([X|Resto],E1,E2,ListaR):-
	X = E1,!,
	sustituye(Resto,E1,E2,LTmp),
	concatenar([E2],LTmp,ListaR).

sustituye([X|Resto],E1,E2,ListaR):-
	sustituye(Resto,E1,E2,LTmp),
	concatenar([X],LTmp,ListaR).

borraIesimo([],N,[]).
borraIesimo([X|Resto],N,LR):-
	N > 1,!,
	N1 is N-1,
	borraIesimo(Resto,N1,LRR),
	LR =[X|LRR].

borraIesimo([X|Resto],N,LR):-
	LR = Resto.

creaLista(X,0,[]).
creaLista(X,N,LC):-
	N > 1,!,
	N1 is N-1,
	creaLista(X,N1,LR),
	concatenar([X],LR,LC).

creaLista(X,N,LC):-
	concatenar([X],[],LC).


multiplicada([],N,[]).
multiplicada([X|Resto],N,LR):-
	creaLista(X,N,LC),
	multiplicada(Resto,N,LRR),
	concatenar(LC,LRR,LR).


ordenada([]).
ordenada([X]).
ordenada([X|[Y|Resto]]):-ordenada([Y|Resto]),X>=Y.

cuenta([],0,[]).
cuenta([X,Y|Resto],N,RF):-
	X = Y,!,
	N1 is N + 1,
	cuenta([Y|Resto],N1,RF).

cuenta([X,Y|Resto],N,RF):-
	RF = Resto.

creaSubL(X,N,SubL):-
	SubL = [N,X].



clasificaRep([],[]).
clasificaRep([X,Y|Resto],LR):-
	X = Y,!,
	cuenta([Y|Resto],N,RestoF),
	N1 is N+1,
	creaSubL(X,N1,SubL),
	clasificaRep(RestoF,LRR),
	concatenar([SubL],LRR,LR).

clasificaRep([X,Y|Resto],LR):-
	creaSubL(X,1,SubL),
	clasificaRep([Y|Resto],LRR),
	concatenar([SubL],LRR,LR).
