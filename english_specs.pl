%%%%%%%%%%%%%%%%
%%% english_specs.pl: language-specific CCG stuff
%%% ------------      (type constraints, lattice, macros, phon constraints) 
%%%%%%%%%%%%%%%%
 
% Type constraints on CCG rules (for English):  none
%

type_constraint(Cat):-
	onto(Cat,(~top) $ s).
type_constraint(Cat):-
	onto(Cat,(~top) $ st).
type_constraint(Cat):-
	onto(Cat,(~top) $ n).
type_constraint(Cat):-
	onto(Cat,(~top) $ np).

%
% type lattice for English
% -----
% type system (must be a lattice, i.e., every a,b must have
% a unique join and meet). 'top' is the universal upper bound.
% 'bottom' is the universal lower bound. For type-checks, it's sufficient
% to be a join-semilattice.
%
 
subtype(top,free).
 
subtype(free,n_num).   % nouns
substype(n_num,n_base).
substype(n_base,bottom).
 
subtype(free,s_tense).   % verbs
subtype(s_tense,s_base).
subtype(s_base,bottom).

morphophonemic_constraints(ProcessType,SF1,SF2,SFComb):-   % none
        sacheck(off),
        phon_segment(ProcessType,Phone),
        name(SF1,N1),
        name(SF2,N2),
        name(Phone,[C1,C2,C3]),
        append(N1,[C1,C2,C3|N2],NComb),
        name(SFComb,NComb).

