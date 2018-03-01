
progenitor(jose, A) :- A = joao ; A = ana.
progenitor(maria, A) :- A = joao ; A = ana.
progenitor(ana, A) :- A = helena ; A = joana.
progenitor(joao, mario).
progenitor(A, carlos) :- A = helena ; A = mario.

sexo(A, m) :- A = jose ; A = joao ; A = mario ; A = carlos.
sexo(A, f) :- A = ana ; A = maria ; A = helena ; A = joana.

irma(A, B) :- sexo(A, f), progenitor(N, A) , progenitor(N, B).
irmao(A, B) :- sexo(A, m), progenitor(N, A) , progenitor(N, B).

descendente(A, B) :- progenitor(B, A).

mae(A, B) :- sexo(A, f), progenitor(A, B).
pai(A, B) :- sexo(A, m), progenitor(A, B).

avo(A, B) :- sexo(A, m), progenitor(A, N), progenitor(N, B).

tio(A, B) :- sexo(A, m), descendente(A, N), avo(N, B).

primo(A, B) :- sexo(A, m) , avo(N, A), avo(N, B), progenitor(M, A), progenitor(P, B), irmao(M, P) ; irma(M, P).