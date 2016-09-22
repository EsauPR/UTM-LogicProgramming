% Autor:
% Fecha: 03/12/2014

% simplifica(X+1+2+Y+1, E ).
% ?- E = X + Y + 4.

concatenar([],L2,L2).
concatenar(L1,[],L1).
concatenar([X1|R1],[X2|R2],LR):-LR=[X1|RR],concatenar(R1,[X2|R2],RR).

simplifica( X + Y, E ):- number(X), number(Y), E is X + Y.
simplifica( X - Y, E ):- number(X), number(Y), E is X - Y.
simplifica( X + Y, E ):- atom(X), number(Y), E = X + Y.
simplifica( X - Y, E ):- atom(X), number(Y), E = X - Y.
simplifica( X + Y, E ):- atom(Y), number(X), E = X + Y.
simplifica( X - Y, E ):- atom(Y), number(X), E = X - Y.

convierte( Exp, [Exp] ):- number(Exp),!.
convierte( Exp, [Exp] ):- atom(Exp),!.
convierte( Exp, Lista ):-
      Exp =.. [ X | RR],
      [X1,R1] = RR,
      convierte( X1, Args2 ),
      concatenar( Args2, [X,R1], Lista ).
      
