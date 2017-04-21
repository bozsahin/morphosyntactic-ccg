% english lexicon for the plural morpheme

[s,es] := 
	@ a phon("s","-PLU") -- 
	(~ n_num) $ n([_,_,pl,_,_,_]) 
        \ (~ n_base) $ n([_,_,sg,_,_,_]) : X^plu`X .

[green] :=
        @ s phon("green", "green") --
         (~ n_num) $ n([I,C,N,P,G,R])
         / (~ n_num) $ n([I,C,N,P,G,R]) : X^green`X .
[four] :=
        @ s phon("four", "four") --
         (~ n_num) $ n([I,C,N,P,G,R])
         / (# n_num) $ n([I,C,N,P,G,R]) : X^four`X .
[toy] :=
        @ s phon("toy", "toy") --
         (~ n_base) $ n([I,C,N,P,G,R])
         / (~ n_base) $ n([I,C,N,P,G,R]) : X^toy`X .

[gun] := @ s phon("gun","gun") -- (~ n_base) $ n([_,_,sg,3,_,_]) : gun.
[box] := @ s phon("box","box") -- (~ n_base) $ n([_,_,sg,3,_,_]) : box.
[boy] := @ s phon("boy","boy") -- (~ n_base) $ n([_,_,sg,3,_,_]) : boy.

lex_rules.  % need this even if you don't have any lex rules
