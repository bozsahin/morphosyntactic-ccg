%%%%%%%%%%%%%%%%
%%% turkish_specs.pl: language-specific CCG stuff
%%% ------------      (type constraints, lattice, macros, phon constraints) 
%%%%%%%%%%%%%%%%
 
% Type constraints on CCG rules (for Turkish); The main functor cannot be 
%  onto N, which makes the NP configurational (this leaves S and St)
%

type_constraint(Cat):-
	onto(Cat,(~top) $ s).
type_constraint(Cat):-
	onto(Cat,(~top) $ st).

%
% type lattice for Turkish
% -----
% type system (must be a lattice, i.e., every a,b must have
% a unique join and meet). 'top' is the universal upper bound.
% 'bottom' is the universal lower bound. For type-checks, it's sufficient
% to be a join-semilattice.
%
 
subtype(top,free).
 
subtype(free,n_case).   % nouns
subtype(n_case,n_poss).
subtype(n_case,n_comp).
subtype(n_comp,n_num).
subtype(n_poss,n_num).
subtype(n_num,n_base).
subtype(n_base,n_relbase).
subtype(n_base,n_root).
subtype(n_relbase,bottom).
substype(n_root,bottom).
 
%subtype(free,s_inf).   % verbs
%subtype(free,s_rel).
subtype(free,s_person).
%subtype(s_inf,s_abil).
%subtype(s_rel,s_abil).
subtype(s_person,s_modal).
subtype(s_modal,s_tense).
subtype(s_tense,s_abil).
subtype(s_abil,s_neg).
subtype(s_neg,s_imp).
subtype(s_imp,s_pass).
subtype(s_pass,s_caus).
subtype(s_caus,s_reflex).
subtype(s_caus,s_recip).
subtype(s_reflex,s_base).
subtype(s_recip,s_base).
subtype(s_base,bottom).


%
% macros for lexical entries in Turkish
%
 
macro(iv,   % iv/0: for verb specs
   (~s_base)$s([_,_,_,_,_]) \ (~free)$np([1,nom,_,_,_,_])).

macro(iv2(Type,Case),          % iv/2: for cats like (N/N)\IV
   (Type)$s([_,_,_,_,_]) \ (~free)$np([1,Case,_,_,_,_])).
 
macro(tv(Case), % tv/1: for v spec
   (~s_base)$s([_,_,_,_,_])
     \ (~free)$ np([1,_,_,_,_,_])
     \ (~free)$ np([2,Case,_,_,_,_])).

macro(tv(Case,Finite), % tv/2: for v spec
   (~s_base)$s([_,_,_,_,Finite])
     \ (~free)$ np([1,_,_,_,_,_])
     \ (~free)$ np([2,Case,_,_,_,_])).

macro(dv, % dv/0: for v spec
   (~s_base)$s([_,_,_,_,_])
     \(~free)$np([1,_,_,_,_,_])
     \(~free)$np([3,dat,_,_,_,_])
     \(~free)$np([2,acc,_,_,_,_])).
macro(dv(Finite), % dv/1: for v spec
   (~s_base)$s([_,_,_,_,Finite])
     \(~free)$np([1,_,_,_,_,_])
     \(~free)$np([3,dat,_,_,_,_])
     \(~free)$np([2,acc,_,_,_,_])).

macro(n(Num,Per),                           % n/3: for N specs
   (~n_base)$ n([_,_,Num,Per,_,_])).
 
macro(gen(Num,Per),                   % gen/2
   (~n_poss)$ n([_,_,_,3,_,plus])
     /((#n_poss)$ n([_,_,Num,Per,_,_])
         \(#n_poss)$ n([_,_,Num,Per,_,_]))).
 
macro(poss(Num,Per),                  % poss/2 for result poss cat
   (#n_poss)$n([_,_,Num,Per,_,_])
     \(#n_poss)$n([_,_,Num,Per,_,_])).

macro(tr1(Agr),
   (T)$s(A1)/((T)$s(A1)\(_)$np(Agr))).
macro(tr2(Agr),
   ((T)$s(A1)\(T2)$np(A2))/((T)$s(A1)\(T2)$np(A2)\ (_)$np(Agr))).
 
%
% The remainder is Turkish-specific phonology and morphology.
%

%
% Composer/constraint checker for morphological form 
% -----------------------------------------

morphophonemic_constraints(ProcessType,SF1,SF2,SFComb):-  
        sacheck(on),
	phon_segment(ProcessType,Phone),
	name(SF1,N1),
	name(SF2,N2),
	name(Phone,[C1,C2,C3]),
 	check_constraints(ProcessType,N1,N2),
	append(N1,[C1,C2,C3|N2],NComb),
	name(SFComb,NComb).
morphophonemic_constraints(ProcessType,SF1,SF2,SFComb):-
        sacheck(off),
        phon_segment(ProcessType,Phone),
        name(SF1,N1),
        name(SF2,N2),
        name(Phone,[C1,C2,C3]),
        append(N1,[C1,C2,C3|N2],NComb),
        name(SFComb,NComb).

check_constraints(s,Stem1,_Stem2):- %stem1 is a word.must be final devoiced
	!, stop_devoiced(Stem1).
check_constraints(c,Stem1,Stem2):- %stem1 is a word.must be final devoiced
	!, stop_devoiced(Stem1),
        break_stem(Stem1,V,_P),
        v_harmony(V,Stem2).
check_constraints(a,Stem,Affix):-   % assumes e.g. aðaç and aðac are in lex
	!, break_stem(Stem,StemLastV,StemFinal),  % i.e., no metaphonemes
	affix_initial(Affix,AffixInitial),
	!,
	v_harmony(StemLastV,Affix),
	c_harmony(StemFinal,AffixInitial),
	c_epenthesis(StemFinal,AffixInitial).

stop_devoiced(Stem):-
	break_stem(Stem,_StemLastV,StemFinal),
	!,
	check_devoice(StemFinal).

check_devoice(P):- stop(P),!,voice(P,no).
check_devoice(_P):-!.

break_stem(Stem,LastV,LastPhone):- 
  break_stem(Stem,_InV,LastV,_LPin,LastPhone).
break_stem([H|T],_LVIn,LVOut,_LPin,StemFinal):-
	vowel(H),!,
	break_stem(T,H,LVOut,H,StemFinal).
break_stem([H|T],LVIn,LVOut,_LPin,StemFinal):-
	phone(H),!,
	break_stem(T,LVIn,LVOut,H,StemFinal).
break_stem([_H|T],LVIn,LVOut,LPin,StemFinal):-
	!,
	break_stem(T,LVIn,LVOut,LPin,StemFinal).
break_stem([],LV,LV,LP,LP).

affix_initial([Init|_RestAffix],Init).

v_harmony(_V,[]).
v_harmony(_V,[121,107,101,110]). % -yken and the following do not harmonize
v_harmony(_V,[107,101,110]).     % -ken
v_harmony(_V,[107,105]).         % -ki
v_harmony(_V,[V2,121,111,114]):- member(V2,[105,253,117,252]). % -Iyor
v_harmony(_V,[121,111,114]).     % -yor 
v_harmony(LastV,[P|RestAffix]):-
	vowel(P),!,
	harmonious(LastV,P),     
        v_harmony(P,RestAffix).  % harmony is progressive from last vowel
v_harmony(LastV,[Cons|RestAffix]):-
	not(vowel(Cons)),!,
	v_harmony(LastV,RestAffix).
	
% stem final phone(C) and affix init phone(C) must agree on voicing. 

c_harmony(StemFinalP,_AffixInitialP):-vowel(StemFinalP),!.
c_harmony(_StemFinalP,AffixInitialP):-vowel(AffixInitialP),!.
c_harmony(StemFinalP,AffixInitialP):-
	voice(StemFinalP,Voice),
	voice(AffixInitialP,Voice).

c_epenthesis(StemFinalP,AffixInitP):- % must be a buffer C if stem ends with V
	vowel(StemFinalP),!,
	not(vowel(AffixInitP)).
c_epenthesis(_StemFinalP,_AffixInitP).

vowel(Code):- name(Phone,[Code]), vowel(Code,Phone).

vowel(97,a).   vowel(101,e). vowel(111,o). vowel(246,ö). vowel(117,u). 
vowel(252,ü).  vowel(105,i). vowel(253,ý).

phone(Code) :- 65 =< Code, Code =< 90.
phone(Code) :- 97 =< Code, Code =< 122.
phone(231). phone(253). phone(246). phone(252). phone(254). phone(240).

voice(Code,Voice):- name(Phone,[Code]), voice(Code,Phone,Voice).

voice(98,b,yes).  voice(99,c,yes).  voice(100,d,yes). voice(240,ð,yes). 
voice(106,j,yes). voice(108,l,_). voice(109,m,_). voice(110,n,_). 
voice(114,r,_).   voice(118,v,yes). voice(121,y,yes). voice(122,z,yes).
voice(231,ç,no).  voice(102,f,no).  voice(103,g,yes). voice(104,h,no). 
voice(107,k,no).  voice(112,p,no).  voice(115,s,no).  voice(254,þ,no). 
voice(116,t,no).

stop(Code):- name(Phone,[Code]), stop(Code,Phone).

stop(112,p). stop(98,b). stop(116,t). stop(100,d). stop(231,ç). stop(99,c). 
stop(107,k). stop(103,g).

harmonious(97,V):-  member(V,[97,253]). % a harmonious with aý
harmonious(101,V):- member(V,[101,105]).% e with ei
harmonious(253,V):- member(V,[253,97]). % ý with aý
harmonious(105,V):- member(V,[101,105]).% i with ei
harmonious(117,V):- member(V,[117,97]). % ü with eü
harmonious(252,V):- member(V,[252,101]).% u with au
harmonious(111,V):- member(V,[97,117]). % o with au
harmonious(246,V):- member(V,[101,252]).% ö with eü
