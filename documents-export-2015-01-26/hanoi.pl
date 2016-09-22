% Autor:
% Fecha: 08/01/2015

/*
  Problema 2)
  
  hanoi(N,Tf,Td,Ta,Movs). Donde N = número de discos, Tf = Torre fuente, Td = Torre destino, Ta = Torre auxiliar, Movs = Movimientos

*/

make_tower(N,[1]):- N = 1, !.
make_tower(N,R):- N1 is N - 1, make_tower(N1, RR), R = [N|RR].

hanoi(N,Tf,Td,Ta,Movs):- make_tower(N,NR), solve(NR,Tf,Td,Ta,Movs).

solve([N|Resto],Tf,Td,Ta,Movs):-