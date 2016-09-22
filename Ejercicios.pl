
/*
	Definición de que concatena dos listas.
*/

	concatena( X, [], X ).
	concatena( [], X, X ).
	concatena( [X1|R1], L2, [X1|R3] ) :- concatena( R1, L2, R3 ).


/*
	
	1.- Definir la relación trasladar(L1,L2) que permita trasladar una lista de números
	L1 a una lista de sus correspondientes nombres L2.
	?- trasladar([1,2,3,7],[uno,dos,tres,siete]).
	True

*/

	trasladar(1, uno):-!.
	trasladar(2, dos):-!.
	trasladar(3, tres):-!.
	trasladar(4, cuatro):-!.
	trasladar(5, cinco):-!.
	trasladar(6, seis):-!.
	trasladar(7, siete):-!.
	trasladar(8, ocho):-!.
	trasladar(9, nueve):-!.
	
	trasladar([],[]).
	trasladar( [X|R], Lista ) :- trasladar(X,R1), trasladar(R,R2), Lista = [R1|R2].
	
/*
	2.- Definir dos predicados: par(Lista), impar(Lista) que serán verdaderos si
	Lista tiene un número par e impar de elementos, respectivamente.
	?- par([1,2,3,7]).
	True
*/
	num_elements( [], 0):-!.
	num_elements( [_X|R], Num) :-  num_elements(R,R2), Num is 1 + R2.
	
	par(Lista) :- num_elements(Lista,R), R1 is R mod 2, R1 is 0.
	impar(Lista) :- num_elements(Lista,R), R1 is R mod 2, R1 is 1.
	
/*
	3.- Definir la relación aplanar(L, Lplana) en donde L, que puede ser una lista de
	listas, pase a ser el conjunto de todos los elementos de L pero en una lista plana en Lplana.
	?- aplanar([a,b,[c,d],[],[[[e]]],f],L).
	L=[a,b,c,d,e,f]
*/
	
	aplanar( [],[] ) :- !.
	aplanar( [X1|R1], LR ) :- aplanar( X1, LR2 ), aplanar( R1, LR3 ), concatena( LR2, LR3, LR ).
	aplanar( X1 , [X1]).
	

/*
	4.- Defina la relación eliminaRep(Lista, ListaR) que elimine los elementos
	repetidos consecutivos de Lista.
	?- eliminaRep([a,a,a,a,b,c,c,a,a,d,e,e,e,e] , LR).
	LR= [a,b,c,a,d,e]
*/

	
	eliminaRep( [X], [X] ) :- !.
	eliminaRep( [X,X|R], LR ) :- eliminaRep( [X|R], LR ), !.
	eliminaRep( [X,Y|R], LR ) :- eliminaRep( [Y|R], RR ), LR = [X|RR].
	
	
/*
	5.- Defina una relación que clasifique los elementos duplicados consecutivos de una lista, en
	una lista de duplas [Cantidad,Elem].
	?- clasificaRep([a,a,a,a,b,c,c,a,a,d,e,e,e,e],LR).
	LR= [[4,a],[1,b],[2,c],[2,a],[1,d],[4,e]]
*/
	
	clasificaRep( [], [] ).
	clasificaRep( [X], [[1,X]] ).
	clasificaRep( [X,Y|R], LR ) :- X \= Y, clasificaRep( [Y|R], LR1 ), concatena( [[1,X]], LR1, LR ), !.
	clasificaRep( [X,X|R], LR ) :- clasificaRep( [X|R], [[N,_Y]|R2] ), M is N + 1, concatena([[M,X]], R2, LR).

/*
	6.- Definir el predicado ordenada(L) que se verifique si la lista de números L está
	ordenada de manera decreciente.
*/

	ordenada([_X]) :- !.
	ordenada( [X,Y|R] ) :- X >= Y, ordenada( [Y|R] ).
	
	
/*
	7.- Definir la relación multiplicada(L,N,LR) que se verifica si LR es la lista obtenida
	al repetir N veces los elementos de la lista L.
	?- multiplicada([a,b,c],3,LR).
	LR= [a,a,a,b,b,b,c,c,c]
*/	

	repetir( _X, 0, [] ) :- !.
	repetir( X, N, LR ) :- N1 is N - 1, LR = [X|RR], repetir( X, N1 , RR ).
	
	multiplicada( [], _N, [] ).
	multiplicada( [X|R], N, LR ) :- repetir( X, N, LR1 ), multiplicada( R, N, LR2 ), concatena( LR1, LR2, LR ).
	
/*
	8.- Defina una relación que borre todos los i-esimos elementos de una lista.
	?- borraiesimo([a,b,c,d,e,f,g,h,i,k],3,LR).
	LR = [a,b,d,e,g,h,k]
*/

	borra( [], _N, _Nactual, [] ).
	borra( [_X|R], N, Nactual , LR ) :- Nactual >= N, Band is Nactual mod N, Band = 0, N1 is Nactual + 1, borra( R, N, N1, LR ), !.
	borra( [X|R], N, Nactual , LR ) :- N1 is Nactual + 1,  borra( R, N, N1, LRR ), LR = [X|LRR].
	
	borraiesimo( Lista, N, LR ) :- borra( Lista, N, 1, LR ).
	
	
/*
	9.- Defina la relación sustituye(L1,E1,E2,LR) que sustituya todas las ocurrencias
	de E1 en L1, por elemento E2.?- sustituye([a,b,c,a,e,a,g,a,i],a,f,LR).
	LR = [f,b,c,f,e,f,g,f,i]
*/

	cambia(E1,E1,E2,E2) :- !.
	cambia(X,_E1,_E2,X) :- !.
	
	sustituye( [], _E1, _E2, [] ).
	sustituye( [X|R], E1, E2, LR ) :- cambia( X, E1, E2, XR), sustituye( R, E1, E2, LRR ), LR = [XR|LRR].
	
	
/*
	10.- Defina la relación cuentavocales(L1,NumV) que cuenta el número de vocales
	que existen en L1.
	?-cuentavocales([a,b,c,a,e,a,g,a,i],N).
	N = 6
*/

	vocal( a, 1 ).
	vocal( e, 1 ).
	vocal( i, 1 ).
	vocal( o, 1 ).
	vocal( u, 1 ).
	vocal( _X, 0 ).
	
	cuentavocales( [], 0 ).
	cuentavocales( [X|R], NumV ) :- vocal( X, N1 ), cuentavocales( R, N2 ), NumV is N1 + N2.
	
/*
	11.- Defina la relación factorial(N,NumF) que genere el factorial del número N.
	?-factorial(3,N).
	N = 6
*/
	
	factorial(0,1).
	factorial(N, NumF) :- N1 is N - 1, factorial( N1, R ), NumF is N * R.
	
/*
	12.- Defina la relación crecimiento(L1,L2) que verifique si L2 es la lista
	correspondiente a los crecimientos de la lista L1. Es decir, entre cada par de elementos
	consecutivos X e Y de L1, la relación colocará el signo +, si X<Y, y signo -, en caso contrario.
	?-crecimiento([1,3,2,2,5,3],L2).
	L2 =[1,+,3,-,2,-,2,+,5,-,3]
*/
	
	crecimiento( [X,Y], [X,+,Y] ) :- X < Y, !.
	crecimiento( [X,Y], [X,-,Y] ) :- !.
	crecimiento( [X,Y|R], LR ) :- X < Y, LR = [X,+|RR], crecimiento( [Y|R], RR ), !.
	crecimiento( [X,Y|R], LR ) :- LR = [X,-|RR], crecimiento( [Y|R], RR ).
	
/*
	13.- Defina la relación sumadigitos(Num,Sum) que sume los dígitos del número Num.
	?-sumadigitos(237,Sum).
	Sum =12
*/	

	sumadigitos( N, N ) :- N < 10, !.
	sumadigitos( N, Sum ) :- SR1 is N mod 10, NR is N div 10, sumadigitos( NR, SR2 ), Sum is SR1 + SR2.
	
	
/*
	14.- Defina la relación suma_posiciones(Lista,N,Suma) que verifique si
	Suma es la suma de los elementos de Lista que ocupan las posiciones que son múltiplos de N.
	?-suma_posiciones([3,5,7,9,1,2],2,Suma).
	Suma =16
*/	
	suma_pos( [], _Pos, _PosAc, 0 ).
	suma_pos( [X|R], Pos, PosAc, Sum ) :- Npos is PosAc + 1, PosAc >= Pos, Mod is PosAc mod Pos, Mod = 0, suma_pos(R, Pos, Npos, SumR), Sum is X + SumR, !.
	suma_pos( [_X|R], Pos, PosAc, Sum ) :- Npos is PosAc + 1, suma_pos(R, Pos, Npos, Sum).
	
	suma_posiciones( Lista, N, Sum ) :- suma_pos( Lista, N, 1, Sum ).
	
/*
	15.- Defina la relación decodificada(L1,L2) que encuentre una lista L2 cuya
	codificación reducida por longitud es L1.
	?-decodificada([a,2-b,3-a,c,3-b],L2).
	L2 =[a,b,b,a,a,a,c,b,b,b]
*/	

	expande( 0, _X, [] ) :- !.
	expande( N, X, LR ) :- N1 is N - 1, expande( N1, X, LR1 ), LR = [X|LR1].
	
	decodificada( [], [] ).
	decodificada( [N-X|R], LR ) :- expande( N, X, R1 ), decodificada( R, R2 ), concatena( R1, R2, LR ), !.
	decodificada( [X|R], LR ) :- decodificada( R, R2 ), concatena( [X], R2, LR ).
	
/*
	16.- Defina la relación cota_superior(L,N) que verifique si N es una cota
	superior para L (es decir, todos los elementos en L son menores o iguales que N).
	?-cota_superior([1,5,3],7).
	True
*/

	
	cota_superior([],_N).
	cota_superior( [X|R], N ) :- X =< N, cota_superior(R,N).
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
