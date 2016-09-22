% Autor:
% Fecha: 20/01/2015

%Formulacion de problemas en prolog

%a) Representacion de los estados
%b) Definir las acciones
%c) Definir el costo de las acciones
%d) Estado final y estado objetivo






estado_inicial(glcc,estado(la,la,la,la)).
estado_final(glcc,estado(lb,lb,lb,lb)).

%Acciones

cruza(la,lb).
cruza(lb,la).

%a_salvo(estado(Granjero,Lobo,Cabra,Col)).

a_salvo(estado(X,_Lobo,X,X)).
a_salvo(estado(X,X,X,_Col)).
a_salvo(estado(_Granjero,X,_Cabra,X)).


%Cruzar el Rio: Granjero con la cabra
mover(glcc,estado(X,Y,X,Z),estado(XN,Y,XN,Z)):- cruza(X,XN),
                                           a_salvo(estado(XN,Y,XN,Z)).
%Cruzar el Rio: Granjero con el lobo
mover(glcc,estado(X,X,C,Col),estado(XN,XN,C,Col)):- cruza(X,XN),
                                               a_salvo(estado(XN,XN,C,Col)).
                                               
%Cruzar el Rio: Granjero con la col
mover(glcc,estado(X,L,C,X),estado(XN,L,C,XN)):- cruza(X,XN),
                                           a_salvo(estado(XN,L,C,XN)).
                                               
%Cruzar el Rio: Granjero solo
mover(glcc,estado(X,L,C,Col),estado(XN,L,C,Col)):- cruza(X,XN),
                                              a_salvo(estado(XN,L,C,Col)).
                                              
                                              
resuelve(Problema,Edo,Visitados,[Edo|Edos]):- mover(Problema,Edo,EdoN),
                                              no_esta(EdoN,Visitados),
                                              resuelve(Problema,EdoN,[EdoN|Visitados],Edos).

resuelve(Problema,EdoN,_,[EdoN]):- estado_final(Problema,EdoN).
                                              
resuelveI(Problema,[EdoI|Otros]):- estado_inicial(Problema,EdoI),
                                   resuelve(Problema,EdoI,[EdoI],[EdoI|Otros]).


no_esta(_X,[]).
no_esta(X,[Y|Resto]):- X \= Y,
                       no_esta(X,Resto).
