% Autor:
% Fecha: 07/01/2015

/*
  1.- Derivador de funciones
*/

% Derivada de una constante, X representa respecto a que se deriva
derivada(N,_X,0):- number(N),!.

% Derivada de X
derivada(X,X,1):-!.

% Derivada Suma
derivada(A+B, X,DA+DB):- derivada(A,X,DA), derivada(B,X,DB).

% Derivada de Resta
derivada(A-B, X,DA-DB):- derivada(A,X,DA), derivada(B,X,DB).

% Producto cte * función
derivada(N*A,X,N*DA):- number(N), derivada(A,X,DA), !.

% Producto función * función
derivada(A*B,X,A*DB+B*DA):- derivada(A,X,DA), derivada(B,X,DB).

% Cociente cte / función
derivada( N/A, X,(N*DA)/A^2 ):- number(N), derivada(A,X,DA), !.

% Cociente función / función
derivada( A/B, X,(A*DB-B*DA)/(B)^2 ):- derivada(A,X,DA), derivada(B,X,DB).

% Fuciones de la Forma A^N donde N es exponente.
derivada(A^N,X,N*DA*A^N1):- number(N), N1 is N-1, derivada(A,X,DA).

% Funciones trigonométricas
derivada(sin(A),X,DA*cos(A)):- derivada(A,X,DA).
derivada(cos(A),X,-DA*sin(A)):- derivada(A,X,DA).
derivada(-sin(A),X,-DA*cos(A)):- derivada(A,X,DA).
derivada(-cos(A),X,DA*sin(A)):- derivada(A,X,DA).
