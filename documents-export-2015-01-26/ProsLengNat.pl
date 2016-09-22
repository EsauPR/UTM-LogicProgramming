% Autor:
% Fecha: 15/01/2015

fraseRec --> sn,sv.
sn --> det,nom.
sv --> vt,sn.
sv --> vi.
det --> [el].
det --> [un].
det --> [una].
nom --> [perro].
nom --> [hueso].
vt --> [muerde].
vi --> [ladra].

valida(ListPal):- fraseRec(ListPal, []), write('OK!'),!.
valida(_ListPal):- write('Escribe Bien!!! ... Baboso!!!').

inicio :- write('Ingresa una frase:'), nl,
          read(Frase),
          atomic_list_concat(ListPal,' ', Frase),
          valida(ListPal).
