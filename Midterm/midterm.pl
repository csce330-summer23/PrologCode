
%see KB.pl for the representation
% Query for "what books are in stock and published in the year 1900?" Give the title.
q1(Title):-fail.

% Query for "is there any book where the same edition was published in multiple years?" Give the Title.
q2(Title):-fail.

%Representation Question
%	Describe how to represent a list of historic events such as the following. The part before the colon, ‘:’ is the “Event”. 
%	> 'First Continental Congress': September 5, 1774
%	> 'Signing of Articles of Confederation': November 15, 1777
%	> […]
%   > 'D-Day': June 6, 1944
%	> 'Gulf of Tonkin Incident': August 2, 1964 

%put your representation here:

% q3 Define a rule, before(EventA,EventB) that succeeds if EventA occurred before Event B chronologically 
% (assume events on the same day occur simultaneously, not before).
% You may assume that EventA and EventB, are the names, e.g. 'Gulf of Tonkin Incident', with the single quotes (obviously...).

before(EventA,EventB):-fail.

%q4: Define a rule for between(A,B,C), such that event B happens between events A and C. 
% You cannot assume A happened before C. 
% You should probably define before/2 first.  

between(A,B,C):-fail. 

% q5 A general constraint problem
% give code to generate maps _like_ the following: https://cse.sc.edu/~oreillyj/4x4HexExample.png
% a.	The top and bottom rows of hexagons should be sea tiles. 
% b.	The middle eight hexagons can be anything but sea.
% c.	No two towns can be adjacent. This is the only "regular" map-coloring constraint.
% d.	Adjacency is when two hexagons share a side.
% e.	Consider a helper function (annoying without it).

tile(town). tile(sea). tile(mountain). tile (forest). tile(desert).

% looking at map, the first 4 Variables ( S00, S10, S20, S30 ) are the top four sea tiles.
solution(S00, S10, S20, S30, S01, S11, S21, S31, S02, S12, S22, S32, S03, S13, S23, S33):- 
    S00=sea,S10=sea,S20=sea,S30=sea,S03=sea,S13=sea,S23=sea,S33=sea,
    notBothTowns(S02,S01),notBothTowns(S02,S12),notBothTowns(S01,S12),notBothTowns(S01,S11),
    notBothTowns(S12,S11),notBothTowns(S12,S22),notBothTowns(S11,S21),notBothTowns(S11,S22),
    notBothTowns(S22,S21),notBothTowns(S22,S32),notBothTowns(S21,S31),notBothTowns(S21,S32),
    notBothTowns(S32,S31).

notSea(H):- tile(H), \+H=sea.

notBothTowns(H1,H2):- notSea(H1),notSea(H2), \+ (H2=town,H1=town).

%EXAMPLE tree in KB.pl, see image here: https://cse.sc.edu/~oreillyj/BinaryTreeExample.png


% q6: Define a root(R) rule, where R is the root of the tree. You may assume the tree is correctly constructed as above. 
% Do not set to a.
root(R):-node(R,_,_), \+ node(_,R,_) , \+ node(_,_,R). 

children(P,[]):-node(P,nil,nil).
children(P,[L]):-node(P,L,nil), \+ nil = L.
children(P,[R]):-node(P,nil,R), \+ nil = R.
children(P,[L,R]):-node(P,L,R), \+ nil =L, \+ nil = R.




% q7: Define a leaves(Node,Leaves) rule that returns all the children, not descendants, of node Node as a list Leaves. 
% nil should not be a member of the list (-50% if so).
% the order of the leaves, left to right, should be preserved.
leaves(Node,Leaves):-fail.

% q8: Write a hasDuplicates(List) rule that returns true if a list has duplicate items 
% (you don’t need explicit recursion, actually). 
% hasDuplicates([H|T]):- member(H,T).
% hasDuplicates([_|T]):-hasDuplicates(T).
hasDuplicates(List):-append(A,B,List), member(M,A), member(M,B).

