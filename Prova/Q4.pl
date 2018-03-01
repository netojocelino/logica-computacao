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





a) defina um predicado irmao(X,Y) que é verdade se X e Y são irmãos.

irmao(X, Y) :- sexo(X, m), progenitor(N, X) , progenitor(N, Y).
irma(X, Y) :- sexo(X, f), progenitor(N, X) , progenitor(N, Y).

b) defina um predicado primo(X,Y) que é verdade se X e Y são primos.

primo(X, Y) :- sexo(X, m) , avo(N, X), avo(N, Y), progenitor(M, X), progenitor(P, Y), irmao(M, P) ; irma(M, P).

c) defina um predicado neto(X,Y) que é verdade se X é neto de Y.

neto(X, Y) :- sexo(X, m), progenitor(Y, N), progenitor(N, X).


d) defina um predicado descendente(X,Y) que é verdade se X é descendente de Y.

descendente(X, Y) :- progenitor(Y, X).


e) faça a árvore de busca (algoritmo da resolução) para cada um dos predicados que você criou.
Basta expandir até achar a segunda solução (se houver).



