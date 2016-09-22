% Autor:
% Fecha: 12/11/2014

elimina(X,[X|Resto], Resto).
elimina(X,[Y|Resto],[Y|RR]):-elimina(X,Resto,RR).