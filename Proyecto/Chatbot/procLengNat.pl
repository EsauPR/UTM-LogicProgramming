/* 	#####################################
	#									#
	#		ChatBot de Peliculas		#
	#									#
	#####################################
	#									#
	#			Elaborado por:			#
	#									#
	#	López Bollo Jonathan			#
	#	Peralta Rosales Oscar Esaú		#
	#	Ventura Mijangos Geovanni		#
	#									#
	#####################################	*/

ans_soy:- write('soy R2D2 un asistente inteligente especializado en temas sobre películas y series').
ans_hola:- write('hola, ¿ en que puedo ayudarte ?').

pregunta --> [¿], pronombre, [?].
pregunta --> [¿], articulo_previo, pronombre, [?].
pregunta --> orden, articulo, sustantivo, art_pos, sustantivo2, sujeto.
pregunta --> orden, articulo, sustantivo, art_pos, sustantivo2.
pregunta --> orden, pronombre, sustantivo, art_pos.
pregunta --> definidas.
articulo_previo --> ['a']; ['en']; ['de']; ['con']; ['como']; ['para']; ['por']; ['sobre'].
pronombre --> ['quien']; ['quienes']; ['que']; ['donde']; ['cuando']; ['como']; ['cual']; ['cuales']; ['cuanto']; ['cuantas'].
orden --> ['dame']; ['dime']; ['recomiendame']; ['muestrame']; ['enseñame'].
articulo --> det.
articulo --> ind.
art_pos --> ['de']; ['del'].
det --> ['el']; ['la']; ['las']; ['los'].
ind --> ['un']; ['una']; ['unos']; ['unas'].
sustantivo --> ['pelicula']; ['serie']; ['peliculas']; ['series']; ['informacion'].
sustantivo2 --> ['director']; ['actor']; [_Genero].
sujeto --> [_Actor_Director].
definidas --> ['hola'], { nl, ans_hola, nl}.
definidas --> ['¿'], ['quien'], ['eres'] ,['?'] , { nl, ans_soy, nl}.
definidas --> ['¿'], ['que'], ['eres'] ,['?'] , { nl, ans_soy, nl}.



valida(ListPal):- pregunta(ListPal, []), !.
valida(_ListPal):- write('Lo siento pero no entendí...').

procesa:- read(Frase), atomic_list_concat(ListPal,' ', Frase), valida(ListPal), procesa.

inicio:- write('Ingresa una pregunta o una orden , los signos de interrogación deben estar separados de las palabras, no usses mayusculas ni asentos'),
		nl, procesa.