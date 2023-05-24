%q1, q2 part
% DO NOT CHANGE THIS file. It will be modified, at least in part, and the tests rerun. 

%book( stock# , title, edition, year).   – stock # is a unique identfier
book( id1942, 'The C Programming Language', 1, 1978 ).
book( id2491, 'The C Programming Language', 2, 1988 ).
book( id9791, 'Pride and Prejudice'  ,1 , 1813 ).
book( id5312, 'The Wonderful Wizard of Oz', 1, 1900).
book( id6132, 'The Touchstone', 1, 1900).

%author( stock#, first_name, last_name).
author( id1942, brian , kernighan).
author( id1942, dennis, ritchie).
author( id9791, jane, austen).
author( id5312, frank, baum).
author( id6132, edith, wharton).

%in_stock(stock#, yes/no)
in_stock( id1942 , no ).
in_stock( id2491, yes).
in_stock( id9791, no).
in_stock( id5312, yes).
in_stock( id6132, no).

%q3 (representation question) does NOT go here, put it in you midterm.pl file.

%q6, q7
%Example tree, see image here: https://cse.sc.edu/~oreillyj/BinaryTreeExample.png 
node(a,b,c).
node(b,d,e).
node(c,f,nil).
node(d,nil,nil).
node(e,nil,g).
node(f,nil,nil).
node(g,nil,nil).



