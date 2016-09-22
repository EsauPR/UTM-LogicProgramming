			%%%%%%%%%%%%%%%%%%%
			%%%% GRAMATICA %%%%
			%%%%%%%%%%%%%%%%%%%

saludo 		--> ( ['hola!']; ['hi!']; ['hello!']; ['hola']; ['hi']; ['hello'] ), otros.
despedida 	--> ['adios']; ['bye']; ['nos vemos']; ['hasta luego'].
pPersName 	--> ['¿'], pronombre, (verbos;pronPers), otros, ['?'].
pPersJob 	--> ['¿'],art_previo, pronombre, (verbos;pronPers;otros), otros, ['?'].
verbos		-->	['eres']; ['visto'];['es'];['gusta'].
pronombre 	--> ['quien']; ['quienes']; ['que']; ['donde']; ['cuando']; ['como']; ['cual']; ['cuales']; ['cuanto']; ['cuantas'].
pronPers	--> ['yo']; ['tu']; ['el'];['ella']; ['nosotros']; ['ustedes']; ['ellos']; ['ellas'];['te'];['has'].
orden_spa	--> v_orden, (det; ind), ['peliculas'], art_pos, ['actor'].
orden_spd	--> v_orden, (det; ind), ['peliculas'], art_pos, ['director'].
v_orden		--> ['dame']; ['dime']; ['recomiendame']; ['muestrame']; ['enseñame'].
art_previo 	--> ['a']; ['en']; ['de']; ['con']; ['como']; ['para']; ['por']; ['sobre'];otros.
articulo 	--> det.
articulo 	--> ind.
det 		--> ['el']; ['la']; ['las']; ['los'].
ind 		--> ['un']; ['una']; ['unos']; ['unas'].
art_pos 	--> ['de']; ['del'].
pelicula 	--> ['¿'], pronPers, verbos, articulo, ['pelicula'].
serie 		--> ['¿'], pronPers, verbos, articulo, ['serie'].
otros		--> [].
otros		--> [_X], otros.
procesa:- read(Frase), atomic_list_concat(ListPal,' ', Frase), valida(ListPal).
inicio:- ['Consultas.pl'],inicioconsulta,write('Ingresa una pregunta o una orden , los signos de interrogación deben estar separados de las palabras, no usses mayusculas ni asentos'),
		nl, procesa.
valida(LFrase)	:- saludo(LFrase,[]), write('Hola que tal, en que puedo ayudarte'),procesa.
valida(LFrase)	:- despedida(LFrase,[]), write('Bye, nos vemos pronto.').
valida(LFrase)	:- pPersName(LFrase,[]), write('Mi nombre es R2D2 y soy un asistente inteligente especializado en temas sobre películas y series'),procesa.
valida(LFrase)	:- pPersJob(LFrase,[]), write('soy un asistente inteligente especializado en temas sobre películas y series'),procesa.
valida(LFrase)	:- pelicula(LFrase,NamePeli),
					elimina('?',NamePeli,LNamePeli),
					atomic_list_concat(LNamePeli,' ',A),
					getNombresPeliculas(A),
					write(A+'Si'), procesa.
valida(LFrase)	:- serie(LFrase,NameSerie),
					elimina('?',NameSerie,LNameSerie),
					atomic_list_concat(LNameSerie,' ',A),
					getNombresSerie(A),
					write(A+'Si'), procesa.
elimina(X,[X|T],T).
elimina(X,[H|T],[H|T1]):- elimina(X,T,T1).
valida(_ListPal):- write('Lo siento pero no entendí, puedes repetir lo que dices :D...'),procesa.

