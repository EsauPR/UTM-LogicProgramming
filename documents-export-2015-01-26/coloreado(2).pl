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
  
*/

:-dynamic color/1

addColor([]):-!.
addColor([C|R]):- assert(color(C)), addColor(R).

rmColor([]):-!.
rmColor([C|R]):- retract(color(C)), rmColor(R).

colorea_mapa( Mapa, Colores ):- addColor(Colores), solve(Mapa, Colores), rmColor(Colores).

solve( [C1|R], Colores ):- C1 =.. [Tipo|[Reg,Color,Adya]], color(Color), write(Reg), write(Color).





