
% set(setA,[a,w,y,z]).
% set(setB,[b,x,w,z]).
% set(setC,[c,x,y,z]).

% intersection(A,B,M):- set(A,MAs),set(B,MBs),member(M,MAs),member(M,MBs).

set(setA). set(setB). set(setC).

mem(a,setA).
mem(b,setB).
mem(c,setC).
mem(w,setA).
mem(w,setB).
mem(y,setA).
mem(y,setC).
mem(x,setB).
mem(x,setC).
mem(z,setA).
mem(z,setB).
mem(z,setC).

intersection(A,B,M):- mem(M,A),mem(M,B).

% disj_union(A,B,M) :-set(A),set(B),mem(M,A), \+ mem(M,B).
% disj_union(A,B,M) :-set(A),set(B),mem(M,B), \+ mem(M,A).

disj_union(A,B,M):- mem(M,A), set(B), \+ intersection(A,B,M).
disj_union(A,B,M):- mem(M,B), set(A), \+ intersection(A,B,M).

color(red). color(blue). color(green). color(yellow). 

cube_color(Front,Back,Top,Bottom,Left,Right):-
    color(Front),color(Top), \+ Front = Top,
    color(Left), \+ Left = Front, \+ Left = Top,
    Right=Left,Back=Front, Bottom=Top.

between(List,B,X,Y):- append(L,[B|R] ,List),member(X,L),member(Y,R). 
between(List,B,Y,X):- append(L,[B|R] ,List),member(X,L),member(Y,R).