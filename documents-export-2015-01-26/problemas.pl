% Autor:
% Fecha: 20/01/2015

/*
  ==== Resolución de problemas con Programación Lógica ====
  
  Formulación del Problemas en I.A.
  
  a) Representación de los estados
  b) Definir las acciones.
  c) Definir el costo de las acciones.
  d) Estado inicial y estado objetivo.
  
  
  4) Problema del granjero
     - Granjero               ----->
     - Lobo                   ----->
     - Cabra                  ----->
     - Col                    ----->
     ______________                      ______________
     Lado A del rio                      Lado B del rio

     Restricciones
     * El granjero solo puede transportar un elemento a la vez.
     * El lobo no puede pasar con la cabra.
     * La cabra no puede pasar con la col.
     * Solo puede estar en un lado el lobo y la cabra y/o la cabra y la col si el granjero está presente.
*/

     /* Representación de los Estados */

%estado(Granjero,Lobo,Cabra,Col).

% Estado inicial
estado(la,la,la,la).
% Estado final
estado(lb,lb,lb,lb).

     /*  Aciones  */

cruza(la,lb).
cruza(lb,la).

a_salvo(estado(X,X,X,_Y)). % El granjero esté con el lobo y cabra
a_salvo(estado(X,_Y,X,X)). % El granjero esté con la cabra y la col
a_salvo(estado(X,Y,X,Y)). % El granjero esté solo con la cabra

% Cruza el rio, granjero con la cabra
mover( estado(X,Lobo,X,Col), estado(XN,Lobo,XN,Col) ):- cruza(X,XN), a_salvo(estado(XN,Lobo,XN,Col)).

% Cruza el rio, granjero con lobo
mover( estado(X,X,Cabra,Col), estado(XN,XN,Cabra,Col) ):- cruza(X,XN), a_salvo(estado(XN,XN,Cabra,Col)).

% Cruza el rio, granjero con col
mover( estado(X,Lobo,Cabra,X), estado(XN,Lobo,Cabra,XN) ):- cruza(X,XN), a_salvo(estado(XN,Lobo,Cabra,XN)).

% Cruza el rio, granjero solo
mover( estado(X,Lobo,Cabra,Col), estado(XN,Lobo,Cabra,Col) ):- cruza(X,XN), a_salvo(estado(XN,Lobo,Cabra,XN)).


resuelve(Problema,EdoN,_,[]):- estado_final(Problema,EdoN).

resuelve(Problema,Edo,Visitados,[Edo|Edos]):- mover(Problema,Edo,EdoN), no_esta(EdoN,Visitados), resuelve(Problema,EdoN,[EdoN,Visitados],Edos).

resuelveI(Problema,[EdoI|Otros]):- estado_inicial(Problema,EdoI),resuelve(Problema,EdoI,[EdoI],[EdoI|Otros]).



