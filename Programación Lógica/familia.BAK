% Autor:Ogarrio Cano Veronica
% Fecha: 16/10/2014
%Hechos
progenitor(pam,bob).
progenitor(tom,bob).
progenitor(tom,liz).
progenitor(bob,ann).
progenitor(bob,pat).
progenitor(pat,jim).
mujer(ann).
mujer(liz).
mujer(pam).
hombre(bob).
hombre(tom).
hombre(pat).
hombre(jim).
%Reglas
descendiente(X,Y):-progenitor(Y,X).       %Caso Base!
descendiente(Z,X):-progenitor(X,Y),descendiente(Z,Y). %Paso recursivo...      (X,Z)

madre(X,Y):-progenitor(X,Y),mujer(X).

abuelo(X,Y):-progenitor(X,Z),progenitor(Z,Y),hombre(X). %Para todo X y Y , X es abuelo de Y si X es progenitor de Z y Z progenitor de Y y X es hombre
padre(X,Y):-protgenitor(X,Y),hombre(X).

abuela(X,Y):-progenitor(X,Z),progenitor(Z,Y),mujer(X).
hermana(X,Y):-progenitor(Z,X),progenitor(Z,Y),mujer(X).

%tia(X,Y):-progenitor(Z,Y),hermana(X,Z).
tia(X,Y):-progenitor(Z,Y),progenitor(W,X),progenitor(W,Z),mujer(X).

nieto(X,Y):-abuelo(Y,X),hombre(X).
nieto(X,Y):-abuela(Y,X),hombre(X).
nieto(X,Y):-progenitor(Y,Z),progenitor(Z,X),hombre(X).

pareja(X,Y):-hombre(X),mujer(Y).
pareja(par(X,Y)):-hombre(X),mujer(Y).
pareja([X,Y]):-hombre(X),mujer(Y).

feliz(X):-descendiente(_Y,X).
tiene2hijos(X):-descendiente(Y,X),hermana(_Z,Y).


ancestro(Z,X):-progenitor(Z,X). %Ancestro inmediato.    Caso base!
                                %ancestro(Z,X):-progenitor(Z,Y),progenitor(Y,X). %Ancestro indirecto  (Dependen de los niveles)
ancestro(Z,X):-progenitor(Z,Y),ancestro(Y,X). %Regla recursiva ancestro indirecto... Paso recursivo!!



