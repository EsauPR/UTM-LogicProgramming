% Autor: Ogarrio Cano Veronica
% Fecha: 24/10/2014

%Hechos
persona(maria).
persona(alfredo).
persona(tomas).
persona(susana).
persona(juan).
lee_libro(alfredo).
lee_libro(maria).
asiste_a_clases(alfredo).
asiste_a_clases(maria).
realiza_ejercicios(alfredo).
realiza_ejercicios(maria).
sabe_todo(tomas).
tutor(maria,juan).
tutor(juan,susana).


%reglas
aprueba_examen(X):-preparado_para_examen(X).
aprueba_examen(X):-persona(X),sabe_todo(X).
preparado_para_examen(X):-sabe_todo(X).
preparado_para_examen(X):-asiste_a_clases(X),realiza_ejercicios(X),lee_libro(X).
preparado_para_examen(X):-tutor(Y,X),preparado_para_examen(Y).