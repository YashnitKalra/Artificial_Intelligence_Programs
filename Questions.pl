/* is for assignment, = for comparision */

/* Question 1 */
sum(X,Y,R):-R is X+Y.

/* Question 2 */
max(X,Y,M):-X>=Y,M is X.
max(X,Y,M):-Y>X,M is Y.
max2(X,Y,M):-X>Y->M is X;M is Y.

/* Question 3 */
fac(N,R):-N=0->R is 1;X1 is N-1,fac(X1,R1),R is N*R1.

/* Question 4 */
fib(N,R):-(N=1->
    R is 1;
    (N=2->
        R is 1;
        X1 is N-1, X2 is N-2, fib(X1,R1),fib(X2,R2),R is R1+R2
    )
).

/* Question 5 */
gcd(N1,N2,R):-
(N1=0->
    R is N2;
    (N2=0->
        R is N1;
        (N1=N2->
            R is N1;
            (N1>N2->
                X1 is N1-N2,gcd(X1,N2,R1),R is R1;
                X1 is N2-N1,gcd(N1,X1,R1),R is R1 
            )
        )
    )
).

/* Question 6 */
pow(N,P,A):-
(P=0->
    A is 1;
    X1 is P-1,pow(N,X1,A1),A is N*A1
).

/* Question 7 */
multi(N1,N2,R):-
(N2=0->
    R is 0;
    X is N2-1,multi(N1,X,R1),R is N1+R1
).

/* Question 8 */
towerofhanoi(N):-towerofhanoi(N,1,2,3),pow(2,N,R1),R is R1-1,write("\nNumber of Moves: "),write(R).
towerofhanoi(N,R1,R2,R3):-
(
    N=1->
        write('\nMove Disk 1 from Tower '),write(R1),write(" to Tower "),write(R2);
        (
            N1 is N-1,
            towerofhanoi(N1,R1,R3,R2),
            write('\nMove Disk '),write(N),write(' from Tower '),write(R1),write(" to Tower "),write(R2),
            towerofhanoi(N1,R3,R2,R1)
        )
).

/* Question 9 */
edge(p,q).
edge(q,r).
edge(r,q).
edge(q,s).
edge(s,t).
path(S,D):-
(
    S=D->print("Yes");
    (
        edge(S,R1)->path(R1,D);
        print("No")
    )
).

/* 
    LIST - []
    [L] - [1,2,3] 
    [H|T] - H=1; T=2,3
    [H|_] - if tail not needed 
*/

/* Question 10 */
memb(X,[H|T]):-
(
    X=H->true;
    memb(X,T)
).

/* Length of List */
len([],0).
len([_|T],R):-len(T,R1),R is R1+1.

/* Question 11 */
concat([],L,L).
concat(L,[],L).
concat([H|T],L2,[H|R]):-concat(T,L2,R).

/* Question 12 */
rev(L,R):-rev(L,[],R).
rev([],L,L).
rev([H|T],L,R):-rev(T,[H|L],R).

/* Question 13 */
palin(L):-rev(L,R),palin(L,R).
palin([],[]):-print("Yes").
palin([H|T],[X|Y]):-
(
    H=X->
        palin(T,Y);
        print("No")
).

/* Question 14 */
sum([],0).
sum([H|T],S):-sum(T,S1),S is S1+H.

/* Question 15 */
evenLength(L):-len(L,R),P is (R mod 2),P=0->print("YES");print("NO").
oddLength(L):-len(L,R),P is (R mod 2),P=1->print("YES");print("NO").

/* Question 16 */
nth_element(1,[H|_],H).
nth_element(_,[],"Not Exist").
nth_element(N,[_|T],X):-N1 is N-1,nth_element(N1,T,X).

/* Question 17 */
remove_dup([],[]).
remove_dup([H|T],[H|R]):-delete_all(H,T,R1),remove_dup(R1,R).

/* Question 18 */
maxList([H|[]],H).
maxList([H|T],M):-maxList(T,M1),H<M1->M is M1;M is H.

/* Question 19 */
insert_nth(I,N,L,R):-insert_nth(I,1,N,L,R).
insert_nth(I,N,N,L,[I|L]).
insert_nth(I,A,N,[H|T],[H|R]):-A1 is A+1,insert_nth(I,A1,N,T,R).

/* Question 20 */
sublist([],_).
sublist(_,[]):-false.
sublist([S|T1],[L|T2]):-
(
    S=L->
        sublist(T1,T2);
        sublist([S|T1],T2)
).

/* Question 21 */
delete_nth(N,L,R):-delete_nth(1,N,L,R).
delete_nth(N,N,[_|T],T).
delete_nth(A,N,[H|T],[H|R]):-A1 is A+1,delete_nth(A1,N,T,R).

/* Question 22 */
delete_all(_,[],[]).
delete_all(X,[X|T],R):-delete_all(X,T,R).
delete_all(X,[H|T],[H|R]):-X=H->false;delete_all(X,T,R).

/* Question 23 */
merge([],L,L).
merge(L,[],L).
merge([H1|T1],[H2|T2],[X|R]):-
(
    H1<H2->
        X is H1,merge(T1,[H2|T2],R);
        X is H2,merge([H1|T1],T2,R)    
).