% Autor: Daniel Alejandro Hernandez Gomez
% Fecha: 22/01/2015

%ambas jarras estan vacias
estado_inicial(jarras,estado(0,0)).
%la jarra de 4 Litros se queda con 2 Litros
estado_final(jarras,estado(2,0)).


%ACCIONES

% Rellenar completamente la jarra pequeña si no está llena
rellena(jarras,estado(G,P),estado(G,3)).

% Rellenar completamente la jarra grande si no está llena
rellena(jarras,estado(G,P),estado(4,P)).

% Vaciar completamente la jarra pequeña si no está vacía.
rellena(jarras,estado(G,P),estado(G,0)).

% Vaciar completamente la jarra grande si no está vacía.
rellena(jarras,estado(G,P), estado(0,P)).

%Vaciar la Grande en la pequena y que la pequena se desborde
rellena(jarras,estado(G,P),estado(NG,NP)):- Aux is G+P, Aux >=3, NP=3, NG is Aux-3.

%Vaciar la Grande en la pequena sin que se desborde
rellena(jarras,estado(G,P),estado(0,NP)):- Aux is G+P, Aux =<3,NP is G + P.

%Vaciar la pequena en la grande y que la grande se desborde
rellena(jarras,estado(G,P),estado(NG,NP)):- Aux is G+P, Aux >=4, NG=4, NP is Aux-4.

%Vaciar la pequena en la grande sin que se desborde
rellena(jarras,estado(G,P),estado(NG,0)):- Aux is G + P, Aux =<4, NG is G + P.

resuelve(Problema,Edo,Visitados,[Edo|Edos]):- rellena(Problema,Edo,EdoN),
                                              no_esta(EdoN,Visitados),
                                              resuelve(Problema,EdoN,[EdoN|Visitados],Edos).

resuelve(Problema,EdoN,_,[EdoN]):- estado_final(Problema,EdoN).

resuelveI(Problema,[EdoI|Otros]):- estado_inicial(Problema,EdoI),
                                   resuelve(Problema,EdoI,[EdoI],[EdoI|Otros]).



no_esta(_X,[]).
no_esta(X,[Y|Resto]):- X \= Y,
                       no_esta(X,Resto).
                                      
                                      
                                      
                                      