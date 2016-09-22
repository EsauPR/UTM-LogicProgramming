% Autor:
% Fecha: 05/01/2015

/*
Escribir un programa que muestre las capitales de los estados de la Rep Mexicana.

 La base de conocimientos será un archivo "capitales.pl" solo conteniendo las capitales

 :- dynamic capital_de/2

capital_de(oaxaca, oaxaca).
capital_de(veracruz, xalapa).

 Programa aprende.pl, con write y read, para imprimir la capital si existe , si no con read leer la capital e insertar el hecho.
 
 inicio:- consult('capitales.pl'), nl,
          write('Escribe los nombres en minusculas seguidos de un punto'), nl, procesa_consulta.

 procesa_consulta:- write('Estado: '), read(Estado), respuesta(Estado).

*/


:- dynamic capital_de/2.

capital_de(oaxaca, oaxaca).
capital_de(veracruz, xalapa).
