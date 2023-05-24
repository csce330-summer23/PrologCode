%permutation
perm([],[]).
perm([H|T], P):- perm(T,PT),append(A,B,PT),append(A,[H|B],P).


range(N, Range):-range_helper(1,N,Range).

range_helper(N,N, [N] ).
range_helper(M,N,[M|Rest]):- M<N, Mp1 is M+1, range_helper(Mp1,N,Rest).

zip( [], [] , []).
zip( [_|_], [] , []).
zip([], [_|_] , []).
zip( [G|S], [H|T], [ [G,H]| ZipST] ):- zip(S,T,ZipST). 

nQueens(N,RCs):-
    range(N,Rows),
    range(N,Cols),
    perm(Cols,PCols),
    zip(Rows,PCols,RCs),
    no_attack(RCs).

nQueens2(N,RCs):-
    range(N,Rows),
    range(N,Cols),
    nQ2Helper(Rows,Cols,[],RevRCs),
    reverse(RevRCs,RCs).


nQ2Helper([], [], PQs, PQs).
nQ2Helper([R|Rs],Cols,PlacedQs, RCs):-
    remove(C,Cols,RemCols),
    NewQ=[R,C],
    no_attack(NewQ,PlacedQs),
    nQ2Helper(Rs,RemCols, [NewQ|PlacedQs],RCs).

%DO BETTER
no_attack(_, []).
no_attack(NewQ,[Q|Qs] ):-
    \+ attack(NewQ, Q),
    no_attack(NewQ,Qs). 

no_attack([]).
no_attack( [P|Ps] ):-
    \+ (member(Q,Ps),attack(P,Q)),
    no_attack(Ps).

attack( [X1,Y1],[X2,Y2]) :-Y1-X1 =:= Y2-X2.
attack( [X1,Y1],[X2,Y2]) :-Y1+X1 =:= Y2+X2.

remove(X,L,LmX):-append(A,[X|B],L), append(A,B,LmX).