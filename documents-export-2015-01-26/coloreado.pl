% Autor:
% Fecha: 12/01/2015

/*
  Colorear las regiones de un mapa de forma talq ue las dos regiones adyacentes
  no tengan el mismo color
  
  colores: azul, rojo, verde amarillo
  
  mapa=[ region(a,A,[B,C,D]),
         region(b,B,[A,C,E]),
         region(c,C,[A,B,D,E,F]),
         region(d,D,[A,C,F]),
         region(e,E,[B,C,F]),
         region(f,F,[C,D,E])
         ].
  
  Solución:
  
  colorea_mapa(Mapa, Colores)
  
  [ region(a,A,[B,C,D]), region(b,B,[A,C,E]), region(c,C,[A,B,D,E,F]), region(d,D,[A,C,F]), region(e,E,[B,C,F]), region(f,F,[C,D,E])], [azul,rojo,verde,amarillo,blanco]

  colorarMapa([region(a,A,[B]), region(b,B,[A])],[azul,rojo,verde]).
  
*/

selectColor([], _Color).
selectColor([Color|_R], Color).
selectColor([_Color|R], C):- selectColor(R,C).

pertenece( C1, [C1|_R] ):-!.
pertenece( C1, [_X|R] ):- pertenece(C1,R).

verifica([]).
verifica( [R1|Resto] ):- R1 = region(Reg,C1,Ady ), not(pertenece(C1,Ady)), verifica(Resto).

colorearMapa( [],_Colores).
colorearMapa( [Region|Resto], Colores ):- Region = region(_R1,C1,Ady), selectColor(Colores,C1), colorearMapa(Resto,Colores).

soluciona( Mapa, Colores ):- colorearMapa( Mapa, Colores ), verifica(Mapa),!.









