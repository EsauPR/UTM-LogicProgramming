/* Realiza y estándariza a munúsculas y sin acéntos la lectura de frases */
:-['read.pl'].
:- ['Consultas.pl'].

saludo 		--> ( ['hola!']; ['hi!']; ['hello!']; ['hola']; ['hi']; ['hello'] ), otros.
despedida 	--> ['adios']; ['bye']; ['nos vemos']; ['hasta luego'].
pPersonal 	--> ['¿'], pronombre, verbos, otros, ['?'].
verbos		-->	['eres']; ['eres'].
pronombre 	--> ['quien']; ['quienes']; ['que']; ['donde']; ['cuando']; ['como']; ['cual']; ['cuales']; ['cuanto']; ['cuantas'].
pronPers	--> ['yo']; ['tu']; ['el']; ['ella']; ['nosotros']; ['ustedes']; ['ellos']; ['ellas'].


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

v_orden		--> ['dame']; ['dime']; ['recomiendame']; ['muestrame']; ['enseñame'].
det 		--> ['el']; ['la']; ['las']; ['los'].
ind 		--> ['un']; ['una']; ['unos']; ['unas'].
art_pos 	--> ['de']; ['del'].

otros		--> [].
otros		--> [_X], otros.

makeToken(Lista, R):- atomic_list_concat(Lista,' ', R ).
random(Element, Lista):-random_member(Element,Lista).
procesa:- leer(Frase), nl, valida(Frase).

valida(LFrase):- saludo(LFrase,[]), write('Hola que tal!!'),procesa.
valida(LFrase):- despedida(LFrase,[]), write('Bye!!').
valida(LFrase):- pPersonal(LFrase,[]), write('Soy R2D2 un asistente inteligente especializado en temas sobre películas y series'),procesa.

valida(LFrase):- orden_sing_pd(LFrase, R), write('Una película del director '), makeToken(R, Token), write(Token), write(' es: '), procesa.
valida(LFrase):- orden_sing_pa(LFrase, R), write('Una película del actor '), makeToken(R, Token), write(Token), write(' es: '), procesa.
valida(LFrase):- orden_plur_pd(LFrase, R), write('Las películas del director '), makeToken(R, Token), write(Token), write(' son: '), procesa.
valida(LFrase):- orden_plur_pa(LFrase, R), write('Las películas del actor '), makeToken(R, Token), write(Token), write(' son: '), procesa.
valida(LFrase):- orden_sing_sd(LFrase, R), write('Una serie del director '), makeToken(R, Token), write(Token), write(' es: '), procesa.
valida(LFrase):- orden_sing_sa(LFrase, R), write('Una serie del actor '), makeToken(R, Token), write(Token), write(' es: '), procesa.
valida(LFrase):- orden_plur_sd(LFrase, R), write('Las series del director '), makeToken(R, Token), write(Token), write(' son: '), procesa.
valida(LFrase):- orden_plur_sa(LFrase, R), write('Las series del actor '), makeToken(R, Token), write(Token), write(' son: '), procesa.
valida(LFrase):- orden_sing_pGen(LFrase, R), write('Una película de '), makeToken(R, Token), write(Token), write(' es: '), procesa.
valida(LFrase):- orden_sing_sGen(LFrase, R), write('Una serie de '), makeToken(R, Token), write(Token), write(' es: '), procesa.
valida(LFrase):- orden_plur_pGen(LFrase, R), write('Las películas de '), makeToken(R, Token), write(Token), write(' son: '), procesa.
valida(LFrase):- orden_plur_sGen(LFrase, R), write('Las series de '), makeToken(R, Token), write(Token), write(' son: '), procesa.

valida(_ListPal):- write('Lo siento pero no entendí, puedes repetir lo que dices...'),procesa.

:- write('Hola Soy R2D2, puedes preguntarme cosas sobre peliculas y series...'),
		nl, procesa.


