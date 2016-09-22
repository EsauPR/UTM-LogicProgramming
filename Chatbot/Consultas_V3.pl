%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autores:   Lopez Bollo Jonathan         %
%              Peralta Rosales Oscar Esaú %
%              Ventura Mijangos Geovanni  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
concatenar(L1,[],L1).
concatenar([],L2,L2).
concatenar([X1|R1],[X2|R2],[X1|RR]):-concatenar(R1,[X2|R2],RR).

%CARGAR LBRERIAS Y BASE DE DATOS RDF
:- use_module(library(semweb/rdf_db)),rdf_load('database_peliculas_VFinal.rdf').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%CO N S U L T A S %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%CONSULTAR EL NOMBRE DE TODAS LAS PELICULAS
getNombresPeliculas(Pelicula):- rdf(_X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                                listaResPos(L), random(Sol,L),
                                makeToken([' ',Pelicula,'? ',Sol,'\n'],Respuesta),
                                send(@editor, insert ,Respuesta).
                                
getNombresPeliculas(Pelicula):- rdf(_X,'http://www.series.com/nombre',literal(Pelicula)),
                                makeToken([' ',Pelicula,'? ','Si no me equivoco esa es una serie','\n'],Respuesta),
                                send(@editor, insert ,Respuesta).

%CONSULTAR EL NOMBRE DEL DIRECTOR DE X PELICULA.
getDirectorPelicula(Pelicula):- rdf(X,'http://www.peliculas.com/director',literal(Director)),
                                rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                                makeToken([' El Director de la pelicula ',Pelicula,' es ',Director,'\n'],Respuesta),
                                send(@editor, insert ,Respuesta).

%CONSULTAR EL NOMBRE DEL GUIONISTA DE X PELICULA.
getGuionistaPelicula(Pelicula):- rdf(X,'http://www.peliculas.com/guionista',literal(Guionista)),
                                 rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                                 makeToken([' El Guionista de la pelicula ',Pelicula,' es ',Guionista,'\n'],Respuesta),
                                 send(@editor, insert ,Respuesta).

%CONSULTAR EL NOMBRE DEL ACTOR PRINCIPAL DE X PELICULA.
getActorPelicula(Pelicula):- rdf(X,'http://www.peliculas.com/actor_principal',literal(Actor)),
                             rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                             makeToken([' El Actor principal de la pelicula ',Pelicula,' es ',Actor,'\n'],Respuesta),
                             send(@editor, insert ,Respuesta).

%CONSULTAR EL REPARTO DE X PELICULA.
getRepartoPelicula(Pelicula):- rdf(X,'http://www.peliculas.com/actores_reparto',literal(Reparto)),
                               rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                               makeToken([' Los actores de  reparto de la pelicula ',Pelicula,' son ',Reparto,'\n'],Respuesta),
                               send(@editor, insert ,Respuesta).

%CONSULTAR EL RANKING DE X PELICULA.
getRankingPelicula(Pelicula):- rdf(X,'http://www.peliculas.com/calificacion',literal(Ranking)),
                               rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                               makeToken([' El ranking segun IMDb para la pelicula ',Pelicula,' es de ',Ranking,' en una escala de 10 ','\n'],Respuesta),
                               send(@editor, insert ,Respuesta).

%CONSULTAR EL GENERO DE X PELICULA.
getGeneroPelicula(Pelicula):- rdf(X,'http://www.peliculas.com/genero',literal(Genero)),
                              rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                              makeToken([' El genero de la pelicula ',Pelicula,' es ',Genero,'\n'],Respuesta),
                              send(@editor, insert ,Respuesta).

%CONSULTAR FECHA/AÑO DE ESTRENO DE X PELICULA.
getEstrenoPelicula(Pelicula):- rdf(X,'http://www.peliculas.com/fecha_estreno',literal(Estreno)),
                               rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                               makeToken(['La fecha de estreno de la pelicula ',Pelicula,' fue en ',Estreno,'\n'],Respuesta),
                               send(@editor, insert ,Respuesta).

%CONSULTAR EMPRESA PRODUCTORA DE X PELICULA.
getProductoraPelicula(Pelicula):- rdf(X,'http://www.peliculas.com/productora',literal(Productora)),
                                  rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                                  makeToken([' La empresa productora de la pelicula',Pelicula,' es ',Productora,'\n'],Respuesta),
                                  send(@editor, insert ,Respuesta).

%CONSULTAR PAIS DE X PELICULA.
getPaisPelicula(Pelicula):- rdf(X,'http://www.peliculas.com/pais',literal(Pais)),
                            rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                            makeToken([' La pelicula',Pelicula,' fue filmada en ',Pais,'\n'],Respuesta),
                            send(@editor, insert ,Respuesta).

%CONSULTAR SINOPSIS DE X PELICULA.
getSinopsisPelicula(Pelicula):- rdf(X,'http://www.peliculas.com/sinopsis',literal(Sinopsis)),
                                rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                                makeToken([' Sinopsis de la pelicula ',Pelicula,': \n',Sinopsis,'\n'],Respuesta),
                                send(@editor, insert ,Respuesta).

%CONSULTAR PREMIOS DE X PELICULA.
getPremiosPelicula(Pelicula):- rdf(X,'http://www.peliculas.com/premios',literal(Premios)),
                               rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)),
                               makeToken([' Los reconocimientos para pelicula ',Pelicula,'son: ',Premios,'\n'],Respuesta),
                               send(@editor, insert ,Respuesta).

%CONSULTAR TODA LA INFORMACION DE X PELICULA.
getInfoPelicula(Pelicula):- getDirectorPelicula(Pelicula),
                            getGuionistaPelicula(Pelicula),
                            getActorPelicula(Pelicula),
                            getRepartoPelicula(Pelicula),
                            getRankingPelicula(Pelicula),
                            getGeneroPelicula(Pelicula),
                            getEstrenoPelicula(Pelicula),
                            getProductoraPelicula(Pelicula),
                            getPaisPelicula(Pelicula),
                            getSinopsisPelicula(Pelicula),
                            getPremiosPelicula(Pelicula).
                           
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%IMPRIMIR CONTENIDO DE UNA LISTA%%%%%%%%%%
printLista([]).
printLista([X|R]):- write(X), nl, printLista(R).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CLAUSULAS BASICAS PARA OBTENER LISTA(OJO 0.0) DE X OPCION:DIRECTOR,GENERO,GUIONISTA..ETC
getPelisDirector(Director,Pelicula):- rdf(X,'http://www.peliculas.com/director',literal(Director)),
                                      rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)).
getPelisGenero(Genero,Pelicula):- rdf(X,'http://www.peliculas.com/genero',literal(Genero)),
                                  rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)).
getPelisActorPrincipal(Actor,Pelicula):- rdf(X,'http://www.peliculas.com/actor_principal',literal(Actor)),
                                         rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)).
getPelisGuionista(Guionista,Pelicula):- rdf(X,'http://www.peliculas.com/guionista',literal(Guionista)),
                                        rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)).
getPelisProductora(Guionista,Pelicula):- rdf(X,'http://www.peliculas.com/productora',literal(Guionista)),
                                         rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)).
getCalfPel(Calf,Pelicula):- rdf(X,'http://www.peliculas.com/calificacion',literal(Calf)),
                            rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)).
getPeli(Pelicula):- rdf(_X,'http://www.peliculas.com/nombre',literal(Pelicula)).
getGenero(Genero):- rdf(_X,'http://www.peliculas.com/genero',literal(Genero)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%LISTA DE PELICULAS DEL DIRECTOR X.
listaMoviesDirector(Director,ListaPeliculas):- findall( PeliculaNew, getPelisDirector(Director,PeliculaNew), ListaPeliculas).

%LISTA DE PELICULAS DEL GENERO X
listaMoviesGenero(Genero,ListaPeliculas):- findall( PeliculaNew, getPelisGenero(Genero,PeliculaNew), ListaPeliculas).

%LISTA DE PELICULAS DEL ACTOR X
listaMoviesActor(Actor,ListaPeliculas):- findall( PeliculaNew, getPelisActorPrincipal(Actor,PeliculaNew),ListaPeliculas).

%LISTA DE PELICULAS DEL GUIONISTA X
listaMoviesGuionista(Guionista,ListaPeliculas):- findall( PeliculaNew, getPelisGuionista(Guionista,PeliculaNew),ListaPeliculas).

%LISTA DE PELICULAS DE LA PRODUCTORA X
listaMoviesProductora(Productora,ListaPeliculas):- findall( PeliculaNew, getPelisProductora(Productora,PeliculaNew),ListaPeliculas).

%%%%%%%%%%%%%NO ESTOY SEGURO DE ESTA CONSULTA
%LISTA DE TODA LA INFOS DE LAS PELICULAS X
listaMoviesInfo(Info):- findall( PeliculaNew, getInfoPelicula(PeliculaNew),Info).

%LISTA DE TODAS LAS PELICULAS EN UNA LISTA
%allMovies(ListaMovies):- findall( Peliculaew, getPelisGenero(PeliculaNew), ListaMovies).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CONSULTAR TODAS LAS PELICULAS DEL DIRECTOR X
allMoviesDirector(Director):- listaMoviesDirector(Director,ListaPeliculas),
                              makeTokenL(ListaPeliculas,L),
                              makeToken([' Las peliculas dirigidas por ',Director,'son: \n ---> ',L],Respuesta),
                              send(@editor, insert ,Respuesta).

%CONSULTAR TODAS LAS PELICULAS DEL GENERO X.
allMoviesGenero(Genero):- listaMoviesGenero(Genero,ListaPeliculas),
                          makeTokenL(ListaPeliculas,L),
                          makeToken([' Las peliculas de ',Genero,'son: \n ---> ',L],Respuesta),
                          send(@editor, insert ,Respuesta).

%CONSULTAR TODAS LAS PELICULAS DEL ACTOR X.
allMoviesActorPrincipal(Actor):- listaMoviesActor(Actor,ListaPeliculas),
                                 makeTokenL(ListaPeliculas,L),
                                 makeToken([' Las peliculas actuadas por ',Actor,'son: \n ---> ',L],Respuesta),
                                 send(@editor, insert ,Respuesta).
                                 
%CONSULTAR TODAS LAS PELICULAS DEL GUIONISTA X.
allMoviesGuionista(Guionista):- listaMoviesGuionista(Guionista,ListaPeliculas),
                                makeTokenL(ListaPeliculas,L),
                                makeToken([' Las peliculas escritas por ',Guionista,'son: \n ---> ',L],Respuesta),
                                send(@editor, insert ,Respuesta).

%OBTENER TODOS LOS GENEROS EN UNA LISTA
allGeneros(ListaGeneros):- findall( PeliculaNew, getGenero(PeliculaNew), ListaGeneros).

%OBTENER UNA PELICULA RANDOM
peliRandom(X):- allMovies(ListaMovies), random_member(X,ListaMovies).

%OBTENER UN GENERO RANDOM  / RECOMENDAR GENERO
generoRandom(X):- allGeneros(ListaGeneros), random_member(X,ListaGeneros).

%ROCOMENDAR UNA PELICULA
recomendarPelicula:- peliRandom(Recomendacion),
                     makeToken([' Hoy te recomiendo la pelicula "',Recomendacion,'" Esta muy buena!','\n'],Respuesta),
                     send(@editor, insert ,Respuesta).

%UlTIMA PELICULA VISTA
ultimaMovieVista:- peliRandom(LasView),
                   makeToken([' La ultima pelicula que vi fue ',LasView,'\n'],Respuesta),
                   send(@editor, insert ,Respuesta).

%ROCOMENDAR UNA PELICULA DE X GENERO
recomendarPeliculaGenero(Genero):- listaMoviesGenero(Genero,ListaPeliculas),
                                   random_member(Recomendacion,ListaPeliculas),
                                   makeToken([' Te recomiendo la pelicula "',Recomendacion,'" Pelicula de ',Genero,'\n'],Respuesta),
                                   send(@editor, insert ,Respuesta).

%ROCOMENDAR UNA PELICULA DE X DIRECTOR
recomendarPeliculaDirector(Director):- listaMoviesDirector(Director,ListaPeliculas),
                                       random_member(Recomendacion,ListaPeliculas),
                                       makeToken([' Te recomiendo la pelicula "',Recomendacion,'" del director ',Director,'\n'],Respuesta),
                                       send(@editor, insert ,Respuesta).

%ROCOMENDAR UNA PELICULA DE X ACTOR
recomendarPeliculaActor(Actor):- listaMoviesActor(Actor,ListaPeliculas),
                                 random_member(Recomendacion,ListaPeliculas),
                                 makeToken([' Te recomiendo la pelicula "',Recomendacion,'" del actor ',Actor,'\n'],Respuesta),
                                 send(@editor, insert ,Respuesta).

%MEJOR PELICULA DE X DIRECTOR
getRankingPelicula(Pelicula,Ranking):- rdf(X,'http://www.peliculas.com/calificacion',literal(Ranking)),
                                       rdf(X,'http://www.peliculas.com/nombre',literal(Pelicula)).

getListRanking([],[]).
getListRanking([X|R], [X1|R1]):- getRankingPelicula(X,X1), getListRanking(R,R1).
getBestPeli(M,[LP|_R1],[LR|_R2],R):- M = LR, R = LP, !.
getBestPeli(M,[_LP|R1],[_LR|R2],R):- getBestPeli(M,R1,R2,R).
charToNumber([],[]).
charToNumber( [X1|R1], [X2|R2] ):- atom_number(X1,X2), charToNumber(R1,R2).

%OBTENER PELICULA MEJOR RANKEADA,getListR anking DEVUELVE UNA LISTA DE STRING ENTONCES LA CONVERTIMOS A ENTERO CON LA FUNCION charToNumber Y DESPUES SE OBTIENE LA MEJOR PELICULA RANKEADA
bestMovieToRanking(ListaPeliculas,RP):- getListRanking(ListaPeliculas, ListaRankins),
                                        charToNumber(ListaRankins,LRInteger),
                                        max_list(LRInteger,Max),
                                        getBestPeli(Max, ListaPeliculas, LRInteger, RP).
                                        
%MEJOR PELICULA DE X DIRECTOR
mejorPeliculaDirector(Director):- listaMoviesDirector(Director,ListaPeliculas),
                                  bestMovieToRanking(ListaPeliculas,RP),
                                  makeToken([' La mejor pelicula del director ',Director,' es ',RP, 'segun el ranking de IMDb','\n'],Respuesta),
                                  send(@editor, insert ,Respuesta).
                                  
%MEJOR PELICULA DE X ACTOR
mejorPeliculaActor(Actor):-listaMoviesActor(Actor,ListaPeliculas),
                            bestMovieToRanking(ListaPeliculas,RP),
                            makeToken([' La mejor pelicula del actor ',Actor,' es ',RP, 'segun el ranking de IMDb','\n'],Respuesta),
                            send(@editor, insert ,Respuesta).

%MEJOR PELICULA DE X GENERO
mejorPeliculaGenero(Genero):-listaMoviesGenero(Genero,ListaPeliculas),
                            bestMovieToRanking(ListaPeliculas,RP),
                            makeToken([' La mejor pelicula de ',Genero,' es ',RP, 'segun el ranking de IMDb','\n'],Respuesta),
                            send(@editor, insert ,Respuesta).
                            
%MEJOR PELICULA DE X EMPRESA PRODUCTORA, MARVEL,DC COMICS
mejorPeliculaProductora(Productora):- listaMoviesProductora(Productora,ListaPeliculas),
                                      bestMovieToRanking(ListaPeliculas,RP),
                                      makeToken([' La mejor pelicula de ',Productora,' es ',RP, 'segun la critica conocedora :P','\n'],Respuesta),
                                      send(@editor, insert ,Respuesta).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%SERIES%%%%%%%%%%%%%%%%%%%%%%%%%%%
                 
%CONSULTAR EL NOMBRE DE TODAS LAS PELICULAS
getNombresSeries(Serie):- rdf(_X,'http://www.series.com/nombre',literal(Serie)),
                                listaResPos(L), random(Sol,L),
                                makeToken([' ',Serie,'? ',Sol,'\n'],Respuesta),
                                send(@editor, insert ,Respuesta).

getNombresSeries(Serie):- rdf(_X,'http://www.peliculas.com/nombre',literal(Serie)),
                                makeToken([' ',Serie,'? ','Si no me equivoco esa es una pelicula ¬¬','\n'],Respuesta),
                                send(@editor, insert ,Respuesta).
                                
%DIRECTOR DE X SERIE
getDirectorSerie(Serie):- rdf(X,'http://www.series.com/director',literal(Director)),
                          rdf(X,'http://www.series.com/nombre',literal(Serie)),
                          makeToken([' El Director de la Serie ',Serie,' es ',Director,'\n'],Respuesta),
                          send(@editor, insert ,Respuesta).

%GENERO DE X SERIE.    
getGeneroSerie(Serie):- rdf(X,'http://www.series.com/genero',literal(Genero)),
                        rdf(X,'http://www.series.com/nombre',literal(Serie)),
                        makeToken([' El Genero de la Serie ',Serie,' es ',Genero,'\n'],Respuesta),
                        send(@editor, insert ,Respuesta).
                        
%GUIONISTA DE X SERIE
getGuionistaSerie(Serie):- rdf(X,'http://www.series.com/guionista',literal(Guionista)),
                           rdf(X,'http://www.series.com/nombre',literal(Serie)),
                           makeToken([' El Guionista de la Serie ',Serie,' es ',Guionista,'\n'],Respuesta),
                           send(@editor, insert ,Respuesta).

%ACTOR PRINCIPAL DE DE X SERIE
getActorPrincipalSerie(Serie):- rdf(X,'http://www.series.com/actor_principal',literal(Actor)),
                                rdf(X,'http://www.series.com/nombre',literal(Serie)),
                                makeToken([' El Actor Principal de la Serie ',Serie,' es ',Actor,'\n'],Respuesta),
                                send(@editor, insert ,Respuesta).
                                
%REPARTO DE DE X SERIE
getRepartolSerie(Serie):- rdf(X,'http://www.series.com/actores_reparto',literal(Reparto)),
                          rdf(X,'http://www.series.com/nombre',literal(Serie)),
                          makeToken([' Los actores de reparto de la Serie ',Serie,' son ',Reparto,'\n'],Respuesta),
                          send(@editor, insert ,Respuesta).

%CUANTAS TEMPORADAS TIENE X SERIE
getNTemporadaslSerie(Serie):- rdf(X,'http://www.series.com/temporadas',literal(Temporada)),
                              rdf(X,'http://www.series.com/nombre',literal(Serie)),
                              makeToken([' La Serie ',Serie,' Tiene ',Temporada,' Temporadas','\n'],Respuesta),
                              send(@editor, insert ,Respuesta).

%CUANTOS CAPITULOS TIENE X SERIE

getNCapituloslSerie(Serie):- rdf(X,'http://www.series.com/episodios',literal(Capitulos)),
                             rdf(X,'http://www.series.com/nombre',literal(Serie)),
                             makeToken([' La Serie ',Serie,' Tiene ',Capitulos,' capitulos','\n'],Respuesta),
                             send(@editor, insert ,Respuesta).
                             
%EMPRESA PRODUCTORA DE X SERIE
getProductoraSerie(Serie):- rdf(X,'http://www.series.com/productora',literal(Productora)),
                            rdf(X,'http://www.series.com/nombre',literal(Serie)),
                            makeToken([' La Serie ',Serie,' fue producida por la empresa ',Productora,'\n'],Respuesta),
                            send(@editor, insert ,Respuesta).

%PAIS PRODUCTORA DE X SERIE
getPaisSerie(Serie):- rdf(X,'http://www.series.com/pais',literal(Pais)),
                      rdf(X,'http://www.series.com/nombre',literal(Serie)),
                      makeToken([' La Serie ',Serie,' fue producida en ',Pais,'\n'],Respuesta),
                      send(@editor, insert ,Respuesta).

%FECHA DE ESTRENO DE X SERIE
getEstrenoSerie(Serie):- rdf(X,'http://www.series.com/fecha_estreno',literal(Estreno)),
                         rdf(X,'http://www.series.com/nombre',literal(Serie)),
                         makeToken([' La Serie ',Serie,' fue estrenada en ',Estreno,'\n'],Respuesta),
                         send(@editor, insert ,Respuesta).

%DURACION DE CAPITULO DE LA DE X SERIE
getDuracionCapituloSerie(Serie):- rdf(X,'http://www.series.com/duracion_capitulo',literal(DurCap)),
                                  rdf(X,'http://www.series.com/nombre',literal(Serie)),
                                  makeToken([' La duracion de cada capitulo de la serie ',Serie,' es aproximadamente ',DurCap,'\n'],Respuesta),
                                  send(@editor, insert ,Respuesta).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%ACTORES%%%%%%%%%%%%%%%%%%%%%%%%%%%


%EDAD DE X ACTOR
getEdadActor(Actor):- rdf(X,'http://www.actores.com/edad',literal(Edad)),
                      rdf(X,'http://www.actores.com/nombre',literal(Actor)),
                      makeToken([' La edad del actor ',Actor,' es de ',Edad,'\n'],Respuesta),
                      send(@editor, insert ,Respuesta).

%LUGAR DE NACIMIENTO DE X ACTOR
getLugarNacActor(Actor):- rdf(X,'http://www.actores.com/lugar_nacimiento',literal(LugNac)),
                          rdf(X,'http://www.actores.com/nombre',literal(Actor)),
                          makeToken([' El lugar de nacimiento del actor ',Actor,' es ',LugNac,'\n'],Respuesta),
                          send(@editor, insert ,Respuesta).

%INICIO DE CARRERA DE X ACTOR
getIniCarreActor(Actor):- rdf(X,'http://www.actores.com/inicio_carrera',literal(IniCarr)),
                          rdf(X,'http://www.actores.com/nombre',literal(Actor)),
                          makeToken([' El actor ',Actor,' inicio su carrera en ',IniCarr,'\n'],Respuesta),
                          send(@editor, insert ,Respuesta).

%PREMIOS DE X ACTOR
premiosActor(Actor):- rdf(X,'http://www.actores.com/premios',literal(Premios)),
                      rdf(X,'http://www.actores.com/nombre',literal(Actor)),
                      makeToken([' Los premios del actor ',Actor,' son ',Premios,'\n'],Respuesta),
                      send(@editor, insert ,Respuesta).

%NUM DE PELIS DE X ACTOR
numPelisActor(Actor):- listaMoviesActor(Actor,ListaPeliculas),length(ListaPeliculas, Num),
                       makeToken([' El actor ',Actor,' ha participado en ',Num,' pelicula(s)','\n'],Respuesta),
                       send(@editor, insert ,Respuesta).
                       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%DIRECTOR%%%%%%%%%%%%%%%%%%%%%%%%%

getEdadDirector(Director):- rdf(X,'http://www.directores.com/edad',literal(Edad)),
                            rdf(X,'http://www.directores.com/nombre',literal(Director)),
                            makeToken([' La edad del Director ',Director,' es de ',Edad,'\n'],Respuesta),
                            send(@editor, insert ,Respuesta).

%LUGAR DE NACIMIENTO DE X Director
getLugarNacDirector(Director):- rdf(X,'http://www.directores.com/lugar_nacimiento',literal(LugNac)),
                                rdf(X,'http://www.directores.com/nombre',literal(Director)),
                                makeToken([' El lugar de nacimiento del Director ',Director,' es ',LugNac,'\n'],Respuesta),
                                send(@editor, insert ,Respuesta).

%INICIO DE CARRERA DE X Director
getIniCarreDirector(Director):- rdf(X,'http://www.directores.com/inicio_carrera',literal(IniCarr)),
                                rdf(X,'http://www.directores.com/nombre',literal(Director)),
                                makeToken([' El Director ',Director,' inicio su carrera en ',IniCarr,'\n'],Respuesta),
                                send(@editor, insert ,Respuesta).

%PREMIOS DE X Director
premiosDirector(Director):- rdf(X,'http://www.directores.com/premios',literal(Premios)),
                            rdf(X,'http://www.directores.com/nombre',literal(Director)),
                            makeToken([' Los premios del Director ',Director,' son ',Premios,'\n'],Respuesta),
                            send(@editor, insert ,Respuesta).

%NUM DE PELIS DE X DIRECTOR
numPelisDirector(Director):- listaMoviesDirector(Director,ListaPeliculas),length(ListaPeliculas, Num),
                             makeToken([' ',Director,' ha dirigido ',Num,' pelicula(s)','\n'],Respuesta),
                             send(@editor, insert ,Respuesta).









