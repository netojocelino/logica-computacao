carro(saoPaulo,campinas).
carro(campinas,paulinea).
carro(valmont,saarbruecken).
carro(valmont,metz).
trem(metz,frankfurt).
trem(saarbruecken,frankfurt).
trem(metz,paris).
trem(saarbruecken,paris).
aviao(frankfurt,bangkok).
aviao(frankfurt,singapura).
aviao(paris,losAngeles).
aviao(bangkok,saoPaulo).
aviao(singapura,saoPaulo).
aviao(losAngeles,saoPaulo).


vai(X,Y) :- carro(X,Y).
vai(X,Y) :- trem(X,Y).
vai(X,Y) :- aviao(X,Y).
vai(X,Y) :- viagem(X,Z), viagem(Z,Y).

vai(X,Y,vai(X,Y)) :- carro(X,Y).
vai(X,Y,vai(X,Y)) :- trem(X,Y).
vai(X,Y,vai(X,Y)) :- aviao(X,Y).
vai(X,Y,vai(X,W,Z)) :- vai(X,W,vai(X,W)), vai(W,Y,Z).

viagem(X,Y,vai(X,Y,carro)) :- carro(X,Y).
viagem(X,Y,vai(X,Y,trem)) :- trem(X,Y).
viagem(X,Y,vai(X,Y,aviao)) :- aviao(X,Y).
viagem(X,Y,vai(X,Z,V,W)) :- viagem(X,Z,vai(X,Z,V)), viagem(Z,Y,W).
