% Autor:
% Fecha: 25/11/2014

% Cuenta números positivos y negativos
cuentaPosNeg( [X], NPos , NNeg ):- X >= 0, NPos is 1, NNeg is 0.
cuentaPosNeg( [X], NPos, NNeg ):- 0 >  X, NPos is 0, NNeg is 1.
cuentaPosNeg( [X|[Y|Resto]], NPos, NNeg ):- cuentaPosNeg([X], P1, N1), cuentaPosNeg( [Y|Resto], P2, N2 ), NPos is P1 + P2, NNeg is N1 + N2.