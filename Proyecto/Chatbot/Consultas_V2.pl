% Autor:
% Fecha: 21/01/2015


concatenar(L1,[],L1).
concatenar([],L2,L2).
concatenar([X1|R1],[X2|R2],[X1|RR]):-concatenar(R1,[X2|R2],RR).

%CARGAR LBRERIAS Y BASE DE DATOS RDF
:- use_module(library(semweb/rdf_db)),rdf_load('database_peliculas_V5.rdf').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%CO N S U L T A S %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%CONSULTAR EL NOMBRE DE TODAS LAS PELICULAS
getNombresPeliculas(Pelicula):-rdf(_X,'http://www.peliculas.com/nombre',literal(Pelicula)),
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
getPelisProductora(Guionista,Pelicula):-rdf(X,'http://www.peliculas.com/productora',literal(Guionista)),rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)).
getCalfPel(Calf,Pelicula):-rdf(X,'http://www.peliculas.com/calificacion',literal(Calf)),rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)).
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

%LISTA DE PELICULAS DE LA PRODUCTORA X
listaMoviesProductora(Productora,ListaPeliculas):-findall( PeliculaNew, getPelisProductora(Productora,PeliculaNew),ListaPeliculas).

%%%%%%%%%%%%%NO ESTOY SEGURO DE ESTA CONSULTA
%LISTA DE TODA LA INFOS DE LAS PELICULAS X
listaMoviesInfo(Info):-findall( PeliculaNew, getInfoPelicula(PeliculaNew),Info).

%LISTA DE TODAS LAS PELICULAS EN UNA LISTA
%allMovies(ListaMovies):- findall( Peliculaew, getPelisGenero(PeliculaNew), ListaMovies).




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
recomendarPeliculaActor(Actor):- listaMoviesActor(Actor,ListaPeliculas),random_member(Recomendacion,ListaPeliculas),write('Te recomiendo la pelicula "'),write(Recomendacion),write('" del actor '),write(Actor).

%MEJOR PELICULA DE X DIRECTOR

getRankingPelicula(Pelicula,Ranking):-rdf(X,'http://www.peliculas.com/calificacion',literal(Ranking)),
                              rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)).

getListRanking([],[]).
getListRanking([X|R], [X1|R1]):- getRankingPelicula(X,X1), getListRanking(R,R1).

getBestPeli(M,[LP|_R1],[LR|_R2],R):- M = LR, R = LP, !.
getBestPeli(M,[_LP|R1],[_LR|R2],R):- getBestPeli(M,R1,R2,R).
charToNumber([],[]).
charToNumber( [X1|R1], [X2|R2] ):- atom_number(X1,X2), charToNumber(R1,R2).

%OBTENER PELICULA MEJOR RANKEADA,getListR anking DEVUELVE UNA LISTA DE STRING ENTONCES LA CONVERTIMOS A ENTERO CON LA FUNCION charToNumber Y DESPUES SE OBTIENE LA MEJOR PELICULA RANKEADA
bestMovieToRanking(ListaPeliculas,RP):-getListRanking(ListaPeliculas, ListaRankins),
                                      charToNumber(ListaRankins,LRInteger), 
                                      max_list(LRInteger,Max), 
                                      getBestPeli(Max, ListaPeliculas, LRInteger, RP).
%MEJOR PELICULA DE X DIRECTOR
mejorPeliculaDirector(Director):-listaMoviesDirector(Director,ListaPeliculas),
                                  bestMovieToRanking(ListaPeliculas,RP),
                                  write('La mejor pelicula del director '),write(Director),write(' es '),write(RP), write(' segun el ranking de IMDb ').

%MEJOR PELICULA DE X ACTOR
mejorPeliculaActor(Actor):-listaMoviesActor(Actor,ListaPeliculas),
                            bestMovieToRanking(ListaPeliculas,RP),
                            write('La mejor pelicula del actor '),write(Actor),write(' es '),write(RP), write(' segun el ranking de IMDb ').
%MEJOR PELICULA DE X GENERO
mejorPeliculaGenero(Genero):-listaMoviesGenero(Genero,ListaPeliculas),
                            bestMovieToRanking(ListaPeliculas,RP),
                            write('La mejor pelicula de '),write(Genero),write(' es '),write(RP), write(' segun el ranking de IMDb ').



%MEJOR PELICULA DE X EMPRESA PRODUCTORA, MARVEL,DC COMICS
mejorPeliculaProductora(Productora):-listaMoviesProductora(Productora,ListaPeliculas),
                            bestMovieToRanking(ListaPeliculas,RP),
                            write('La mejor pelicula de '),write(Productora),write(' es '),write(RP), write(' segun la critica conocedora :P').



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%SERIES%%%%%%%%%%%%%%%%%%%%%%%%%%%



%DIRECTOR DE X SERIE
getDirectorSerie(Serie):-rdf(X,'http://www.series.com/director',literal(Director)),
                               rdf(X,'http://www.series.com/nombre',literal(Serie)),
                               write('El Director de la Serie '),write(Serie),write(' es '),write(Director).

%GENERO DE X SERIE.    
getGeneroSerie(Serie):-rdf(X,'http://www.series.com/genero',literal(Genero)),
                               rdf(X,'http://www.series.com/nombre',literal(Serie)),
                               write('El Genero de la Serie '),write(Serie),write(' es '),write(Genero).                        

%GUIONISTA DE X SERIE

getGuionistaSerie(Serie):-rdf(X,'http://www.series.com/guionista',literal(Guionista)),
                               rdf(X,'http://www.series.com/nombre',literal(Serie)),
                               write('El Guionista de la Serie '),write(Serie),write(' es '),write(Guionista).                        

%ACTOR PRINCIPAL DE DE X SERIE
getActorPrincipalSerie(Serie):-rdf(X,'http://www.series.com/actor_principal',literal(Actor)),
                               rdf(X,'http://www.series.com/nombre',literal(Serie)),
                               write('El Actor Principal de la Serie '),write(Serie),write(' es '),write(Actor).                        

%REPARTO DE DE X SERIE
getRepartolSerie(Serie):-rdf(X,'http://www.series.com/actores_reparto',literal(Reparto)),
                               rdf(X,'http://www.series.com/nombre',literal(Serie)),
                               write('Los actores de reparto de la Serie '),write(Serie),write(' es '),write(Reparto).                        


%CUANTAS TEMPORADAS TIENE X SERIE
getNTemporadaslSerie(Serie):-rdf(X,'http://www.series.com/temporadas',literal(Temporada)),
                               rdf(X,'http://www.series.com/nombre',literal(Serie)),
                               write('La Serie '),write(Serie),write(' Tiene '),write(Temporada),write(' Temporadas'). 

%CUANTOS CAPITULOS TIENE X SERIE

getNCapituloslSerie(Serie):-rdf(X,'http://www.series.com/episodios',literal(Capitulos)),
                               rdf(X,'http://www.series.com/nombre',literal(Serie)),
                               write('La Serie '),write(Serie),write(' Tiene '),write(Capitulos),write(' capitulos'). 



%EMPRESA PRODUCTORA DE X SERIE
getProductoraSerie(Serie):-rdf(X,'http://www.series.com/productora',literal(Productora)),
                               rdf(X,'http://www.series.com/nombre',literal(Serie)),
                               write('La Serie '),write(Serie),write(' fue producida por la empresa '),write(Productora).                        

%PAIS PRODUCTORA DE X SERIE
getPaisSerie(Serie):-rdf(X,'http://www.series.com/pais',literal(Pais)),
                               rdf(X,'http://www.series.com/nombre',literal(Serie)),
                               write('La Serie '),write(Serie),write(' fue producida en '),write(Pais).                        

%FECHA DE ESTRENO DE X SERIE
getEstrenoSerie(Serie):-rdf(X,'http://www.series.com/fecha_estreno',literal(Estreno)),
                               rdf(X,'http://www.series.com/nombre',literal(Serie)),
                               write('La Serie '),write(Serie),write(' fue estrenada en '),write(Estreno).                        

%DURACION DE CAPITULO DE LA DE X SERIE
getDuracionCapituloSerie(Serie):-rdf(X,'http://www.series.com/duracion_capitulo',literal(DurCap)),
                               rdf(X,'http://www.series.com/nombre',literal(Serie)),
                               write('La duracion de cada capitulo de la serie '),write(Serie),write(' es aproximadamente '),write(DurCap).                        





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%ACTORES%%%%%%%%%%%%%%%%%%%%%%%%%%%


%EDAD DE X ACTOR
getEdadActor(Actor):-rdf(X,'http://www.actores.com/edad',literal(Edad)),
                               rdf(X,'http://www.actores.com/nombre',literal(Actor)),
                               write('La edad del actor '),write(Actor),write(' es de '),write(Edad).                        

%LUGAR DE NACIMIENTO DE X ACTOR
getLugarNacActor(Actor):-rdf(X,'http://www.actores.com/lugar_nacimiento',literal(LugNac)),
                               rdf(X,'http://www.actores.com/nombre',literal(Actor)),
                               write('El lugar de nacimiento del actor '),write(Actor),write(' es '),write(LugNac).                        

%INICIO DE CARRERA DE X ACTOR
getIniCarreActor(Actor):-rdf(X,'http://www.actores.com/inicio_carrera',literal(IniCarr)),
                               rdf(X,'http://www.actores.com/nombre',literal(Actor)),
                               write('El actor '),write(Actor),write(' inicio su carrera en '),write(IniCarr).                        

%PREMIOS DE X ACTOR
premiosActor(Actor):-rdf(X,'http://www.actores.com/premios',literal(Premios)),
                               rdf(X,'http://www.actores.com/nombre',literal(Actor)),
                               write('Los premios del actor '),write(Actor),write(' son '),nl,write(Premios).                        

%NUM DE PELIS DE X ACTOR
numPelisActor(Actor):-listaMoviesActor(Actor,ListaPeliculas),length(ListaPeliculas, Num),
                      write('El actor '),write(Actor),write(' ha participado en '),write(Num),write(' pelicula(s)').                        



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%DIRECTOR%%%%%%%%%%%%%%%%%%%%%%%%%%%


getEdadDirector(Director):-rdf(X,'http://www.directores.com/edad',literal(Edad)),
                               rdf(X,'http://www.directores.com/nombre',literal(Director)),
                               write('La edad del Director '),write(Director),write(' es de '),write(Edad).                        

%LUGAR DE NACIMIENTO DE X Director
getLugarNacDirector(Director):-rdf(X,'http://www.directores.com/lugar_nacimiento',literal(LugNac)),
                               rdf(X,'http://www.directores.com/nombre',literal(Director)),
                               write('El lugar de nacimiento del Director '),write(Director),write(' es '),write(LugNac).                        

%INICIO DE CARRERA DE X Director
getIniCarreDirector(Director):-rdf(X,'http://www.directores.com/inicio_carrera',literal(IniCarr)),
                               rdf(X,'http://www.directores.com/nombre',literal(Director)),
                               write('El Director '),write(Director),write(' inicio su carrera en '),write(IniCarr).                        

%PREMIOS DE X Director
premiosDirector(Director):-rdf(X,'http://www.directores.com/premios',literal(Premios)),
                               rdf(X,'http://www.directores.com/nombre',literal(Director)),
                               write('Los premios del Director '),write(Director),write(' son '),nl,write(Premios).      

%NUM DE PELIS DE X DIRECTOR
numPelisDirector(Director):-listaMoviesDirector(Director,ListaPeliculas),length(ListaPeliculas, Num),
                      write(Director),write(' ha dirigido '),write(Num),write(' pelicula(s)').                        









