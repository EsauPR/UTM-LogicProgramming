% Autor:
% Fecha: 19/01/2015

fraseRec --> sn(_Gen,Num),sv(Num).
sn(Gen,Num) --> det(Gen,Num),nom(Gen,Num).
sv(Num) --> vt(Num),sn(_Gen,_Num2).
sv(Num) --> vi(Num).
det(f,sg) --> [la];[una].
det(f,pl) --> [las];[unas].
det(m,sg) --> [el];[uno];[un].
det(m,pl) --> [los];[unos].
nom(m,sg) --> [perro].
nom(m,pl) --> [perros].
nom(f,sg) --> [perra].
nom(f,pl) --> [perras].
nom(m,sg) --> [hueso].
nom(m,pl) --> [huesos].
vt(sg) --> [muerde];[come].
vt(pl) --> [muerden];[comen].
vi(sg) --> [ladra].
vi(pl) --> [ladran].

valida(ListPal):- fraseRec(ListPal, []), write('OK!'),!.
valida(_ListPal):- write('Nop!!').

inicio :- write('Ingresa una frase:'), nl,
          read(Frase),
          atomic_list_concat(ListPal,' ', Frase),
          valida(ListPal).



