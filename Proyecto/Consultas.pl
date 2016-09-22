% Autor:
% Fecha: 21/01/2015


concatenar(L1,[],L1).
concatenar([],L2,L2).
concatenar([X1|R1],[X2|R2],[X1|RR]):-concatenar(R1,[X2|R2],RR).

%CARGAR LBRERIAS Y BASE DE DATOS RDF
inicio:- use_module(library(semweb/rdf_db)),rdf_load('database_peliculas_V3.rdf').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%CO N S U L T A S %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%CONSULTAR EL NOMBRE DE TODAS LAS PELICULAS
getNombresPeliculas(Pelicula):-rdf(_X,'http://www.peliculas.org/nombre',literal(Pelicula)),
                               write(Pelicula).

%CONSULTAR EL NOMBRE DEL DIRECTOR DE X PELICULA.
getDirectorPelicula(Pelicula):-rdf(X,'http://www.peliculas.com/director',literal(Director)),
                               rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                               write('El Director de la pelicula '),write(Pelicula),write(' es '),write(Director).

%CONSULTAR EL NOMBRE DEL GUIONISTA DE X PELICULA.
getGuionistaPelicula(Pelicula):-rdf(X,'http://www.peliculas.com/guionista',literal(Guionista)),
                                rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                                write('El Guionista de la pelicula '),write(Pelicula),write(' es '),write(Guionista).

%CONSULTAR EL NOMBRE DEL ACTOR PRINCIPAL DE X PELICULA.
getActorPelicula(Pelicula):-rdf(X,'http://www.peliculas.com/actor_principal',literal(Actor)),
                            rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                            write('El Actor principal de la pelicula '),write(Pelicula),write(' es '),write(Actor).

%CONSULTAR EL REPARTO DE X PELICULA.
getRepartoPelicula(Pelicula):-rdf(X,'http://www.peliculas.com/actores_reparto',literal(Reparto)),
                              rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                              write('Los actores de  reparto de la pelicula '),write(Pelicula),write(' son '),write(Reparto).

%CONSULTAR EL RANKING DE X PELICULA.
getRankingPelicula(Pelicula):-rdf(X,'http://www.peliculas.com/calificacion',literal(Ranking)),
                              rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                              write('El ranking segun IMDb para la pelicula '),write(Pelicula),write(' es de '),write(Ranking),write(' en una escala de 10').

%CONSULTAR EL GENERO DE X PELICULA.
getGeneroPelicula(Pelicula):-rdf(X,'http://www.peliculas.com/genero',literal(Genero)),
                             rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                             write('El genero de la pelicula '),write(Pelicula),write(' es '),write(Genero).

%CONSULTAR FECHA/AÑO DE ESTRENO DE X PELICULA.
getEstrenoPelicula(Pelicula):-rdf(X,'http://www.peliculas.com/fecha_estreno',literal(Estreno)),
                              rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                                                          write('La fecha de estreno de la pelicula '),write(Pelicula),write(' fue en '),write(Estreno).

%CONSULTAR EMPRESA PRODUCTORA DE X PELICULA.
getProductoraPelicula(Pelicula):-rdf(X,'http://www.peliculas.com/productora',literal(Productora)),
                                 rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                                 write('La empresa productora de la pelicula '),write(Pelicula),write(' es '),write(Productora).

%CONSULTAR PAIS DE X PELICULA.
getPaisPelicula(Pelicula):-rdf(X,'http://www.peliculas.com/pais',literal(Pais)),
                           rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                           write('La pelicula '),write(Pelicula),write(' fue filmada en '),write(Pais).

%CONSULTAR SINOPSIS DE X PELICULA.
getSinopsisPelicula(Pelicula):-rdf(X,'http://www.peliculas.com/sinopsis',literal(Sinopsis)),
                               rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                               write('Sinopsis de la pelicula '),write(Pelicula),write(':'),nl,write(Sinopsis).

%CONSULTAR PREMIOS DE X PELICULA.
getPremiosPelicula(Pelicula):-rdf(X,'http://www.peliculas.com/premios',literal(Premios)),
                               rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                               write('Los reconocimientos para pelicula '),write(Pelicula),write('son:'),nl,write(Premios).


%CONSULTAR TODA LA INFORMACION DE X PELICULA.
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
                           


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%IMPRIMIR CONTENIDO DE UNA LISTA%%%%%%%%%%
printLista([]).
printLista([X|R]):- write(X), nl, printLista(R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CLAUSULAS BASICAS PARA OBTENER LISTA(OJO 0.0) DE X OPCION:DIRECTOR,GENERO,GUIONISTA..ETC
getPelisDirector(Director,Pelicula):-rdf(X,'http://www.peliculas.com/director',literal(Director)),rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)).
getPelisGenero(Genero,Pelicula):-rdf(X,'http://www.peliculas.com/genero',literal(Genero)),rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)).
getPelisActorPrincipal(Actor,Pelicula):-rdf(X,'http://www.peliculas.com/actor_principal',literal(Actor)),rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)).
getPelisGuionista(Guionista,Pelicula):-rdf(X,'http://www.peliculas.com/guionista',literal(Guionista)),rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)).
getPeli(Pelicula):-rdf(_X,'http://www.peliculas.com/nombre',literal(Pelicula)).
getGenero(Genero):-rdf(_X,'http://www.peliculas.com/genero',literal(Genero)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LISTA DE PELICULAS DEL DIRECTOR X.
listaMoviesDirector(Director,ListaPeliculas):-findall( PeliculaNew, getPelisDirector(Director,PeliculaNew), ListaPeliculas).

%LISTA DE PELICULAS DEL GENERO X
listaMoviesGenero(Genero,ListaPeliculas):-findall( PeliculaNew, getPelisGenero(Genero,PeliculaNew), ListaPeliculas).

%LISTA DE PELICULAS DEL ACTOR X
listaMoviesActor(Actor,ListaPeliculas):-findall( PeliculaNew, getPelisActorPrincipal(Actor,PeliculaNew),ListaPeliculas).

%LISTA DE PELICULAS DEL GUIONISTA X
listaMoviesGuionista(Guionista,ListaPeliculas):-findall( PeliculaNew, getPelisGuionista(Guionista,PeliculaNew),ListaPeliculas).

%LISTA DE TODAS LAS PELICULAS EN UNA LISTA
allMovies(ListaMovies):- findall( PeliculaNew, getPelisGenero(PeliculaNew), ListaMovies).




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CONSULTAR TODAS LAS PELICULAS DEL DIRECTOR X
allMoviesDirector(Director):- listaMoviesDirector(Director,ListaPeliculas),write('Las peliculas dirigidas por '), write(Director) , write(' son:'), nl,printLista(ListaPeliculas).

%CONSULTAR TODAS LAS PELICULAS DEL GENERO X.
allMoviesGenero(Genero):- listaMoviesGenero(Genero,ListaPeliculas),write('Las peliculas de '), write(Genero) , write(' son:'), nl,printLista(ListaPeliculas).

%CONSULTAR TODAS LAS PELICULAS DEL ACTOR X.
allMoviesActorPrincipal(Actor):- listaMoviesActor(Actor,ListaPeliculas), write('Las peliculas actuadas por '), write(Actor) , write(' son:'), nl ,printLista(ListaPeliculas).

%CONSULTAR TODAS LAS PELICULAS DEL GUIONISTA X.
allMoviesGuionista(Guionista):-listaMoviesGuionista(Guionista,ListaPeliculas), write('Las peliculas escritas por '), write(Guionista) , write(' son:'), nl ,printLista(ListaPeliculas).

%OBTENER TODOS LOS GENEROS EN UNA LISTA
allGeneros(ListaGeneros):- findall( PeliculaNew, getGenero(PeliculaNew), ListaGeneros).

%OBTENER UNA PELICULA RANDOM
peliRandom(X):-allMovies(ListaMovies), random_member(X,ListaMovies).

%OBTENER UN GENERO RANDOM  / RECOMENDAR GENERO
generoRandom(X):-allGeneros(ListaGeneros), random_member(X,ListaGeneros).

%ROCOMENDAR UNA PELICULA
recomendarPelicula:-peliRandom(Recomendacion),write('Hoy te recomiendo la pelicula "'),write(Recomendacion), write('" Esta muy buena! ').

%UlTIMA PELICULA VISTA
ultimaMovieVista:-peliRandom(LasView),write('La ultima pelicula que vi fue '),write(LasView).

%ROCOMENDAR UNA PELICULA DE X GENERO
recomendarPeliculaGenero(Genero):- listaMoviesGenero(Genero,ListaPeliculas),random_member(Recomendacion,ListaPeliculas),write('Te recomiendo la pelicula "'),write(Recomendacion),write('" Pelicula de '),write(Genero).

%ROCOMENDAR UNA PELICULA DE X DIRECTOR
recomendarPeliculaDirector(Director):- listaMoviesDirector(Director,ListaPeliculas),random_member(Recomendacion,ListaPeliculas),write('Te recomiendo la pelicula "'),write(Recomendacion),write('" del director '),write(Director).

%ROCOMENDAR UNA PELICULA DE X ACTOR
recomendarPeliculaDirector(Director):- listaMoviesDirector(Director,ListaPeliculas),random_member(Recomendacion,ListaPeliculas),write('Te recomiendo la pelicula "'),write(Recomendacion),write('" del director '),write(Director).

%MEJOR PELICULA DE X DIRECTOR

%MEJOR PELICULA DE X ACTOR

%MEJOR PELICULA DE X GENERO

%MEJOR PELICULA DE X DIRECTOR

%MEJOR PELICULA DE X EMPRESA PRODUCTORA, MARVEL,DC COMICS

%MEJOR DE X DIRECTOR

%MEJOR PELICULA X O Y

%RECOMENDAR N PELICULAS DE X GENERO,ACTOR,DIRECTOR.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%SERIES%%%%%%%%%%%%%%%%%%%%%%%%%%%

%GENERO DE X SERIE.

%DIRECTOR DE X SERIE

%GUIONISTA DE X SERIE

%ACTOR PRINCIPAL DE DE X SERIE

%REPARTO DE DE X SERIE

%CUANTAS TEMPORADAS TIENE X SERIE

%CUANTOS CAPITULOS TIENE X SERIE

%EMPRESA PRODUCTORA DE X SERIE

%PAIS PRODUCTORA DE X SERIE

%FECHA DE ESTRENO DE X SERIE

%DURACION DE CAPITULO DE LA DE X SERIE

%RECOMENDAR N SERIES DE X GENERO,ACTOR,DIRECTOR.

%ETC ETC LAS MISMA PREGUNTAS DE PELICULAS PERO PARA SERIES.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%ACTORES%%%%%%%%%%%%%%%%%%%%%%%%%%%


%EDAD DE X ACTOR

%LUGAR DE NACIMIENTO DE X ACTOR

%INICIO DE CARRERA DE X ACTOR

%PREMIOS DE X ACTOR

%NUM DE PELIS DE X ACTOR


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%DIRECTOR%%%%%%%%%%%%%%%%%%%%%%%%%%%


%EDAD DE X DIRECTOR

%LUGAR DE NACIMIENTO DE X DIRECTOR

%INICIO DE CARRERA DE X DIRECTOR

%NUM DE PELIS DE X DIRECTOR

%PREMIOS DE X DIRECTOR









