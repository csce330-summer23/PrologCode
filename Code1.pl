% basic comparisons : < , > , >= , =< , =:= (negate last)

strictlyIncreasing(A,B,C):- A<B, B<C.

nonDecreasing(A,B,C) :- A =< B, B=<C.

% Y is 2, X is Y, \+ X =:= Y.



% try 30/4 , note floating point returned

%other ops available
%div(), also //, integer div., %mod
% note, basically a return (unusual)

% is vs =:= ( left hand of is can be unset for unificaiton)

quotient_remainder(X,Y,Q,R) :- 
    Q is div(X,Y),
    R is mod(X,Y).

quotient_remainder2(X,Y,Q,R) :- 
    Q is X//Y,
    R is mod(X,Y).

%square function?
square(B,S) :- S is B*B. 

square2(B,S):- S is B^2.

%sqrt(N). Kind of pointless
square_root(S,SR) :- SR is sqrt(S).

%factorial
factorial(0,1).
factorial(N,NF):-N>0,Nm1 is N-1, factorial(Nm1,FNm1), NF is N*FNm1.


%so, what's power of a pow(A,P,A_to_the_P) ?
%yes ^ works in Prolog, but this is recursive...
pow(_,0,1).
pow(B,P,B2P):-
    P>0, Pm1 is P-1, pow(B,Pm1,B2Pm1), B2P is B*B2Pm1.
pow(B,P,B2P):-P<0,PosP is -1*P, 
    pow(B,PosP,B2PosP), B2P is 1/B2PosP. 

%define with power(A,0,1) ?

%so, what's blocks world?

%loc(b1,x,y) screen-coordinate order
loc(b1,0,2).
loc(b2,0,3).
loc(b3,1,0).
loc(b4,1,1).
loc(b5,1,2).
loc(b6,1,3).
loc(b7,2,3).

%generator for blocks?
block(B):-loc(B,_,_).

on(Bt,Bb):-loc(Bt,X,Yt),loc(Bb,X,Yb),Yt is Yb-1.

above(Bt,Bb):-loc(Bt,X,Yt),loc(Bb,X,Yb),Yt <Yb.

below(Bb,Bt):-above(Bt,Bb).

left(Bl,Br) :-loc(Bl,Xl,_),loc(Br,Xr,_),Xl<Xr.


%really important - Lists!

%note these examples:
% head_tail([1,2,3,4,5,6], H,T). , H is not list (in general), T is list
% head_tail([1], H,T). , T is empty list
% head_tail([], H,T). ,FAILS, H _must_ match at item and there's no
%     items...
head_tail( [H|T],H,T).

%real predicate is length/2
len([],0).
len([_|T],Len):-len(T,LenT),Len is LenT +1.



%sum items in a list
sum([],0).
sum([N|Ns] , Sum ):-sum(Ns,SumNs), Sum is N+SumNs.



%adjacent equals?
adj_equals([H,H|_]).
adj_equals( [_|T]):- adj_equals(T).



%class is_sorted (non-decreasing) order, multiple base cases
is_sorted( [] ).
is_sorted( [_]).
is_sorted( [X,Y|T] ):- X =< Y, is_sorted([Y|T]).

%elem (real: member) -- test with M both set and unset
elem( H, [H|_]).
elem( X, [_|T] ) :- elem(X,T).

%concat (real, append)
%append([1,2,3], [4,5,6],C).
%append(A,B,[1,2,3,4,5,6]).
concat([], L, L).
concat([H|T], L, [H|TL]):- concat(T,L,TL).

elem2(M,L):- append(_,[M|_],L).

%real predicate is reverse
rev([],[]).
rev( [H|T],RTH):-rev(T,RT),append(RT,[H],RTH).



% rev2 (library, example of accumulator pattern, also define helper rule
% (always okay)


%subset -- multiple cases
% subset([],_).
% subset([H|T],Set):-member(H,Set), \+member(H,T),subset(T,Set).

subset([],[]).
subset(Sub,[_|T]):-subset(Sub,T).
subset( [H|SubT] , [H|T]):-subset(SubT,T).

%permutation
perm([],[]).
perm([H|T], P):- perm(T,PT),append(A,B,PT),append(A,[H|B],P).

%for instantiated/non-variable sets
subset2(Sub, Set):- \+ (member(M,Sub), \+ member(M,Set) ).

%disjoint
disjoint([],_).
disjoint( [H|T], S):- \+member(H,S),disjoint(T,S).

%disjoint2 using member, NO RECURSION (explicitly)
disjoint2(S1,S2):- \+ (member(M,S1),member(M,S2) ).

%intersects
intersects(S1,S2):-member(M,S1),member(M,S2).


%max rule
max(X,Y,X):-X>Y.
max(X,Y,Y):-X =< Y.

%max of LIST
%maxL(L,Max)
maxL([X],X).
maxL([H|T], Max):-maxL(T,TMax),max(H,TMax,Max).

%list_evil

%call following line:
% set_prolog_flag(answer_write_options,[max_depth(0)]).

%bogosort
bogosort(L,SL):-perm(L,SL),is_sorted(SL).


%take
take(0,_,[]).
take(N,[H|T], [H|TakeT] ):- 
    N>0, Nm1 is N-1, 
    take(Nm1,T,TakeT).

%drop
drop(0,L,L).
drop(N,[],[]):-N>0.
drop(N,[_|T], DropT):-
    N>0, Nm1 is N-1,
    drop(Nm1,T,DropT).



% split less efficient with take and drop
split(0,L,[],L).
split(N,[H|T],[H|LeftT], Right):-
    N>0, Nm1 is N-1,
    split(Nm1,T,LeftT,Right).


% more efficient version (take, in particular, computes and then
% discards the drop answer).

%note use of helper predicate, below
%split



%merge_lists
merge([], L,L).
merge(L,[], L).
merge([G|S],[H|T],[G|Rest] ):-G=<H, merge(S,[H|T],Rest).
merge([G|S],[H|T],[H|Rest] ):- G>H, merge([G|S],T,Rest).


%what happens if I do <, >= (sort NOT stable - 350)
merge_sort([],[]).
merge_sort([X],[X]).
merge_sort(L,SL):-
    length(L,Len), Len>=2, Half is Len//2, split(Half,L,Left,Right),
    merge_sort(Left,SLeft), merge_sort(Right,SRight),
    merge(SLeft,SRight,SL).
