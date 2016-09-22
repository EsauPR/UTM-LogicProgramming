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
descendiente(X,Y):-progenitor(Y,X).
madre(X,Y):-progenitor(X,Y),mujer(X).
abuelo(X,Y):-progenitor(X,Z),progenitor(Z,Y),hombre(X). %Para todo X y Y , X es abuelo de Y si X es progenitor de Z y Z progenitor de Y y X es hombre
