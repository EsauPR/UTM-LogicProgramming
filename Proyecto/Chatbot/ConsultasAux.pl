% Autor:
% Fecha: 21/01/2015


%concatenar(L1,[],L1).
%concatenar([],L2,L2).
%concatenar([X1|R1],[X2|R2],[X1|RR]):-concatenar(R1,[X2|R2],RR).

%CARGAR LBRERIAS Y ARCHIVO BASE DE DATOS RDF
:- use_module(library(semweb/rdf_db)),rdf_load('database_peliculas_V2.rdf').
%inicio:- use_module(library(semweb/rdf_db)),rdf_load('pruebabd.rdf'LISTA), getDirector( LISTA, 'http://www.peliculas/El_padrino',Dir), write(Dir).

% LISTA = [ C | R ]
% C = rdf( Pelicula, Atributo, literal(Valor) ).

.%getDirector( [], Pelicula, _Director ):-!.
%getDirector( [C|R], Pelicula, Director ):-
 %            C =rdf( Pelicula, 'director', literal(Director) ),!.
%getDirector( [C|R], Pelicula, Director ):- getDirector( R, Pelicula, Director ).


%getDirectores( [], [] ):-!.
%getDirectores( [C|R], ListaDirectores ):-
%              C = rdf( Pelicula, 'http://www.peliculas.org/director', literal(Director) ),
%               getDirectores( R, ListaTmp ),ListaDirectores = [ Director | ListaTmp ),!.
               
%getDirectores( [C|R], ListaDirectores ):-  getDirectores( R, ListaDirectores ).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%CO N S U L T A S %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%OBTENER EL NOMBRE DE TODAS LAS PELICULAS
getNombresPeliculas(Pelicula):-rdf(_X,'nombre',literal(Pelicula)),
                               write(Pelicula).

%OBTENER EL NOMBRE DEL DIRECTOR DE X PELICULA.
getDirectorPelicula(Pelicula):-rdf(_X,'director',literal(Director)),
                               rdf(_X,'nombre',literal(Pelicula)),
                               write('El Director de la pelicula '),write(Pelicula),write(' es '),write(Director).

%OBTENER EL NOMBRE DEL GUIONISTA DE X PELICULA.
getGuionistaPelicula(Pelicula):-rdf(_X,'guionista',literal(Guionista)),
                                rdf(_X,'nombre',literal(Pelicula)),
                                write('El Guionista de la pelicula '),write(Pelicula),write(' es '),write(Guionista).

%OBTENER EL NOMBRE DEL ACTOR PRINCIPAL DE X PELICULA.
getActorPelicula(Pelicula):-rdf(_X,'actor_principal',literal(Actor)),
                            rdf(_X,'nombre',literal(Pelicula)),
                            write('El Actor principal de la pelicula '),write(Pelicula),write(' es '),write(Actor).

%OBTENER EL REPARTO DE X PELICULA.
getRepartoPelicula(Pelicula):-rdf(_X,'actores_reparto',literal(Reparto)),
                              rdf(_X,'nombre',literal(Pelicula)),
                              write('Los actores de  reparto de la pelicula '),write(Pelicula),write(' son '),write(Reparto).

%OBTENER EL RANKING DE X PELICULA.
getRankingPelicula(Pelicula):-rdf(_X,'calificacion',literal(Ranking)),
                              rdf(_X,'nombre',literal(Pelicula)),
                              write('El ranking segun IMDb para la pelicula '),write(Pelicula),write(' es de '),write(Ranking),write(' en una escala de 10').

%OBTENER EL GENERO DE X PELICULA.
getGeneroPelicula(Pelicula):-rdf(_X,'genero',literal(Genero)),
                             rdf(_X,'nombre',literal(Pelicula)),
                             write('El genero de la pelicula '),write(Pelicula),write(' es '),write(Genero).

%OBTENER FECHA DE ESTRENO DE X PELICULA.
getEstrenoPelicula(Pelicula):-rdf(_X,'fecha_estreno',literal(Estreno)),
                              rdf(_X,'nombre',literal(Pelicula)),
                                                          write('La fecha de estreno de la pelicula '),write(Pelicula),write(' fue en '),write(Estreno).

%OBTENER EMPRESA PRODUCTORA DE X PELICULA.
getProductoraPelicula(Pelicula):-rdf(_X,'productora',literal(Productora)),
                                 rdf(_X,'nombre',literal(Pelicula)),
                                 write('La empresa productora de la pelicula '),write(Pelicula),write(' es '),write(Productora).

%OBTENER PAIS DE X PELICULA.
getPaisPelicula(Pelicula):-rdf(_X,'pais',literal(Pais)),
                           rdf(_X,'nombre',literal(Pelicula)),
                           write('La pelicula '),write(Pelicula),write(' fue filmada en '),write(Pais).

%OBTENER SINOPSIS DE X PELICULA.
getSinopsisPelicula(Pelicula):-rdf(_X,'sinopsis',literal(Sinopsis)),
                               rdf(_X,'nombre',literal(Pelicula)),
                               write('Sinopsis de la pelicula '),write(Pelicula),write(':'),nl,write(Sinopsis).

%OBTENER PREMIOS DE X PELICULA.
getPremiosPelicula(Pelicula):-rdf(_X,'premios',literal(Premios)),
                               rdf(_X,'nombre',literal(Pelicula)),
                               write('Los reconocimientos para pelicula '),write(Pelicula),write('son:'),nl,write(Premios).


%OBTENER TODA LA INFORMACION DE X PELICULA.
getInfoPelicula(Pelicula):-getDirectorPelicula(Pelicula),nl,
                           getGuionistaPelicula(Pelicula),nl,
                           getActorPelicula(Pelicula),nl,
                           getRepartoPelicula(Pelicula),nl,
                           getRankingPelicula(Pelicula),nl,
                           getGeneroPelicula(Pelicula),nl,
                           getEstrenoPelicula(Pelicula),nl,
                           getProductoraPelicula(Pelicula),nl,
                           getPaisPelicula(Pelicula),nl,
                           getSinopsisPelicula(Pelicula),nl,
                           getPremiosPelicula(Pelicula).
                           

