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

viagem(X,Y) :- carro(X,Y).
viagem(X,Y) :- trem(X,Y).
viagem(X,Y) :- aviao(X,Y).
viagem(X,Y) :- viagem(X,Z), viagem(Z,Y).