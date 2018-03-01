pai(a,b).
pai(a,c).
pai(b,d).
pai(b,e).
pai(c,f).

sexo(A, m) :- A = a ; A = b ; A = d.
sexo(A, f) :- A = c ; A = e ; A = f.

progenitor(a, A) :- A = b ; A = c.
progenitor(e, A) :- A = b ; A = c.
progenitor(c, A) :- A = f ; A = e.
progenitor(b, d).
progenitor(A, c) :- A = d ; A = f.


avo(X, Y) :- sexo(X, m), progenitor(X, N), progenitor(N, Y).
mae(X, Y) :- sexo(X, f), progenitor(X, Y).
pai(X, Y) :- sexo(X, m), progenitor(X, Y).
tio(X, Y) :- sexo(X, m), descendente(X, N), avo(N, Y).





a) defina um predicado irmao(X,Y) que � verdade se X e Y s�o irm�os.

irmao(X, Y) :- sexo(X, m), progenitor(N, X) , progenitor(N, Y).
irma(X, Y) :- sexo(X, f), progenitor(N, X) , progenitor(N, Y).

b) defina um predicado primo(X,Y) que � verdade se X e Y s�o primos.

primo(X, Y) :- sexo(X, m) , avo(N, X), avo(N, Y), progenitor(M, X), progenitor(P, Y), irmao(M, P) ; irma(M, P).

c) defina um predicado neto(X,Y) que � verdade se X � neto de Y.

neto(X, Y) :- sexo(X, m), progenitor(Y, N), progenitor(N, X).


d) defina um predicado descendente(X,Y) que � verdade se X � descendente de Y.

descendente(X, Y) :- progenitor(Y, X).


e) fa�a a �rvore de busca (algoritmo da resolu��o) para cada um dos predicados que voc� criou.
Basta expandir at� achar a segunda solu��o (se houver).



