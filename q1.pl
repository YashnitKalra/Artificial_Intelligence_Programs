parent(sohan, ram).
parent(sohan, gita).
parent(ram, shyam).
parent(gita, balram).
female(gita).
male(sohan).
male(ram).
male(shyam).
son(X,Y):-male(X),parent(Y,X).
daughter(X,Y):-female(X),parent(Y,X).
mother(X,Y):-female(X),parent(X,Y).
father(X,Y):-male(X),parent(X,Y).
grandparent(X,Z):-parent(Y,Z),parent(X,Y).
sibling(X,Y):-parent(Z,X),parent(Z,Y).
uncle(X,Y):-male(X),sibling(X,Z),parent(Z,Y).
aunt(X,Y):-female(X),sibling(X,Z),parent(Z,Y).