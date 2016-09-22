/*Ejercicio 1*/
trasladar([0],[cero]):-!.
trasladar([1],[uno]):-!.
trasladar([2],[dos]):-!.
trasladar([3],[tres]):-!.
trasladar([4],[cuatro]):-!.
trasladar([5],[cinco]):-!.
trasladar([6],[seis]):-!.
trasladar([7],[siete]):-!.
trasladar([8],[ocho]):-!.
trasladar([9],[nueve]):-!.

trasladar([X|Resto],LR):-
	trasladar(Resto,LR1),
	trasladar([X],[LR2]),
	LR = [LR2|LR1].

/*Ejercicio 2*/
par(L):- 
	longitud(L,Long),
	L1 is Long mod 2,
	L1 =:= 0.

impar(L):- 
	longitud(L,Long),
	L1 is Long mod 2,
	L1 =:= 1.

/*Ejercicio 3*/


/*Ejercicio 4*/
eliminarRep([X],[X]).
eliminarRep([X|[X|Resto]],LR):-
	eliminarRep([X|Resto],LR),!.

eliminarRep([X|[Y|Resto]],LR):-
	eliminarRep([Y|Resto],LRR),
	LR = [X|LRR].

/*Ejercicio 5*/


/*Ejercicio 6*/
ordenada([]).
ordenada([X]).
ordenada([X|[Y|Resto]]):-
	ordenada([Y|Resto]),X>=Y.

/*Ejercicio 7*/
multiplicada([],N,[]).
multiplicada([X|Resto],N,LR):-
	creaLista(X,N,LC),
	multiplicada(Resto,N,LRR),
	concatenar(LC,LRR,LR).

creaLista(X,0,[]).
creaLista(X,N,LC):-
	N > 1,!,
	N1 is N-1,
	creaLista(X,N1,LR),
	concatenar([X],LR,LC).

creaLista(X,N,LC):-
	concatenar([X],[],LC).

concatenar([],L2,L2).
concatenar(L1,[],L1).
concatenar([X1|R1],[X2|R2],LR):-
	LR=[X1|RR],
	concatenar(R1,[X2|R2],RR).

/*Ejercicio 8*/
borraIesimo([],N,[]).
borraIesimo([X|Resto],N,LR):-
	N > 1 ,!,
	N1 is N-1,
	borraIesimo(Resto,N1,LRR),
	LR =[X|LRR].

borraIesimo([X|Resto],N,LR):-
	LR = Resto.

/*Ejercicio 9*/
sustituye([],E1,E2,[]).
sustituye([X|Resto],E1,E2,ListaR):-
	X = E1,!,
	sustituye(Resto,E1,E2,LTmp),
	concatenar([E2],LTmp,ListaR).

sustituye([X|Resto],E1,E2,ListaR):-
	sustituye(Resto,E1,E2,LTmp),
	concatenar([X],LTmp,ListaR).

/*Ejercicio 10*/
vocal(a).
vocal(e).
vocal(i).
vocal(o).
vocal(u).
cuentavocales([],0).
cuentavocales([X|Resto],NumV):-
	vocal(X),!,
	cuentavocales(Resto,NumVR),
	NumV is 1 + NumVR.

cuentavocales([X|Resto],NumV):-
	cuentavocales(Resto,NumV).

/*Ejercicio 11*/
factorial(0,1).
factorial(1,1).
factorial(N,NumF):-
	N1 is N-1, 
	factorial(N1,NumF1),
	NumF is N * NumF1.

/*Ejercicio 12*/
crecimiento([X],[X]).
crecimiento([X,Y|Resto],ListaR):-
	X < Y,!,
	crecimiento([Y|Resto],LTmp),
	concatenar([X,+],LTmp,ListaR).

crecimiento([X,Y|Resto],ListaR):-
	crecimiento([Y|Resto],LTmp),
	concatenar([X,-],LTmp,ListaR).

/*Ejercicio 13*/
sumadigitos(0,0).
sumadigitos(Num,Sum):-
	M is Num mod 10,
	NumN is Num // 10,
	sumadigitos(NumN,Sum1),
	Sum is M + Sum1.

/*Ejercicio 14*/
		/* adicionar al final de una lista */
add_end(X, [], [X]).
add_end(X, [C|R], [C|R1]):-
	add_end(X, R, R1).
		/* borrar el ultimo elemento de una lista */
eliminaU(L,L1):-
	add_end(_,L1,L). 

ultimo(X,Lista):-
	concatenar(Sublista,[X],Lista).

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

/*Ejercicio 15*/
decodificada([],[]).
decodificada([X-Y|Resto],L2):-
	creaLista(Y,X,LR),
	decodificada(Resto,L2R),
	concatenar(LR,L2R,L2).

decodificada([X|Resto],L2):-
	decodificada(Resto,L2R),
	concatenar([X],L2R,L2).

/*Ejercicio 16*/
cota_Superior([],N):-N>=0.
cota_Superior([X|Resto],N):-
	X=<N,
	cota_Superior(Resto,N).

longitud([],0).
longitud([X|Resto],Long):-
	longitud(Resto,LongR),
	Long is 1 + LongR.