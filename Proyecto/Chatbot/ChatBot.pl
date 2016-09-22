/* Realiza y estándariza a munúsculas y sin acéntos la lectura de frases */
:-['read.pl'].
:- ['Consultas_V3.pl'].
saludo 		--> ( ['hola!']; ['hi!']; ['hello!']; ['hola']; ['hi']; ['hello'] ), otros.
despedida 	--> ['adios']; ['bye']; ['nos vemos']; ['hasta luego'].
pPersName 	--> ['¿'], pronombre, (verbos;pronPers), ['?'].
pPersName 	--> ['¿'], pronombre, (verbos;pronPers), (['llamas'];['tu']),(['Nombre'];[]),['?'].
%pPersJob 	--> ['¿'],art_previo, pronombre, (verbos;pronPers;otros), otros, ['?'].
verbos		-->	['eres']; ['visto'];['es'];['gusta'];['tiene'];['se'];[hizo];['son'];['su'].
pronombre 	--> ['quien']; ['quienes']; ['que']; ['donde']; ['cuando']; ['como']; ['cual']; ['cuales']; ['cuanto']; ['cuantas']; ['cuantos'].
pronPers	--> ['yo']; ['tu']; ['el'];['ella']; ['nosotros']; ['ustedes']; ['ellos']; ['ellas'];['te'];['has'].
art_previo 	--> ['a']; ['en']; ['de']; ['con']; ['como']; ['para']; ['por']; ['sobre'].
articulo 	--> det.
articulo 	--> ind.

orden_sing_pa	--> v_orden, (det; ind), ['pelicula'], art_pos, ['actor'].
orden_sing_pd	--> v_orden, (det; ind), ['pelicula'], art_pos, ['director'].
orden_plur_pa	--> v_orden, (det; ind), ['peliculas'], art_pos, ['actor'].
orden_plur_pd	--> v_orden, (det; ind), ['peliculas'], art_pos, ['director'].
orden_sing_pGen	--> v_orden, (det; ind), ['pelicula'], [de].
orden_plur_pGen	--> v_orden, (det; ind), ['peliculas'], [de].


orden_sing_sa	--> v_orden, (det; ind), ['serie'], art_pos, ['actor'].
orden_sing_sd	--> v_orden, (det; ind), ['serie'], art_pos, ['director'].
orden_plur_sa	--> v_orden, (det; ind), ['series'], art_pos, ['actor'].
orden_plur_sd	--> v_orden, (det; ind), ['series'], art_pos, ['director'].
orden_sing_sGen	--> v_orden, (det; ind), ['serie'], [de].
orden_plur_sGen	--> v_orden, (det; ind), ['series'], [de].

orden_sing_sSin	--> v_orden, (det; ind), ['sinopsis'], [de], [la], [_X].
orden_sing_sInf	--> v_orden, (det; ind), ['informacion'], [de], [la], [_X].

pregGustoPeli 	--> ['¿'], pronPers, verbos, articulo, ['pelicula'].
pregGustoSeri	--> ['¿'], pronPers, verbos, articulo, ['serie'].
temporadaSeri	--> ['¿'], pronombre, ['temporadas'], verbos,((['la'],['serie']);[]).
capitulosSeri	-->	['¿'], pronombre, ['capitulos'], verbos,((['la'],['serie']);[]).

director_Peli	--> ['¿'], pronombre, verbos, pronPers, ['director'], art_pos, ['la'], ['pelicula'].
director_Peli	--> ['¿'], pronombre, verbos, ['llama'], pronPers, ['director'], art_pos, ['la'], ['pelicula'].
director_Peli	--> ['¿'], pronombre, verbos, pronPers, ['nombre'], art_pos, ['director'], art_pos, ['la'], ['pelicula'].

actor_Peli	--> ['¿'], pronombre, verbos, pronPers, ['actor'], art_pos, ['la'],['pelicula'].
actor_Peli	--> ['¿'], pronombre, verbos, ['llama'], pronPers, ['actor'], art_pos, ['la'],['pelicula'].
actor_Peli	--> ['¿'], pronombre, verbos, pronPers, ['nombre'], art_pos, ['actor'], art_pos, ['la'],['pelicula'].

guionistaPeli --> ['¿'], pronombre, verbos, pronPers, ['guionista'], art_pos, ((['la'],['pelicula']);[]).
guionistaPeli --> ['¿'], pronombre, verbos, ['llama'], pronPers, ['actor'], art_pos, ((['la'],['pelicula']);[]).
guionistaPeli --> ['¿'], pronombre, verbos, pronPers, ['nombre'], art_pos, ['actor'], art_pos, ((['la'],['pelicula']);[]).

generoPelicula 	--> ['¿'], pronombre, verbos, pronPers,['genero'], art_pos, det,['pelicula'].
generoSerie 	--> ['¿'], pronombre, verbos, pronPers,['genero'], art_pos, det,['serie'].
califPelicula 	-->	['¿'], pronombre, verbos, det, ['calificacion'], art_pos, det, ['pelicula'].
estrenoPeli		--> ['¿'], pronombre, verbos, ['estreno'], det,['pelicula'].
repartoPeli		--> ['¿'], pronombre, verbos, pronPers,['reparto'], art_pos, det,['pelicula'].
productoraPeli 	--> ['¿'], pronombre, verbos, det,['empresa'],['productora'], art_pos, det,['pelicula'].
paisPelicula	--> ['¿'], art_pos, pronombre, ['pais'],verbos,det,['pelicula'].
paisPelicula	--> ['¿'], ['en'], pronombre, ['pais'],verbos,verbos,det,['pelicula'].
premiosPelicula --> ['¿'], pronombre, ['premios'],verbos,det,['pelicula'].
premiosPelicula2--> ['¿'], pronombre, verbos, det,['premios'], art_pos, det, ['pelicula'].
peliculasActor	--> ['¿'], pronombre, verbos, ['todas'],det,['peliculas'],art_pos,['actor'].
peliculasDirector 	--> ['¿'], pronombre, verbos, ['todas'],det,['peliculas'],art_pos,['director'].
peliculasGuionista 	--> ['¿'], pronombre, verbos, ['todas'],det,['peliculas'],art_pos,['guionista'].
peliculasGenero 	--> ['¿'], pronombre, verbos, ['todas'],det,['peliculas'],art_pos,['genero'].
mejorPeliDirector 	--> ['¿'], pronombre, verbos, det,['mejor'],['pelicula'],art_pos,['director'].
mejorPeliActor 		--> ['¿'], pronombre, verbos, det,['mejor'],['pelicula'],art_pos,['actor'].
mejorPeliGenero 	--> ['¿'], pronombre, verbos, det,['mejor'],['pelicula'],art_pos,['genero'].
mejorPeliEmpresa	--> ['¿'], pronombre, verbos, det,['mejor'],['pelicula'],art_pos,det,['empresa'].
numPeliculasActor	--> ['¿'], pronombre, ['peliculas'],verbos, pronPers, ['actor'].
numPeliculasDirector -->['¿'], pronombre, ['peliculas'],verbos, pronPers, ['director'].
edadActor 			--> ['¿'], pronombre,verbos,det, ['edad'],art_pos,['actor'].
nacimientoActor 	--> ['¿'], pronombre, verbos, pronPers,['lugar'], art_pos,['nacimiento'],art_pos, ['actor'].
inicioCarreraActor 	--> ['¿'], pronombre, ['inicio'],verbos, ['carrera'], pronPers,['actor'].
premiosRecibidosActor --> ['¿'], pronombre,verbos,det,['premios'], art_pos,['actor'].

edadDirector	--> ['¿'], pronombre,verbos,det, ['edad'],art_pos,['director'].
nacimientoDirector 			--> ['¿'], pronombre, verbos, pronPers,['lugar'], art_pos,['nacimiento'],art_pos, ['director'].
inicioCarreraDirector 		--> ['¿'], pronombre, ['inicio'],verbos, ['carrera'], pronPers,['director'].
premiosRecibidosDirector 	--> ['¿'], pronombre,verbos,det,['premios'], art_pos,['director'].
/*
edadActor		--> ['¿'], pronombre,verbos,det, ['edad'],art_pos,['actor'].
nacimientoActor 			--> ['¿'], pronombre, verbos, pronPers,['lugar'], art_pos,['nacimiento'],art_pos, ['actor'].
inicioCarreraActor 		--> ['¿'], pronombre, ['inicio'],verbos, ['carrera'], pronPers,['actor'].
premiosRecibidosActor 	--> ['¿'], pronombre,verbos,det,['premios'], art_pos,['actor'].
*/
director_Seri	--> ['¿'], pronombre, verbos, pronPers, ['director'], art_pos, ['la'],['serie'].
director_Seri	--> ['¿'], pronombre, verbos, ['llama'], pronPers, ['director'], art_pos, ['la'],['serie'].
director_Seri	--> ['¿'], pronombre, verbos, pronPers, ['nombre'], art_pos, ['director'], art_pos, ['la'],['serie'].

actor_Seri	--> ['¿'], pronombre, verbos, pronPers, ['actor'], art_pos, ['la'],['serie'].
actor_Seri	--> ['¿'], pronombre, verbos, ['llama'], pronPers, ['actor'], art_pos, ['la'],['serie'].
actor_Seri	--> ['¿'], pronombre, verbos, pronPers, ['nombre'], art_pos, ['actor'], art_pos, ['la'],['serie'].


v_orden	--> ['dame']; ['dime']; ['recomiendame']; ['muestrame']; ['enseñame'].
det 	--> ['el']; ['la']; ['las']; ['los'];['algunas'].
ind 	--> ['un']; ['una']; ['unos']; ['unas'].
art_pos --> ['de']; ['del'].

otros	--> [].
otros	--> [_X], otros.

elimina(X,[X|Resto],Resto).
elimina(X,[H|Resto],[H|Resto1]):- elimina(X,Resto,Resto1).

listaResPos(L):-L=['Si!! <3 n.n','Si,ṕor supuesto me encanto','Si,claro esta genial','Si,es una bomba','Si,de la mejores, me quede sin palabras cuando la vi'].
listaResNeg(L):-L=['NO!!! ¬¬','No,esa pelicula a mi parecer fue un desatre','No,creo que es tan mal como Dark Vader','No,Creo que esta sobrevalorada','No,sin comentarios °_°'].
makeToken(Lista, R):- atomic_list_concat(Lista,' ', R ).
random(Element, Lista):-random_member(Element,Lista).
procesa:- leer(Frase), nl,valida(Frase).


valida(LFrase):- saludo(LFrase,[]), write('Hola que tal!!'),procesa.
valida(LFrase):- despedida(LFrase,[]), write('Bye!!').
valida(LFrase):- pPersName(LFrase,[]), write('Mi nombre es R2D2 y soy un asistente inteligente especializado en temas sobre películas y series'),procesa.
%valida(LFrase):- pPersJob(LFrase,[]), write('soy un asistente inteligente especializado en temas sobre películas y series'),procesa.

valida(LFrase):- orden_sing_pd(LFrase, R), makeToken(R, Token), recomendarPeliculaDirector(Token), procesa,!.
valida(LFrase):- orden_sing_pd(LFrase, _R), write('Lo siento pero no encontré informacion de ello'), procesa.
valida(LFrase):- orden_sing_pa(LFrase, R), makeToken(R, Token), getActorPelicula(Token), procesa,!.
valida(LFrase):- orden_sing_pa(LFrase, _R), write('Lo siento pero no encontré informacion de ello'), procesa.
valida(LFrase):- orden_plur_pd(LFrase, R), makeToken(R, Token), allMoviesDirector(Token), procesa,!.
valida(LFrase):- orden_plur_pd(LFrase, _R), write('Lo siento pero no encontré informacion de ello'), procesa.
valida(LFrase):- orden_plur_pa(LFrase, R), makeToken(R, Token), allMoviesActor(Token), procesa,!.
valida(LFrase):- orden_plur_pa(LFrase, _R), write('Lo siento pero no encontré informacion de ello'), procesa.
%valida(LFrase):- orden_sing_sd(LFrase, R), makeToken(R, Token), getDirectorPelicula(Token), procesa.
%valida(LFrase):- orden_sing_sd(LFrase, R), not(getDirectorPelicula(Token)), write('Lo siento pero no encontré informacion de ello').
%valida(LFrase):- orden_sing_sa(LFrase, R), makeToken(R, Token), getDirectorPelicula(Token), procesa.
%valida(LFrase):- orden_sing_sa(LFrase, R), not(getDirectorPelicula(Token)), write('Lo siento pero no encontré informacion de ello').
%valida(LFrase):- orden_plur_sd(LFrase, R), makeToken(R, Token), getDirectorPelicula(Token), procesa.
%valida(LFrase):- orden_plur_sd(LFrase, R), not(getDirectorPelicula(Token)), write('Lo siento pero no encontré informacion de ello').
%valida(LFrase):- orden_plur_sa(LFrase, R), makeToken(R, Token), getDirectorPelicula(Token), procesa.
%valida(LFrase):- orden_plur_sa(LFrase, R), not(getDirectorPelicula(Token)), write('Lo siento pero no encontré informacion de ello').
valida(LFrase):- orden_sing_pGen(LFrase, R), makeToken(R, Token), recomendarPeliculaGenero(Token), procesa,!.
valida(LFrase):- orden_sing_pGen(LFrase, _R), write('Lo siento pero no encontré informacion de ello'), procesa.
%valida(LFrase):- orden_sing_sGen(LFrase, R), makeToken(R, Token), getDirectorPelicula(Token), procesa.
%valida(LFrase):- orden_sing_sGen(LFrase, R), write('Lo siento pero no encontré informacion de ello'), procesa.
valida(LFrase):- orden_plur_pGen(LFrase, R), makeToken(R, Token), allMoviesGenero(Token), procesa.
valida(LFrase):- orden_plur_pGen(LFrase, _R), write('Lo siento pero no encontré informacion de ello'), procesa.
%valida(LFrase):- orden_plur_sGen(LFrase, R), makeToken(R, Token), getDirectorPelicula(Token), procesa.
%valida(LFrase):- orden_plur_sGen(LFrase, R), write('Lo siento pero no encontré informacion de ello'), procesa.
valida(LFrase):- orden_sing_sInf(LFrase, R), makeToken(R, Token), getInfoPelicula(Token), procesa.
valida(LFrase):- orden_sing_sInf(LFrase, _R), write('Lo siento pero no encontré informacion de ello'), procesa.
valida(LFrase):- orden_sing_sSin(LFrase, R), makeToken(R, Token), getSinopsisPelicula(Token), procesa.
valida(LFrase):- orden_sing_sSin(LFrase, _R), write('Lo siento pero no encontré informacion de ello'), procesa.


valida(LFrase):- pregGustoPeli(LFrase,NamePeli), elimina('?',NamePeli,Peli), makeToken(Peli,R), getNombresPeliculas(R), listaResPos(L), random(Sol,L), write('? '), write(Sol), procesa.
valida(LFrase):- pregGustoPeli(LFrase,NamePeli), elimina('?',NamePeli,Peli), makeToken(Peli,R), not(getNombresPeliculas(R)), listaResNeg(L), random(Sol,L), write(R),write('? '), write(Sol), procesa.
valida(LFrase):- pregGustoSeri(LFrase,NameSeri), elimina('?',NameSeri,Seri), makeToken(Seri,R), getNombresSeries(R), listaResPos(L), random(Sol,L), write('? '), write(Sol), procesa.
valida(LFrase):- pregGustoSeri(LFrase,NameSeri), elimina('?',NameSeri,Seri), makeToken(Seri,R), not(getNombresSeries(R)), listaResNeg(L), random(Sol,L), write(R),write('? '), write(Sol), procesa.

valida(LFrase):- temporadaSeri(LFrase,NameSeri), elimina('?',NameSeri,Seri), makeToken(Seri,R), getNTemporadaslSerie(R), procesa.
valida(LFrase):- temporadaSeri(LFrase,NameSeri), elimina('?',NameSeri,Seri), makeToken(Seri,R), not(getNTemporadaslSerie(R)), write('Lo siento pero no tengo informacion acerca de lo que preguntas'), procesa.
valida(LFrase):- capitulosSeri(LFrase,NameSeri), elimina('?',NameSeri,Seri), makeToken(Seri,R), getNCapituloslSerie(R), procesa.
valida(LFrase):- capitulosSeri(LFrase,NameSeri), elimina('?',NameSeri,Seri), makeToken(Seri,R), not(getNCapituloslSerie(R)), write('Lo siento pero no tengo informacion acerca de lo que preguntas'), procesa.
valida(LFrase):- director_Peli(LFrase,NameDire), elimina('?',NameDire,Dire), makeToken(Dire,R), getDirectorPelicula(R), procesa.
valida(LFrase):- director_Peli(LFrase,NameDire), elimina('?',NameDire,Dire), makeToken(Dire,R), not(getDirectorPelicula(R)), write('Lo siento pero no tengo esa informacion en estos momentos'), procesa.

valida(LFrase):- director_Seri(LFrase,NameDire), elimina('?',NameDire,Dire), makeToken(Dire,R), getDirectorSerie(R), procesa.
valida(LFrase):- director_Seri(LFrase,NameDire), elimina('?',NameDire,Dire), makeToken(Dire,R), not(getDirectorSerie(R)), write('Losiento pero no tengo esa informacion en estos momentos'), procesa.
valida(LFrase):- actor_Peli(LFrase,NameActor), elimina('?',NameActor,Actor), makeToken(Actor,R), getActorPelicula(R), procesa.
valida(LFrase):- actor_Peli(LFrase,NameActor), elimina('?',NameActor,Actor), makeToken(Actor,R), not(getActorPelicula(R)), write('Losiento pero no tengo esa informacion en estos momentos'), procesa.
valida(LFrase):- actor_Seri(LFrase,NameActor), elimina('?',NameActor,Actor), makeToken(Actor,R), getActorPrincipalSerie(R), procesa.
valida(LFrase):- actor_Seri(LFrase,NameActor), elimina('?',NameActor,Actor), makeToken(Actor,R), not(getActorPrincipalSerie(R)), write('Losiento pero no tengo esa informacion en estos momentos'), procesa.

valida(LFrase):- generoPelicula(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), getGeneroPelicula(R), procesa.
valida(LFrase):- generoPelicula(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(getGeneroPelicula(R)),write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- califPelicula(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), getRankingPelicula(R), procesa.
valida(LFrase):- califPelicula(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(getRankingPelicula(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- estrenoPeli(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), getEstrenoPelicula(R), procesa.
valida(LFrase):- estrenoPeli(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(getEstrenoPelicula(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- repartoPeli(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), getRepartoPelicula(R), procesa.
valida(LFrase):- repartoPeli(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(getRepartoPelicula(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- guionistaPeli(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), getGuionistaPelicula(R), procesa.
valida(LFrase):- guionistaPeli(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(getGuionistaPelicula(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- productoraPeli(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), getProductoraPelicula(R), procesa.
valida(LFrase):- productoraPeli(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(getProductoraPelicula(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- paisPelicula(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), getPaisPelicula(R), procesa.
valida(LFrase):- paisPelicula(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(getPaisPelicula(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- premiosPelicula(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), getPremiosPelicula(R), procesa.
valida(LFrase):- premiosPelicula(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(getPremiosPelicula(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.

valida(LFrase):- peliculasActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), allMoviesActorPrincipal(R), procesa.
valida(LFrase):- peliculasActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(allMoviesActorPrincipal(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- peliculasDirector(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), allMoviesDirector(R), procesa.
valida(LFrase):- peliculasDirector(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(allMoviesDirector(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- peliculasGuionista(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), allMoviesGuionista(R), procesa.
valida(LFrase):- peliculasGuionista(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(allMoviesGuionista(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- peliculasGenero(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), allMoviesGenero(R), procesa.
valida(LFrase):- peliculasGenero(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(allMoviesGenero(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- mejorPeliDirector(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), mejorPeliculaDirector(R), procesa.
valida(LFrase):- mejorPeliDirector(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(mejorPeliculaDirector(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- mejorPeliActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), mejorPeliculaActor(R), procesa.
valida(LFrase):- mejorPeliActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(mejorPeliculaActor(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- mejorPeliGenero(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), mejorPeliculaGenero(R), procesa.
valida(LFrase):- mejorPeliGenero(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(mejorPeliculaGenero(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- mejorPeliEmpresa(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), mejorPeliculaProductora(R), procesa.
valida(LFrase):- mejorPeliEmpresa(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(mejorPeliculaProductora(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- premiosPelicula2(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), getPremiosPelicula(R), procesa.
valida(LFrase):- premiosPelicula2(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(getPremiosPelicula(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- numPeliculasActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), numPelisActor(R), procesa.
valida(LFrase):- numPeliculasActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(numPelisActor(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- numPeliculasDirector(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), numPelisDirector(R), procesa.
valida(LFrase):- numPeliculasDirector(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(numPelisDirector(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- edadActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), getEdadActor(R), procesa.
valida(LFrase):- edadActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(getEdadActor(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- nacimientoActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), getLugarNacActor(R), procesa.
valida(LFrase):- nacimientoActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(getLugarNacActor(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- inicioCarreraActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), getIniCarreActor(R), procesa.
valida(LFrase):- inicioCarreraActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(getIniCarreActor(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- premiosRecibidosActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), premiosActor(R), procesa.
valida(LFrase):- premiosRecibidosActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(premiosActor(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.

valida(LFrase):- edadDirector(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), getEdadDirector(R), procesa.
valida(LFrase):- edadDirector(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(getEdadDirector(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.

valida(LFrase):- nacimientoDirector(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), getLugarNacDirector(R), procesa.
valida(LFrase):- nacimientoDirector(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(getLugarNacDirector(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- inicioCarreraDirector(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), getIniCarreDirector(R), procesa.
valida(LFrase):- inicioCarreraDirector(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(getIniCarreDirector(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- premiosRecibidosDirector(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), premiosDirector(R), procesa.
valida(LFrase):- premiosRecibidosDirector(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(premiosDirector(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.

valida(LFrase):- nacimientoActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), getLugarNacActor(R), procesa.
valida(LFrase):- nacimientoActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(getLugarNacActor(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- inicioCarreraActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), getIniCarreActor(R), procesa.
valida(LFrase):- inicioCarreraActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(getIniCarreActor(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.
valida(LFrase):- premiosRecibidosActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), premiosActor(R), procesa.
valida(LFrase):- premiosRecibidosActor(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(premiosActor(R)), write('No te puedo brindar esa informacion de la pelicula'), procesa.

valida(LFrase):- generoSerie(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,_R),write('hola').%getGeneroSerie(R), procesa.
valida(LFrase):- generoSerie(LFrase,Name), elimina('?',Name,Pelicula), makeToken(Pelicula,R), not(getGeneroSerie(R)),write('No te puedo brindar esa informacion de la pelicula'), procesa.




valida(_ListPal):- write('Lo siento pero no entendí, puedes repetir lo que dices...'),procesa.

:- write('Hola Soy R2D2, puedes preguntarme cosas sobre peliculas y series...'),
		nl, procesa.
