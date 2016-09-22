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
         region(f,F,[C,D,E]),
         ].
  
  Solución:
  
  colorea_mapa(Mapa, Colores)
  
*/


colorea_mapa( Mapa, Colores ):-
