%load the files
:-['midterm.pl','KB.pl'].

score:- write('>>>>>>>>>Begin Test<<<<<<<<<<<'),nl,
	scoreQ1(S1),write(' S1 = '),write(S1),nl,
    scoreQ2(S2),write(' S2 = '),write(S2),nl,
    scoreQ3(S3),write(' S3 = '),write(S3),nl,
    scoreQ4(S4),write(' S4 = '),write(S4),nl,
    scoreQ5(S5),write(' S5 = '),write(S5),nl,
    write('Yes, I\'ll do partial credit but it\'s not hard.'),nl,
    scoreQ6(S6),write(' S6 = '),write(S6),nl,
    scoreQ7(S7),write(' S7 = '),write(S7),nl,
    scoreQ8(S8),write(' S8 = '),write(S8),nl,
    S is S1+S2+S3+S4+S5+S6+S7+S8,
    write('Your Score is ... '),nl,
    write(S).

scoreQ1(SQ1):- findall([T],q1(T),Ts),
    TrueTs = [['The Wonderful Wizard of Oz']],
    sort(Ts,STs),
    ( (TrueTs = STs, SQ1 is 20) ; (\+ TrueTs = STs, SQ1 is 0)).

scoreQ2(SQ2):- findall([T],q2(T),Ts),
    TrueTs = [['Pride and Prejudice']],
    sort(Ts,STs),
    ( (TrueTs = STs, SQ2 is 30) ; (\+ TrueTs = STs, SQ2 is 0)).

scoreQ3(SQ3):- findall([EA,EB],before(EA,EB),Befores),
    TrueBefores = [['Battle of Leyte Gulf','D-Day'],
        ['Battle of Leyte Gulf','Economic Opportunity Act'],
        ['Battle of Leyte Gulf','Gulf of Tonkin Incident'],
        ['D-Day','Economic Opportunity Act'],
        ['D-Day','Gulf of Tonkin Incident'],
        ['Gulf of Tonkin Incident','Economic Opportunity Act'],
        ['Signing of Articles of Confederation','Battle of Leyte Gulf'],
        ['Signing of Articles of Confederation','D-Day'],
        ['Signing of Articles of Confederation','Economic Opportunity Act'],
        ['Signing of Articles of Confederation','Gulf of Tonkin Incident']] ,
    sort(Befores,SBefores),
    ( (TrueBefores = SBefores, SQ3 is 40) ; (\+ TrueBefores = SBefores, SQ3 is 0)).

scoreQ4(SQ4):-findall([A,B,C],between(A,B,C),ABCs), sort(ABCs,SABCs),
    TrueABCs = [['Battle of Leyte Gulf','D-Day','Economic Opportunity Act'],
    ['Battle of Leyte Gulf','D-Day','Gulf of Tonkin Incident'],
    ['Battle of Leyte Gulf','Gulf of Tonkin Incident','Economic Opportunity Act'],
    ['D-Day','Battle of Leyte Gulf','Signing of Articles of Confederation'],
    ['D-Day','Gulf of Tonkin Incident','Economic Opportunity Act'],
    ['Economic Opportunity Act','Battle of Leyte Gulf','Signing of Articles of Confederation'],
    ['Economic Opportunity Act','D-Day','Battle of Leyte Gulf'],
    ['Economic Opportunity Act','D-Day','Signing of Articles of Confederation'],
    ['Economic Opportunity Act','Gulf of Tonkin Incident','Battle of Leyte Gulf'],
    ['Economic Opportunity Act','Gulf of Tonkin Incident','D-Day'],
    ['Economic Opportunity Act','Gulf of Tonkin Incident','Signing of Articles of Confederation'],
    ['Gulf of Tonkin Incident','Battle of Leyte Gulf','Signing of Articles of Confederation'],
    ['Gulf of Tonkin Incident','D-Day','Battle of Leyte Gulf'],
    ['Gulf of Tonkin Incident','D-Day','Signing of Articles of Confederation'],
    ['Signing of Articles of Confederation','Battle of Leyte Gulf','D-Day'],
    ['Signing of Articles of Confederation','Battle of Leyte Gulf','Economic Opportunity Act'],
    ['Signing of Articles of Confederation','Battle of Leyte Gulf','Gulf of Tonkin Incident'],
    ['Signing of Articles of Confederation','D-Day','Economic Opportunity Act'],
    ['Signing of Articles of Confederation','D-Day','Gulf of Tonkin Incident'],
    ['Signing of Articles of Confederation','Gulf of Tonkin Incident','Economic Opportunity Act']],
    ( (TrueABCs = SABCs, SQ4 is 60) ; (\+ TrueABCs = SABCs, SQ4 is 0)).

scoreQ5(SQ5):- 
    findall([S00, S10, S20, S30, S01, S11, S21, S31, S02, S12, S22, S32, S03, S13, S23, S33],solution(S00, S10, S20, S30, S01, S11, S21, S31, S02, S12, S22, S32, S03, S13, S23, S33),Solns),
    sort(Solns,SSolns),length(SSolns,Len),
    ( (Len =:= 35964, SQ5 is 75) ; ( \+Len = 35964, SQ5 is 0) ).

scoreQ6(SQ6):-findall([R],root(R),Rs),
    TrueRs = [[a]],
    sort(Rs,SRs),
    ( (TrueRs = SRs, SQ6 is 20) ; (\+ TrueRs = SRs, SQ6 is 0)).

scoreQ7(SQ6):-findall([P,Cs],children(P,Cs),PCs),
    TruePCs = [[a,[b,c]],[b,[d,e]],[c,[f]],[d,[]],[e,[g]],[f,[]],[g,[]]],
    sort(PCs,SPCs),
    ( (TruePCs = SPCs, SQ6 is 55) ; (\+ TruePCs = SPCs, SQ6 is 0)).

scoreQ8(SQ8):-
    (\+ hasDuplicates([1,2,3,4,5,6]),
    \+ hasDuplicates([1,2,5,6]),
    \+ hasDuplicates([a,b,c,d,e,f]),
    hasDuplicates([1,1,2,3,4,5,6]),
    hasDuplicates([1,6,2,5,6]),
    hasDuplicates([a,b,c,d,e,a,f]),SQ8=50);
    (hasDuplicates([1,2,3,4,5,6]),
    hasDuplicates([1,2,5,6]),
    hasDuplicates([a,b,c,d,e,f]),
    \+ hasDuplicates([1,1,2,3,4,5,6]),
    \+ hasDuplicates([1,6,2,5,6]),
    \+ hasDuplicates([a,b,c,d,e,a,f]),SQ8=0).

:-score.