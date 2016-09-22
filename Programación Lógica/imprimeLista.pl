% Autor:
% Fecha: 29/10/2014

imprimir( [] ).
imprimir([C|Resto]):-write(C),nl,imprimir([Resto]).