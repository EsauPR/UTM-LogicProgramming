%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autores:   Lopez Bollo Jonathan         %
%              Peralta Rosales Oscar Esaú %
%              Ventura Mijangos Geovanni  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:-['Consultas_V3.pl'].
:-use_module(library(pce)).
:-pce_image_directory('./').
resource(koala, image, image('r2d2.jpg')).
resource(koala2, image, image('Thats-All-Folks.jpg')).
resource(user, image, image('user.jpg')).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-----------------------------------Graficos-----------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ventana_despedida:- new(  W, window('Bye') ),
                    new(  I, image(resource(koala2))),
                    send( W, size, size(720, 575)),
                    send( W, display, bitmap(I)),
                    send( W, open_centered),
                    send( timer(3), delay),
                    send( W, destroy).

crearVentana:- new(  @ventanaPrincipal, dialog('Chatboot R2D2')),   
               new(  Imagen, image(resource(koala))),
               new(  ImaUser, image(resource(user))),
               new(  @editor, editor( @default )),   
               new(  @input, text_item(preguntar)),
               send( @ventanaPrincipal, width, 670 ),
               send( @ventanaPrincipal, height, 450 ),
               send( @ventanaPrincipal, display, bitmap(Imagen)),
               send( @ventanaPrincipal, display, bitmap(ImaUser),point(10,380)),
               send( @editor, width, 40 ),
               send( @editor, height, 20),
               send( @ventanaPrincipal, display, @editor, point(10, 10) ),
               send( @ventanaPrincipal, display, @input, point(55, 385) ),
               send( @input, width, 27 ),
               new(  @boton , button( enviar , 
                    message( @ventanaPrincipal , return , @input?selection ) )),
               send( @ventanaPrincipal, display, @boton, point(330, 385) ),
               send( @ventanaPrincipal, default_button(enviar)),
               send( @ventanaPrincipal, open_centered ),
               recibirConsulta.

recibirConsulta:-   send( @input, value, ''),
                    get(  @ventanaPrincipal, confirm, Consulta ),
                    send( @editor, insert, '\n\n Usuario : ' ),
                    send( @editor, insert, Consulta ),
                    send( @editor, insert, '\n R2D2 : ' ),
                    inicio(Consulta).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-----------------------------------Gramatica----------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

saludo    --> ( ['hola!']; ['hi!']; ['hello!']; ['hola']; ['hi']; ['hello'] ), otros.
despedida --> ['adios']; ['bye']; ['nos vemos']; ['hasta luego'].
pPersName --> ['¿'], pronombre, (verbos;pronPers), ['?'].
pPersName --> ['¿'], pronombre, (verbos;pronPers), (['llamas'];['tu']),(['Nombre'];[]),['?'].

verbos    --> ['eres']; ['visto'];['es'];['gusta'];['tiene'];['se'];[hizo];['son'];['su'].
pronombre --> ['quien']; ['quienes']; ['que']; ['donde']; ['cuando']; ['como']; ['cual']; ['cuales']; ['cuanto']; ['cuantas']; ['cuantos'].
pronPers  --> ['yo']; ['tu']; ['el'];['ella']; ['nosotros']; ['ustedes']; ['ellos']; ['ellas'];['te'];['has'].
art_previ --> ['a']; ['en']; ['de']; ['con']; ['como']; ['para']; ['por']; ['sobre'].
articulo  --> det.
articulo  --> ind.

orden_sing_pa  --> v_orden, (det; ind), ['pelicula'], art_pos, ['actor'].
orden_sing_pd  --> v_orden, (det; ind), ['pelicula'], art_pos, ['director'].
orden_plur_pa  --> v_orden, (det; ind), ['peliculas'], art_pos, ['actor'].
orden_plur_pd  --> v_orden, (det; ind), ['peliculas'], art_pos, ['director'].
orden_sing_sa  --> v_orden, (det; ind), ['serie'], art_pos, ['actor'].
orden_sing_sd  --> v_orden, (det; ind), ['serie'], art_pos, ['director'].
orden_plur_sa  --> v_orden, (det; ind), ['series'], art_pos, ['actor'].
orden_plur_sd  --> v_orden, (det; ind), ['series'], art_pos, ['director'].

orden_sing_pGen     --> v_orden, (det; ind), ['pelicula'], [de].
orden_plur_pGen     --> v_orden, (det; ind), ['peliculas'], [de].
orden_sing_sGen     --> v_orden, (det; ind), ['serie'], [de].
orden_plur_sGen     --> v_orden, (det; ind), ['series'], [de].
orden_sing_sSin     --> v_orden, (det; ind), ['sinopsis'], [de], [la], [_X].
orden_sing_sInf     --> v_orden, (det; ind), ['informacion'], [de], [la], [_X].

pregGustoPeli  --> ['¿'], pronPers, verbos, articulo, ['pelicula'].
pregGustoSeri  --> ['¿'], pronPers, verbos, articulo, ['serie'].
temporadaSeri  --> ['¿'], pronombre, ['temporadas'], verbos,((['la'],['serie']);[]).
capitulosSeri  --> ['¿'], pronombre, ['capitulos'], verbos,((['la'],['serie']);[]).
director_Peli  --> ['¿'], pronombre, verbos, pronPers, ['director'], art_pos, ['la'], ['pelicula'].
director_Peli  --> ['¿'], pronombre, verbos, ['llama'], pronPers, ['director'], art_pos, ['la'], ['pelicula'].
director_Peli  --> ['¿'], pronombre, verbos, pronPers, ['nombre'], art_pos, ['director'], art_pos, ['la'], ['pelicula'].
actor_Peli     --> ['¿'], pronombre, verbos, pronPers, ['actor'], art_pos, ['la'],['pelicula'].
actor_Peli     --> ['¿'], pronombre, verbos, ['llama'], pronPers, ['actor'], art_pos, ['la'],['pelicula'].
actor_Peli     --> ['¿'], pronombre, verbos, pronPers, ['nombre'], art_pos, ['actor'], art_pos, ['la'],['pelicula'].
guionistaPeli  --> ['¿'], pronombre, verbos, pronPers, ['guionista'], art_pos, ((['la'],['pelicula']);[]).
guionistaPeli  --> ['¿'], pronombre, verbos, ['llama'], pronPers, ['actor'], art_pos, ((['la'],['pelicula']);[]).
guionistaPeli  --> ['¿'], pronombre, verbos, pronPers, ['nombre'], art_pos, ['actor'], art_pos, ((['la'],['pelicula']);[]).
generoPelicula --> ['¿'], pronombre, verbos, pronPers,['genero'], art_pos, det,['pelicula'].
generoSerie    --> ['¿'], pronombre, verbos, pronPers,['genero'], art_pos, det,['serie'].
califPelicula  --> ['¿'], pronombre, verbos, det, ['calificacion'], art_pos, det, ['pelicula'].
estrenoPeli    --> ['¿'], pronombre, verbos, ['estreno'], det,['pelicula'].
repartoPeli    --> ['¿'], pronombre, verbos, pronPers,['reparto'], art_pos, det,['pelicula'].
productoraPeli --> ['¿'], pronombre, verbos, det,['empresa'],['productora'], art_pos, det,['pelicula'].
paisPelicula   --> ['¿'], art_pos, pronombre, ['pais'],verbos,det,['pelicula'].
paisPelicula   --> ['¿'], ['en'], pronombre, ['pais'],verbos,verbos,det,['pelicula'].

premiosPelicula     --> ['¿'], pronombre, ['premios'],verbos,det,['pelicula'].
premiosPelicula2    --> ['¿'], pronombre, verbos, det,['premios'], art_pos, det, ['pelicula'].
peliculasActor      --> ['¿'], pronombre, verbos, ['todas'],det,['peliculas'],art_pos,['actor'].
peliculasDirector   --> ['¿'], pronombre, verbos, ['todas'],det,['peliculas'],art_pos,['director'].
peliculasGuionista  --> ['¿'], pronombre, verbos, ['todas'],det,['peliculas'],art_pos,['guionista'].
peliculasGenero     --> ['¿'], pronombre, verbos, ['todas'],det,['peliculas'],art_pos,['genero'].
mejorPeliDirector   --> ['¿'], pronombre, verbos, det,['mejor'],['pelicula'],art_pos,['director'].
mejorPeliActor      --> ['¿'], pronombre, verbos, det,['mejor'],['pelicula'],art_pos,['actor'].
mejorPeliGenero     --> ['¿'], pronombre, verbos, det,['mejor'],['pelicula'],art_pos,['genero'].
mejorPeliEmpresa    --> ['¿'], pronombre, verbos, det,['mejor'],['pelicula'],art_pos,det,['empresa'].
numPeliculasActor   --> ['¿'], pronombre, ['peliculas'],verbos, pronPers, ['actor'].
numPeliculasDirector--> ['¿'], pronombre, ['peliculas'],verbos, pronPers, ['director'].
edadActor           --> ['¿'], pronombre, verbos,det, ['edad'],art_pos,['actor'].
nacimientoActor     --> ['¿'], pronombre, verbos, pronPers,['lugar'], art_pos,['nacimiento'],art_pos, ['actor'].
inicioCarreraActor  --> ['¿'], pronombre, ['inicio'],verbos, ['carrera'], pronPers,['actor'].
premiosRecibidosActor    --> ['¿'], pronombre,verbos,det,['premios'], art_pos,['actor'].
edadDirector        --> ['¿'], pronombre,verbos,det, ['edad'],art_pos,['director'].
nacimientoDirector  --> ['¿'], pronombre, verbos, pronPers,['lugar'], art_pos,['nacimiento'],art_pos, ['director'].
inicioCarreraDirector    --> ['¿'], pronombre, ['inicio'],verbos, ['carrera'], pronPers,['director'].
premiosRecibidosDirector --> ['¿'], pronombre,verbos,det,['premios'], art_pos,['director'].
director_Seri  --> ['¿'], pronombre, verbos, pronPers, ['director'], art_pos, ['la'],['serie'].
director_Seri  --> ['¿'], pronombre, verbos, ['llama'], pronPers, ['director'], art_pos, ['la'],['serie'].
director_Seri  --> ['¿'], pronombre, verbos, pronPers, ['nombre'], art_pos, ['director'], art_pos, ['la'],['serie'].
actor_Seri     --> ['¿'], pronombre, verbos, pronPers, ['actor'], art_pos, ['la'],['serie'].
actor_Seri     --> ['¿'], pronombre, verbos, ['llama'], pronPers, ['actor'], art_pos, ['la'],['serie'].
actor_Seri     --> ['¿'], pronombre, verbos, pronPers, ['nombre'], art_pos, ['actor'], art_pos, ['la'],['serie'].
v_orden   --> ['dame']; ['dime']; ['recomiendame']; ['muestrame']; ['enseñame'].
det       --> ['el']; ['la']; ['las']; ['los'];['algunas'].
ind       --> ['un']; ['una']; ['unos']; ['unas'].
art_pos   --> ['de']; ['del'].
otros     --> [].
otros     --> [_X], otros.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%------------------------------Reglas Auxiliares-------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

elimina(X,[X|Resto],Resto).
elimina(X,[H|Resto],[H|Resto1]):- elimina(X,Resto,Resto1).
listaResPos(L):- L=['Si!! <3 n.n','Si,por supuesto me encanto','Si,claro esta genial','Si,es una bomba','Si,de la mejores, me quede sin palabras cuando la vi'].
listaResNeg(L):- L=['NO!!! ¬¬','No,esa a mi parecer fue un desatre','No,creo que es tan mal como Dark Vader','No,Creo que esta sobrevalorada','No,sin comentarios °_°'].
makeToken(Lista, R):- atomic_list_concat(Lista,' ', R ).
makeTokenL(Lista, R):- atomic_list_concat(Lista,'\n ---> ', R ).
random(Element, Lista):-random_member(Element,Lista).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%---------------------------------Validaciones---------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

valida(LFrase):-    
               saludo(LFrase,[]), 
               send(@editor, insert ,' Hola que tal!!'), 
               recibirConsulta.
valida(LFrase):- 
               despedida(LFrase,[]), 
               send(@editor, insert ,' Bye!!'),
               free(@ventanaPrincipal),
               ventana_despedida.
valida(LFrase):- 
               pPersName(LFrase,[]), 
               send(@editor, insert ,' Mi nombre es R2D2 y soy un asistente inteligente especializado en temas sobre películas y series'),
               recibirConsulta.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%----> ORDENES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

valida(LFrase):- 
               orden_sing_pd(LFrase, R),
               makeToken(R, Token),
               recomendarPeliculaDirector(Token),
               recibirConsulta,!.
valida(LFrase):- 
               orden_sing_pd(LFrase, _R), 
               send(@editor, insert ,' Lo siento pero no encontré informacion de ello'), 
               recibirConsulta.
valida(LFrase):- 
               orden_sing_pa(LFrase, R),
               makeToken(R, Token),
               recomendarPeliculaActor(Token),
               recibirConsulta,!.
valida(LFrase):- 
               orden_sing_pa(LFrase, _R), 
               send(@editor, insert ,' Lo siento pero no encontré informacion de ello'), 
               recibirConsulta.
valida(LFrase):- 
               orden_plur_pd(LFrase, R),
               makeToken(R, Token),
               allMoviesDirector(Token),
               recibirConsulta,!.
valida(LFrase):- 
               orden_plur_pd(LFrase, _R), 
               send(@editor, insert ,' Lo siento pero no encontré informacion de ello'), 
               recibirConsulta.
valida(LFrase):- 
               orden_plur_pa(LFrase, R),
               makeToken(R, Token),
               allMoviesActor(Token),
               recibirConsulta,!.
valida(LFrase):- 
               orden_plur_pa(LFrase, _R), 
               send(@editor, insert ,' Lo siento pero no encontré informacion de ello'), 
               recibirConsulta.
valida(LFrase):- 
               orden_sing_pGen(LFrase, R),
               makeToken(R, Token),
               recomendarPeliculaGenero(Token),
               recibirConsulta,!.
valida(LFrase):- 
               orden_sing_pGen(LFrase, _R), 
               send(@editor, insert ,' Lo siento pero no encontré informacion de ello'), 
               recibirConsulta.
valida(LFrase):- 
               orden_plur_pGen(LFrase, R),
               makeToken(R, Token),
               allMoviesGenero(Token),
               recibirConsulta.
valida(LFrase):- 
               orden_plur_pGen(LFrase, _R), 
               send(@editor, insert ,' Lo siento pero no encontré informacion de ello'), 
               recibirConsulta.
valida(LFrase):- 
               orden_sing_sInf(LFrase, R),
               makeToken(R, Token),
               getInfoPelicula(Token),
               recibirConsulta.
valida(LFrase):- 
               orden_sing_sInf(LFrase, _R), 
               send(@editor, insert ,' Lo siento pero no encontré informacion de ello'), 
               recibirConsulta.
valida(LFrase):- 
               orden_sing_sSin(LFrase, R),
               makeToken(R, Token),
               getSinopsisPelicula(Token),
               recibirConsulta.
valida(LFrase):- 
               orden_sing_sSin(LFrase, _R), 
               send(@editor, insert ,' Lo siento pero no encontré informacion de ello'), 
               recibirConsulta.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%----> PELICULAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

valida(LFrase):- 
               pregGustoPeli(LFrase,NamePeli),
               elimina('?',NamePeli,Peli),
               makeToken(Peli,R),
               getNombresPeliculas(R),
               recibirConsulta.
valida(LFrase):- 
               pregGustoPeli(LFrase,NamePeli),
               elimina('?',NamePeli,Peli),
               makeToken(Peli,R),
               listaResNeg(L), random(Sol,L),
               makeToken(['\n',R,'? ',Sol],Respuesta),
               send(@editor, insert , Respuesta),
               recibirConsulta.
valida(LFrase):- 
               director_Peli(LFrase,NameDire),
               elimina('?',NameDire,Dire),
               makeToken(Dire,R),
               getDirectorPelicula(R),
               recibirConsulta.
valida(LFrase):- 
               director_Peli(LFrase,NameDire),
               send(@editor, insert , ' Lo siento pero no tengo esa informacion en estos momentos'),
               recibirConsulta.
valida(LFrase):- 
               actor_Peli(LFrase,NameActor), 
               elimina('?',NameActor,Actor), 
               makeToken(Actor,R), 
               getActorPelicula(R), 
               recibirConsulta.
valida(LFrase):- 
               actor_Peli(LFrase,NameActor), 
               send(@editor, insert , ' Lo siento pero no tengo esa informacion en estos momentos'), 
               recibirConsulta.
valida(LFrase):- 
               generoPelicula(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               getGeneroPelicula(R), 
               recibirConsulta.
valida(LFrase):- 
               generoPelicula(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               califPelicula(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               getRankingPelicula(R), 
               recibirConsulta.
valida(LFrase):- 
               califPelicula(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               estrenoPeli(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               getEstrenoPelicula(R), 
               recibirConsulta.
valida(LFrase):- 
               estrenoPeli(LFrase,Name),
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               repartoPeli(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               getRepartoPelicula(R), 
               recibirConsulta.
valida(LFrase):- 
               repartoPeli(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               guionistaPeli(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               getGuionistaPelicula(R), 
               recibirConsulta.
valida(LFrase):- 
               guionistaPeli(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               productoraPeli(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               getProductoraPelicula(R), 
               recibirConsulta.
valida(LFrase):- 
               productoraPeli(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               paisPelicula(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               getPaisPelicula(R), 
               recibirConsulta.
valida(LFrase):- 
               paisPelicula(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               premiosPelicula(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               getPremiosPelicula(R), 
               recibirConsulta.
valida(LFrase):- 
               premiosPelicula(LFrase,Name),
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               peliculasActor(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               allMoviesActorPrincipal(R), 
               recibirConsulta.
valida(LFrase):- 
               peliculasActor(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'),
               recibirConsulta.
valida(LFrase):- 
               peliculasDirector(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               allMoviesDirector(R), 
               recibirConsulta.
valida(LFrase):- 
               peliculasDirector(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'),
               recibirConsulta.
valida(LFrase):- 
               peliculasGuionista(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               allMoviesGuionista(R), 
               recibirConsulta.
valida(LFrase):- 
               peliculasGuionista(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'),
               recibirConsulta.
valida(LFrase):- 
               peliculasGenero(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               allMoviesGenero(R), 
               recibirConsulta.
valida(LFrase):- 
               peliculasGenero(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               mejorPeliDirector(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               mejorPeliculaDirector(R), 
               recibirConsulta.
valida(LFrase):- 
               mejorPeliDirector(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               mejorPeliActor(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               mejorPeliculaActor(R), 
               recibirConsulta.
valida(LFrase):- 
               mejorPeliActor(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               mejorPeliGenero(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               mejorPeliculaGenero(R), 
               recibirConsulta.
valida(LFrase):- 
               mejorPeliGenero(LFrase,Name),
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               mejorPeliEmpresa(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               mejorPeliculaProductora(R), 
               recibirConsulta.
valida(LFrase):- 
               mejorPeliEmpresa(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               premiosPelicula2(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               getPremiosPelicula(R), 
               recibirConsulta.
valida(LFrase):- 
               premiosPelicula2(LFrase,Name),
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               numPeliculasActor(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               numPelisActor(R), 
               recibirConsulta.
valida(LFrase):- 
               numPeliculasActor(LFrase,Name),
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               numPeliculasDirector(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               numPelisDirector(R), 
               recibirConsulta.
valida(LFrase):- 
               numPeliculasDirector(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%----> ACTORES, GUIONISTAS, DIRECTORES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

valida(LFrase):- 
               edadActor(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               getEdadActor(R), 
               recibirConsulta.
valida(LFrase):- 
               edadActor(LFrase,Name),  
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               nacimientoActor(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               getLugarNacActor(R), 
               recibirConsulta.
valida(LFrase):- 
               nacimientoActor(LFrase,Name),  
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               inicioCarreraActor(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               getIniCarreActor(R), 
               recibirConsulta.
valida(LFrase):- 
               inicioCarreraActor(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               premiosRecibidosActor(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               premiosActor(R), 
               recibirConsulta.
valida(LFrase):- 
               premiosRecibidosActor(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               edadDirector(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               getEdadDirector(R), 
               recibirConsulta.
valida(LFrase):- 
               edadDirector(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               nacimientoDirector(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               getLugarNacDirector(R), 
               recibirConsulta.
valida(LFrase):- 
               nacimientoDirector(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               inicioCarreraDirector(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               getIniCarreDirector(R), 
               recibirConsulta.
valida(LFrase):- 
               inicioCarreraDirector(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               premiosRecibidosDirector(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               premiosDirector(R), 
               recibirConsulta.
valida(LFrase):- 
               premiosRecibidosDirector(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.

valida(LFrase):- 
               nacimientoActor(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               getLugarNacActor(R), 
               recibirConsulta.
valida(LFrase):- 
               nacimientoActor(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               inicioCarreraActor(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               getIniCarreActor(R), 
               recibirConsulta.
valida(LFrase):- 
               inicioCarreraActor(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.
valida(LFrase):- 
               premiosRecibidosActor(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R), 
               premiosActor(R), 
               recibirConsulta.
valida(LFrase):- 
               premiosRecibidosActor(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la pelicula'), 
               recibirConsulta.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%----> SERIES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

valida(LFrase):- 
               pregGustoSeri(LFrase,NameSeri),
               elimina('?',NameSeri,Seri),
               makeToken(Seri,R),
               getNombresSeries(R),
               recibirConsulta.
valida(LFrase):- 
               pregGustoSeri(LFrase,NameSeri),
               elimina('?',NameSeri,Seri),
               makeToken(Seri,R),
               listaResNeg(L), random(Sol,L),
               makeToken(['\n',R,'? ',Sol],Respuesta),
               send(@editor, insert , Respuesta),
               recibirConsulta.

valida(LFrase):- 
               temporadaSeri(LFrase,NameSeri),
               elimina('?',NameSeri,Seri),
               makeToken(Seri,R),
               getNTemporadaslSerie(R),
               recibirConsulta.
valida(LFrase):- 
               temporadaSeri(LFrase,NameSeri),
               send(@editor, insert , ' Lo siento pero no tengo informacion acerca de lo que preguntas'),
               recibirConsulta.
                 
valida(LFrase):- 
               capitulosSeri(LFrase,NameSeri),
               elimina('?',NameSeri,Seri),
               makeToken(Seri,R),
               getNCapituloslSerie(R),
               recibirConsulta.
valida(LFrase):- 
               capitulosSeri(LFrase,NameSeri),
               send(@editor, insert , ' Lo siento pero no tengo informacion acerca de lo que preguntas'),
               recibirConsulta.
valida(LFrase):-
               director_Seri(LFrase,NameDire),
               elimina('?',NameDire,Dire), 
               makeToken(Dire,R), 
               getDirectorSerie(R), 
               recibirConsulta.
valida(LFrase):- 
               director_Seri(LFrase,NameDire), 
               send(@editor, insert , ' Lo siento pero no tengo esa informacion en estos momentos'), 
               recibirConsulta.
valida(LFrase):- 
               actor_Seri(LFrase,NameActor), 
               elimina('?',NameActor,Actor), 
               makeToken(Actor,R), 
               getActorPrincipalSerie(R), 
               recibirConsulta.
valida(LFrase):- 
               actor_Seri(LFrase,NameActor), 
               send(@editor, insert , ' Lo siento pero no tengo esa informacion en estos momentos'), 
               recibirConsulta.
valida(LFrase):- 
               generoSerie(LFrase,Name), 
               elimina('?',Name,Pelicula), 
               makeToken(Pelicula,R),
               getGeneroSerie(R), 
               recibirConsulta.
valida(LFrase):- 
               generoSerie(LFrase,Name), 
               send(@editor, insert , ' No te puedo brindar esa informacion de la serie'), 
               recibirConsulta.
valida(_ListPal):- send(@editor, insert , ' Lo siento pero no entendí, puedes repetir lo que dices...'),recibirConsulta.
inicio(Consulta):- makeToken(R,Consulta),valida(R).
:- crearVentana.