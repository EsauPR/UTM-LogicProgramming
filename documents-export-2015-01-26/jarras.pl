% Autor:
% Fecha: 22/01/2015

/*
  Problema de las jarras de agua
  
  Representación
  estado(Jarra$,Jarra3).
            |       |
            V       V
     Contenido   Contenido
        0-4         0-3
        
  * Estado inicial
  estado_inicial(jarras,estado(0,0)).
  
  * Estado Final
  estado_final(jarras,estado(2,X)).
  
  * Acciones
  Llenar la jarra X
  Vaciar la jarra Y
  Pasar el contenido de la jarra X  a la jarra Y
  
*/

  % Estado inicial
  estado_inicial(jarras,estado(0,0)).

  % Estado Final
  estado_final(jarras,estado(2,_X)).

  llenarX(X,4).
  llenarY(Y,3).
  vaciar(Z,0):- Z > 0.
  /* Pasar X a Y si todo X cabe en Y */
  pasarXY(X,Y,XN,YN):- X > 0, Y1 is 3 - Y, X =< Y1, YN is Y + X.
  /* Pasar X a Y si todo X no cabe en Y */
  pasarXY(X,Y,XN,YN):- X > 0, Y1 is 3 - Y, X > Y1, YN = 3, XN is X - Y1.
  /* Pasar Y a X si todo Y cabe en X */
  pasarYX(X,Y,XN,YN):- Y > 0, X1 is 4 - X, Y =< X, XN is Y + X.
  /* Pasar Y a X si todo Y no cabe en X */
  pasarYX(X,Y,XN,YN):- Y > 0, X1 is 4 - X, Y > X1, XN = 4, YN is Y - X1.

  
  % Llena la jarra X
  accion( edo(jarras,estado(X,Y)), edo(jarras,estado(X1,Y1))):- llenarX(X,X1).
  
  % Llena la jarra Y
  accion( edo(jarras,estado(X,Y)), edo(jarras,estado(X1,Y1))):- llenarY(Y,Y1).
  
  % Pasar de X a Y
  accion( edo(jarras,estado(X,Y)), edo(jarras,estado(X1,Y1))):- pasarXY(X,Y,XN,YN).
  
  % Pasar de Y a X
  accion( edo(jarras,estado(X,Y)), edo(jarras,estado(X1,Y1))):- pasarYX(X,Y,XN,YN).
  
  % Vaciar jarra X
  accion( edo(jarras,estado(X,Y)), edo(jarras,estado(X1,Y1))):- vaciar(X,X1).
  
  % Vaciar jarra Y
  accion( edo(jarras,estado(X,Y)), edo(jarras,estado(X1,Y1))):- vaciar(Y,Y1).

  