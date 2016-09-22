/*
	Fuente: http://www.sc.ehu.es/jiwhehum2/prolog/Temario/Tema4.pdf
	Modificado, para adaptarse al proyecto de ChatBot
*/

/* 
	Lee y procesa la frase para convertir a minúsculas y sin acentos.
	La frase debe terminar con punto.
	Llamada principal leer(X).
*/

% Leer2, lee una frase.
% Modo de uso: leer2(out frase).
leer2([P|Ps]) :- get0(C), leepalabra(C,P,C1), restofrase(P,C1,Ps).
% RESTOFRASE, dada una palabra y el carácter que la sigue, devuelve el resto de la frase.
% Modo de uso: restofrase(in palabra, in caracter, out frase)
restofrase(P, _ , []) :- ultimapalabra(P), !.
restofrase(_P, C, [P1|Ps]) :- leepalabra(C,P1,C1), restofrase(P1,C1,Ps). 
% LEEPALABRA, dado un carácter inicial, devuelve una palabra y el carácter que viene detrás de la palabra.
% Modo de uso: leepalabra(in carácter, out palabra, out carácter).
leepalabra(C,P,C1) :- caracter_unico(C), !, name(P,[C]), get0(C1).
leepalabra(C,P,C2) :- en_palabra(C,NuevoC), !, get0(C1), restopalabra(C1,Cs,C2), name(P, [NuevoC | Cs]).
leepalabra(_C,P,C2) :- get0(C1), leepalabra(C1,P,C2).
% RESTOPALABRA, dado un carácter inicial, devuelve la lista de caracteres del resto de la palabra
% y el carácter que viene detrás de la palabra.
% Modo de uso: leepalabra(in carácter, out lista_de_caracteres, out caracter).
restopalabra(C, [NuevoC | Cs], C2) :- en_palabra(C,NuevoC), !, get0(C1), restopalabra(C1,Cs,C2).
restopalabra(C,[ ],C).
% CARACTER_UNICO, los siguientes caracteres forman palabra por si mismos.
% Modo de uso: caracter_unico(in código_caracter).
caracter_unico(44). % ,
caracter_unico(59). % ;
caracter_unico(58). % :
caracter_unico(63). % ?
caracter_unico(191). % ¿
caracter_unico(33). % !
caracter_unico(161). % ¡
caracter_unico(46). % . 
% ULTIMAPALABRA, las siguientes palabras terminan una frase.
% Modo de uso: ultimapalabra(in palabra).
%ultimapalabra(X):- name(X,[10]).
ultimapalabra('.').
% EN_PALABRA, trata los caracteres que pueden aparecer dentro de una palabra.
% La segunda cláusula convierte mayúsculas a minúsculas.
% Modo de uso: en_palabra(in caracter, out caracter).
en_palabra(C,C) :- C>96, C<123. % a b ... z
en_palabra(C,L) :- C>64, C<91, L is C+32. % A B ... Z
en_palabra(C,C) :- C>47, C<58. % 0 1 2 ... 9
en_palabra(39,39). % '
en_palabra(45,45). % - 
en_palabra(225,97).  % á
en_palabra(233,101). % é
en_palabra(237,105). % í
en_palabra(243,111). % ó
en_palabra(250,117). % ú
en_palabra(193,97).  % Á
en_palabra(201,101). % É
en_palabra(205,105). % Í
en_palabra(211,111). % Ó
en_palabra(218,117). % Ú

removeLast([X|_R], []):- X = '.', !.
removeLast([X|R], L):- L = [X|RR], removeLast(R,RR).

leer(X):- leer2(Lista), removeLast(Lista,X).

/* Solo para verificar el ascci de los caracteres */

ultimo(10).
lee(X,[]):- ultimo(X), !.
lee(_X,[X1|R]):- get0(X1), lee(X1,R).
ini([X|R]):- get0(X), lee(X,R).