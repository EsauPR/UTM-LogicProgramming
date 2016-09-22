% Autor:
% Fecha: 02/12/2014

% Programa Escalar figuras

cuadrado(_Lado).
triangulo(_Lado1, _Lado2, _Lado3).
circulo(_Radio).

escala( cuadrado(Lado), FactorE, cuadrado(LadoN) ) :- LadoN is Lado * FactorE.
escala( triangulo(Lado1, Lado2, Lado3), FactorE, triangulo(Lado1N, Lado2N, Lado3N) ) :- Lado1N is Lado1 * FactorE, Lado2N is Lado2 * FactorE, Lado3N is Lado3 * FactorE.


% Utilizando el operador ..


multiplica([],FactorE,[]).
multiplica( [X|R], FactorE, ArgsN ) :-
       XN is X * FactorE ,
       ArgsN = [XN | ArgsN2],
       multiplica(R, FactorE, ArgsN2).

escalaf(Figura, FactorE, FigNueva):-
    Figura =.. [Tipo|Args],
    multiplica(Args, FactorE, ArgsN),
    FigNueva =.. [Tipo|ArgsN].
    
