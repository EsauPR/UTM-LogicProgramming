/*
	Problema 1. Definir la relación todos iguales
*/

	todosIguales( [_X] ) :- !.
	todosIguales( [X,Y|R] ) :- X = Y, todosIguales( [Y|R] ).

/*
	Problema 2. Definir la relación ordenada
*/

	ordenada([_X]) :- !.
	ordenada( [X,Y|R] ) :- X =< Y, ordenada( [Y|R] ).
	
/*
	Problema 3. Definir la relación unión de dos conjuntos.
*/
	pertenece( X, [X|_R] ) :- !.
	pertenece( X, [_Y|R] ) :- pertenece( X, R ).
	
	union( [], L2, L2 ) .
	union( [X1|R1], L2, SetR ) :- pertenece( X1, L2 ), union( R1, L2, SetR ), !.
	union( [X1|R1], L2, SetR ) :- SetR = [X1|RR], union( R1, L2, RR ).
	
/*
	Problema 4. Definir la relación intersección de dos conjuntos.
*/

	interseccion( [], _L2, [] ).
	interseccion( [X1|R1], L2, SetR ) :- pertenece( X1, L2 ), interseccion( R1, L2, RR ), SetR = [X1|RR] , !.
	interseccion( [_X1|R1], L2, SetR ) :- interseccion( R1, L2, SetR ).
	
/*
	Problema 5. Definir la relación diferencia de dos conjuntos, L1 - L2.
*/

	diferencia( [], _L2, [] ).
	diferencia( [X1|R1], L2, SetR ) :- not( pertenece( X1, L2 ) ), diferencia( R1, L2, RR ), SetR = [X1|RR], !.
	diferencia( [_X1|R1], L2, SetR ) :- diferencia( R1, L2, SetR ).
	
/*
	Problema 6. Defina la relación eliminaRep(Lista, ListaR) que elimine los elementos
	repetidos consecutivos de Lista.
	?- eliminaRep([a,a,a,a,b,c,c,a,a,d,e,e,e,e] , LR).
	LR= [a,b,c,a,d,e]
*/

	eliminaRep( [X], [X] ) :- !.
	eliminaRep( [X,X|R], LR ) :- eliminaRep( [X|R], LR ), !.
	eliminaRep( [X,Y|R], LR ) :- eliminaRep( [Y|R], RR ), LR = [X|RR].
	

	
