%book( stock# , title, edition, year).   – stock # is a unique identfier
book( id1942, 'The C Programming Language', 1, 1978 ).
book( id2491, 'The C Programming Language', 2, 1988 ).
book( id9791, 'Pride and Prejudice'  ,1 , 1813 ).
book( id4321, 'Year 1899 in Review', 1, 1900).
%... [remember, “…” means “many more like this”]

%author( stock#, fname, lname).
author( id1942, brian , kernighan).
author( id1942, dennis, ritchie).
author( id9791, jane, austen).
author( id4321, joe, bloe ).
%...

%in_stock(stock#, yes/no)
in_stock( id1942 , no ).
in_stock( id2491, yes).
in_stock( id9791, no).
in_stock( id4321, no).
%...

q1a(T):- book( id9791, T, _, _).
q1b(ID,Title) :- book(ID,Title, _,1900),in_stock(ID,yes).
q1c( Title):- book(_,Title,Ed,Year1),book(_,Title,Ed,Year2), \+Year1=Year2.

event('First Continental Congress', [ 9,5, 1774] ).
event('Signing of Articles of Confederation', [11,15,1777]).
event('Gulf of Tonkin Incident', [8,2,1964]).

before(EventA,EventB):-
    event(EventA,[MA,DA,YA]),event(EventB,[MB,DB,YB]),
        (YA<YB ; (YA=YB,MA<MB) ; (YA=YB,MA=MB,DA<DB) ).

event2('First Continental Congress', 17740905  ).
event2('Signing of Articles of Confederation', 17771115).
event2('Gulf of Tonkin Incident', 19640802).

before2(EventA,EventB):-
    event2(EventA,DateA),event2(EventB,DateB),DateA<DateB.

between(A,B,C):-before(A,B),before(B,C).
between(C,B,A):-before(A,B),before(B,C).
