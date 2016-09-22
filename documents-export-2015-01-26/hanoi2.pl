hanoi(1,X,Y,_,Movs) :-
    /*write('Move top disk from '),
    write(X),
    write(' to '),
    write(Y).*/
    Salto = nl,
    atomic_concat(' move ',X,Ax1),
    atomic_concat(Ax1,' to ',Ax2),
    atomic_concat(Ax2,Y,Ax3),
    atomic_concat(Ax3,Salto,Movs).
    
    
hanoi(N,X,Y,Z,Movs) :-
    N>1, 
    M is N-1, 
    hanoi(M,X,Z,Y,Movs1),
    hanoi(1,X,Y,_,Movs2),
    hanoi(M,Z,Y,X,Movs3),
    atomic_concat(Movs1,Movs2,Tmp),
    atomic_concat(Tmp,Movs3,Movs).
