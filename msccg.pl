%%%%%%%%%%%%%
%%% msccg.pl : Morphosyntactic CCG 
%%%              operators, ccg schema, parse engine, attachment calculus, 
%%               phonology, cg term unifiers, utilities
%%% ---------
%%%%%%%%%%%%%

%%
%% operators
%% --------- 
%%   

?- op(400,yfx,[/,\]).      % CCG slashes; x\y/z
?- op(250,fy,[&]).         % functional constant in lambda term; &ana`man
?- op(300,fy,[#,~]).       % Lattice relations 'equals' and 'includes'; #x ~x
?- op(350,xfx,[$]).        % morphosyntactic type decorator; (#y)$np
?- op(430,yfx,[`]).        % function application (semantics); see`x`y
?- op(445,xfy,[^]).        % lambda operator; x^y^see`x`y
?- op(450,xfx,[:]).        % morphosyntax-semantics category pairing; x:y
?- op(500,fx,[@]).         % attachment modality; @a (affixation)
?- op(550,xfx,[phon]).     % phonological dim. of a sign; phon(....)
?- op(600,xfx,[--]).       % prosody -- type separator 
?- op(250,fy,['@@']).      % macros for the lexicon; @@np3s
?- op(1200,xfx,[:=]).      % lexical assignment; [man,men] := (y)$np....

%% a lexical/phrasal sign is eg.
%%
%%   @ s phon(....) -- (~n) $ n(Agr) : X^man`X 
%%
%% which means this is an N with diacritic (=<n), agreement Agr (optional), 
%%   semantics lambda x.man x, attachment modality s (concat) and phon ...
%%
 
:- dynamic pascheck/1.
:- dynamic sacheck/1.
:- dynamic nfcheck/1.

%%
%% CCG schema and related semantics
%% --------------------------------
%%
%%  For tags ot,fc,bc, see Eisner's ACL'96 paper
%%

% type raising (with partial execution of LF a la Pereira & Shieber)

ccg((_)$n(Agr):LFn,(M)$ s(A) / 
                        ((M)$ s(A) \
                         (~free) $ np(Agr)) : (LFn^F)^F,ot,ot).

ccg((_)$n(Agr):LFn,((M1)$ s(A)\ (M2) $ np(A2))/
                  ((M1)$ s(A)\
                   (M2) $ np(A2) \
                   (~ free) $ np(Agr)) : (LFn^F)^F,ot,ot).

ccg((_)$n(Agr):LFn,((M1) $ s(A)\ (M2) $ np(A2)\(M3) $ np(A3))/
                    ((M1) $ s(A)\ (M2) $ np(A2) \ (M3) $ np(A3) \
                   (~ free) $ np(Agr)): (LFn^F)^F,ot,ot).

% extraposition

ccg((_)$n(Agr):LFn,(M)$ st(A) \ 
                        ((M)$ s(A) \
                         (~ free) $ np(Agr)) : (LFn^F)^F,ot,ot).

ccg((_)$n(Agr):LFn,(M)$ st(A) \ 
                        ((M)$ st(A) \
                         (~ free) $ np(Agr)) : (LFn^F)^F,ot,ot).

% fwd application
 
ccg(X1/Y1:F1,Y2:F2,X1:FR,Tag1,Tag2,ot,1):-
        check_tags(Tag1,[bc,ot],Tag2,[fc,bc,ot]),
        t_unify(Y1,Y2),
        reduce(F1,F2,FR).
 
% bwd application
 
ccg(Y1:F1,X2\Y2:F2,X2:FR,Tag1,Tag2,ot,2):-
        check_tags(Tag1,[fc,bc,ot],Tag2,[fc,ot]),
        t_unify(Y2,Y1),
        reduce(F2,F1,FR).

% fwd composition
 
ccg(X1/Y1:F1,Y2/Z2:F2,X1/Z2:AR^FR,Tag1,Tag2,fc,1):-
        type_constraint(X1),
        check_tags(Tag1,[bc,ot],Tag2,[fc,bc,ot]),
        t_unify(Y1,Y2),
        reduce(F2,AR,Ft),
        reduce(F1,Ft,FR).
 
% bwd composition
 
ccg(Y1\Z1:F1,X2\Y2:F2,X2\Z1:AR^FR,Tag1,Tag2,bc,2):-
        type_constraint(X2),
%       type_constraint(Y2),
        check_tags(Tag1,[fc,bc,ot],Tag2,[fc,ot]),
        t_unify(Y2,Y1),
        reduce(F1,AR,Ft),
        reduce(F2,Ft,FR).

% <B^2 for Turkish (needed for post-verbal scrambling in DVs)

ccg((Y1\Z1)\W1:F1,X2\Y2:F2,
      (X2\Z1)\W1:AR1^AR2^FR,Tag1,Tag2,bc,2):-
        type_constraint(X2),
%        type_constraint(Y2),
        check_tags(Tag1,[fc,bc,ot],Tag2,[fc,ot]),
        t_unify(Y2,Y1),
        reduce(F1,AR1,Ft1),
        reduce(Ft1,AR2,Ft2),
        reduce(F2,Ft2,FR).

%% 
%% parse engine
%% ------------

% default settings for switches

nfcheck(on).
pascheck(off).
sacheck(off).

parser_stat:-
   nl,
   write('%** Parser switches:'),nl, 
   write('%**'),nl,
   write('%**   Normal Form parse : '), nfcheck(X), write(X),nl,
   write('%**   PAS equiv. check  : '), pascheck(Z),write(Z),nl,
   write('%**   Surface attachment: '), sacheck(Y), write(Y),nl,
   nl.

:- parser_stat.

% 
% switch setting/resetting predicates
%

nonfcheck:-
        retractall(nfcheck(_)),
	assert(nfcheck(off)),
	parser_stat.
nfcheck:-
	retractall(nfcheck(_)),
	assert(nfcheck(on)),
	parser_stat.

nosacheck:-
        retractall(sacheck(_)),
	assert(sacheck(off)),
	parser_stat.
sacheck:-
        retractall(sacheck(_)),
	assert(sacheck(on)),
	parser_stat.
nopascheck:-
        retractall(pascheck(_)),
        assert(pascheck(off)),
        parser_stat.
pascheck:-
        retractall(pascheck(_)),
        assert(pascheck(on)),
        write('** warning: this is in general undecidable '),nl,
        parser_stat.      

% PAs equivalence check (undecidable!)

check_pas(PAS):-
        pascheck(on),
        pas(PAS),
        !, fail.
check_pas(PAS):-
        pascheck(on),
        assert(pas(PAS)).
check_pas(_):-
        pascheck(off).

% tags for normal form parse

check_tags(Tag1,Set1,Tag2,Set2):- % true if Tag1 is in Set1, and Tag2 in Set2
	nfcheck(on),     
	member(Tag1,Set1),
	member(Tag2,Set2).
check_tags(_,_,_,_):- 
	nfcheck(off).   

%%
%% CKY part 
%%

% CKY-CCG interface

apply_ccg( @ At1 phon Phon1 -- Cat1,SF1,Tag1, 
           @ At2 phon Phon2 -- Cat2,SF2,Tag2,
           @ AtR phon PhonR -- CatR,SFR,TagR):-
        ccg(Cat1,Cat2,CatR,Tag1,Tag2,TagR,FunctorPos), % morphosyn-sem inference
        attachment_calculus(At1,At2,AtR),              % attachment inference
        surface_attachment(FunctorPos,At1,At2,Phon1,Phon2,PhonR,
                                      SF1,SF2,SFR).
apply_ccg( @ At phon P -- Cat1,SF,Tag1, 
           @ At phon P -- CatR,SF,TagR):-
        ccg(Cat1,CatR,Tag1,TagR). % unary rule; no combination check


%%
%% CKY parser (modified to incorporate unary and binary rules)
%% 
%%  (derive binary rules of size 1; derive unary rules of size 1; repeat
%%   until size n)

do(Y):-Y,!.  % do something once

foreach(X,Y) :- X,do(Y),fail.
foreach(_,_).

parse(Sentence,N):- 
 retractall(table(_,_,_,_,_)),    %clean the CKY table
 length(Sentence,N),              %count the length
 inittable(Sentence,0,N),
 cky(0,N).                      %CKY algorithm

inittable([],N,N).
inittable([W|L1],J,N):-
 J<N,
 J1 is J+1,
 foreach(lex((W := Sign )),
         asserta(table(W,Sign,ot,J,J1))),  % clean CKY table
 inittable(L1,J1,N).
 
cky(N,N).
cky(I,J):-
  I<J,
  I1 is I+1,
  loop(I1,0,J),
  cky(I1,J).

loop(S,I,J):-
  J1 is I+S,
  J1 =< J,
  do_binary(I,J1),
  do_unary(I,J1),
  I1 is I+1,
  loop(S,I1,J).
loop(_,_,_).


do_unary(I,K):-
 foreach(table(W2,@ At2 phon P2 -- Cat2:Sem2 ,Tag2,I,K),
         foreach(apply_ccg(@ At2 phon P2 -- Cat2:Sem2 ,W2,Tag2,
                           @ AtR phon PR -- CatR:SemR ,WR,TagR),
          (\+ (table(WR,@ AtR phon PR -- CatR:SemR ,TagR,I,K)) -> 
              asserta(table(WR,@ AtR phon PR -- CatR:SemR  ,TagR,I,K))))
 ).

do_binary(I,J):-
 foreach((table(W2,@ At2 phon P2 -- Cat2:Sem2 ,Tag2,I,K),
          table(W3,@ At3 phon P3 -- Cat3:Sem3 ,Tag3,K,J)
          ),
         foreach(apply_ccg(@ At2 phon P2 -- Cat2:Sem2 ,W2,Tag2,
                           @ At3 phon P3 -- Cat3:Sem3 ,W3,Tag3,
                           @ AtR phon PR -- CatR:SemR ,WR,TagR),
          (\+ (table(WR,@ AtR phon PR -- CatR:SemR ,TagR,I,J)) -> 
              asserta(table(WR,@ AtR phon PR -- CatR:SemR ,TagR,I,J))))).

%% 
%% attachment calculus (not language specific)
%% -------------------
%% nb: this finite calculus is complete; it cannot undo a morphosyntactically
%%      valid derivation, although eg. there may be no language that combines
%%      two clitics.

% a: affixation
% c: cliticization
% s: syntactic concatenation

attachment_calculus(a,a,a).
attachment_calculus(a,s,s).
attachment_calculus(a,c,c).
attachment_calculus(s,a,s).
attachment_calculus(c,a,c).
attachment_calculus(s,s,s).
attachment_calculus(s,c,s).
attachment_calculus(c,s,s).
attachment_calculus(c,c,c).

%% interface to language-specific phon constraints (harmony etc)
%% ---------

surface_attachment(1,At1,_At2,(PF1,Gl1),(PF2,Gl2),(PFR,GlR),SF1,SF2,SFR):-
   compose_phon(At1,PF1,PF2,PFR),
   parenthesize(1,SF1,SF2,SF1n,SF2n),
   morphophonemic_constraints(At1,SF1n,SF2n,SFR),
   compose_morph(At1,Gl1,Gl2,GlR).
surface_attachment(2,_At1,At2,(PF1,Gl1),(PF2,Gl2),(PFR,GlR),SF1,SF2,SFR):-
   compose_phon(At2,PF1,PF2,PFR),
   parenthesize(2,SF1,SF2,SF1n,SF2n),
   morphophonemic_constraints(At2,SF1n,SF2n,SFR),
   compose_morph(At2,Gl1,Gl2,GlR).

%%
%% unifier for CCG (syntax and morphosyntax)
%% ------------------------------------------------------
%%
%% basic cats with fixed-arity agreement slots for S and N are term-unified,
%% complex cats are recursively term-unified,
%% each basic cat unification also checks lattice condition 
%% 
%% nb: CCG uses no slash passing mechanism so there is really no need
%%       for DAG unification for syntax-semantics a la HPSG
%%

t_unify(X,X):- !.  % term unification
t_unify(X1/Y1,X2/Y2):-   % unify recursively if arguments are complex cats 
	nonvar(X1),!,          
	t_unify(X1,X2),!,        
	t_unify(Y1,Y2),!.
t_unify(X1\Y1,X2\Y2):-   % unify recursively if arguments are complex cats
	nonvar(X1),!,
	t_unify(X1,X2),!,
	t_unify(Y1,Y2),!.
t_unify((Type1) $ X,(Type2) $ X):- % unify basic types; both have AGR or none
	lattice_consistent(Type1,Type2),!.
t_unify((Type1) $X1,(Type2) $ X2):- % unify basic types missing an AGR
        functor(X1,F,0),
        functor(X2,F,1),  % same syntactic type; first one has no AGR
	lattice_consistent(Type1,Type2),!.
t_unify((Type1) $X1,(Type2) $ X2):- % unify basic types missing an AGR
        functor(X2,F,0),
        functor(X1,F,1),  % same syntactic type; second one has no AGR
	lattice_consistent(Type1,Type2),!.


%%
%% lattice operations. It assumes that subtypes of a type are defined 
%%  using subtype/2. There must be a 'top' type of which 
%%  everything is a subtype  (i.e., we have a join-semilattice of types).
%%
%% lattice_consistent(Type1,Type2) satisfies when 
%%   Type1 lattice-includes-or-equals Type2
%% (nb: The term 'type' refers to diacritics on categories).
%%

lattice_consistent(Modal,Modal):- !.
lattice_consistent(~Type1,~Type2):- lattice_includes(Type1,Type2).
lattice_consistent(~Type1,#Type2):- lattice_includes(Type1,Type2).
lattice_consistent(#Type1,#Type2):- lattice_equals(Type1,Type2).
lattice_consistent(#Type1,~Type2):- lattice_equals(Type1,Type2).

lattice_includes(Type,Type):-!.
lattice_includes(Type1,Type2):-
	subtype(SuccessorType,Type2),
	lattice_includes(Type1,SuccessorType).

lattice_equals(Type,Type).

%
% Composer for phonetic form
% --------------------------
% attach one PF to another by attachment modality
%
 
compose_morph(ProcessTypeF,FormF,FormArg,FormRes):-
        name_append(ProcessTypeF,FormF,FormArg,FormRes).

compose_phon(ProcessType,PF1,PF2,PFR):-
        phon_segment(ProcessType,Phone),
        name(Phone,[C1,C2,C3]),
        append(PF1,[C1,C2,C3|PF2],PFR).
 
phon_segment(a,' - ').  % affix boundary
phon_segment(s,' # ').  % word boundary
phon_segment(c,' @ ').  % clitic boundary


%%
%% utilities
%% ---------
%%

append([],L,L).
append([H|T],L2,[H|T2]):- append(T,L2,T2).

not(P) :- call(P),!,fail.
not(_P).

name_append(a,L1,L2,L3):-  append(L1,L2,L3).
name_append(c,L1,L2,L3):- append(L1,[32|L2],L3).
name_append(s,L1,L2,L3):- append(L1,[32|L2],L3).

subset([],_).
subset([H|T],Set):-
	member(H,Set),
	subset(T,Set).

% prenex first lambda in 1st arg (there must be one)
%  prenex first lambda (if any) in 2nd arg ; then reduce 

reduce(F,Arg,Res):-
  lambda1(F,Var,FExp),
  !,
  prenex_arg(Arg,ArgExp),
  reduce1(Var^FExp,ArgExp,Res).

prenex_arg(Arg,VarArg^VarExp):-
  lambda1(Arg,VarArg,VarExp),
  !.
prenex_arg(Arg,Arg):-!.

% one-step beta reduction

reduce1(Arg^Expr,Arg,Expr).  

% find 1st lambda in 1st arg and return the var & expression without it

lambda1(Expr,X,F):- 
  nonvar(Expr),
  Expr=X^F,
  !.
lambda1(Expr,Var,XN`F):-
  nonvar(Expr),
  Expr=X`F,
  lambda1(X,Var,XN),
  !.
lambda1(Expr,Var,X`FN):-
  nonvar(Expr),
  Expr=X`F,
  lambda1(F,Var,FN),
  !.


% checks if 1st arg is a function onto 2nd

onto(TA,TF):- t_unify(TF,TA),!. 
onto(T\_X,Y):- onto(T,Y).
onto(T/_X,Y):- onto(T,Y).

%
% macro expansion
%

expand(X/Y,XDef/YDef):-!,
	expand(X,XDef),
	expand(Y,YDef).
expand(X\Y,XDef\YDef):-!,
	expand(X,XDef),
	expand(Y,YDef).
expand(@@Macro,Def):- macro(Macro,Def), !.
expand(@@Macro,_):- write('*** error in macro '), write(Macro), nl.
expand(Cat,Cat).

% list membersehip

member(H,[H|_]).
member(H,[_|T]):- member(H,T).

% put () around the argument in surface structure
 
parenthesize(1,SF1,SF2,SF1,SF2n):-
  name(SF2,N2),
  append([40],N2,N),
  append(N,[41],NN),
  name(SF2n,NN).
parenthesize(2,SF1,SF2,SF1n,SF2):-
  name(SF1,N2),
  append([40],N2,N),
  append(N,[41],NN),
  name(SF1n,NN).


%
% Driver routines for CG parser
%   character I/O adapted from Clocksin & Mellish book.
% 

go1(InFile):- nonvar(InFile), seen, see(InFile), go, seen.

go2(In,Out):- nonvar(In), nonvar(Out), seen, told, 
              see(In), tell(Out), 
              statistics(runtime,[K,_]),
              go, seen, statistics(runtime,[J,_]),nl,
              parser_stat,nl,
              write('run time : '), R is J-K, write(R), write(' msec.'), 
              nl,told.

go:-
     repeat,
     nl,
     print('>>: '), 
     readsent(X),
     nl,
     write(' Morphs  '), write(X), nl,
     process(X),
     !.

process([bye]).
process(X):-
     retractall(pas(_)),
     parse(X,N),
     !,
     analyze(N),
     fail.

analyze(N):-
	table(SF,@ _At phon(_PF,Gloss) -- Cat:Sem ,_Tag,0,N),
        check_pas(Sem),
	pprint(Cat,Sem,SF,Gloss). 

pprint(Syn,Sem,SF,MF):- nl,
	write('Surface  '), write(SF), nl,
	write('  Gloss  '), name(MFN,MF), write(MFN), nl,
	write('Syn:Sem  '), pprint_cat(Syn), write(' : '),
        write(Sem), nl. 

% pretty-print the category without the diacritics for clarity

pprint_cat((_)$X):- 
  functor(X,F,_), 
  write(F). % basic cat (with or without agr)
pprint_cat(X\Y):- 
	pprint_cat(X), name(BS,[92]),write(BS), pprint_arg(Y).
pprint_cat(X/Y):- 
	pprint_cat(X), write('/'), pprint_arg(Y).

pprint_arg((_)$X):- 
  functor(X,F,_), 
  write(F). % basic cat with or without agr
pprint_arg(A\B):-  % complex arg
	write('('),
	pprint_cat(A\B),
	write(')').
pprint_arg(A/B):-  % complex arg
	write('('),
	pprint_cat(A/B),
	write(')').


%
%  readsent procedure for reading in sentences. 
%  From Clocksin & Mellish.
% 

readsent(X):-
     wholesent(Y),
     killast(Y,X).

killast([_A|[]],[]).
killast([H|T],[H|NewT]):-
     killast(T,NewT).

wholesent([W|Ws]):-
     get0(C),
     readword(C,W,C1),
    restsent(W,C1,Ws).

restsent(W,_,[]):-
     lastword(W),!.
restsent(_W,C,[W1|Ws]):-
     readword(C,W1,C1),
     restsent(W1,C1,Ws).

readword(C,W,C1):-
     single_character(C),
     !,
     name(W,[C]),
     get0(C1).
readword(C,W,C2):-
     in_word(C,NewC),
     !,
     get0(C1),
     restword(C1,Cs,C2),
     name(W,[NewC|Cs]).
readword(_C,W,C2):-
     get0(C1),
     readword(C1,W,C2).

restword(C,[NewC|Cs],C2):-
     in_word(C,NewC),
     !,
     get0(C1),
     restword(C1,Cs,C2).
restword(C,[],C).

single_character(44).  /*comma*/
single_character(59).  /*semicolon*/
single_character(58).  /*colon*/
single_character(63).  /*question-mark*/
single_character(33).  /*exclamation point*/
single_character(46).  /*period*/

in_word(C,C):-
     C>96,
     C<123.
in_word(C,L):-
     C>64,
     C<91,
     L is C+32.
in_word(C,C):-
     C>47,
     C<58.
in_word(39,39).
in_word(45,45).
in_word(231,231).   % latin-5 equivalents of Turkish diacritics :ç
in_word(254,254).   % þ
in_word(240,240).   % ð
in_word(253,253).   % ý
in_word(252,252).   % ü
in_word(246,246).   % ö

lastword('.').
lastword('!').
lastword('?').


% generating the morphic lexicon (compile out morphemic lex)

compile_lex(LexFile,Outfile):- 
   consult(LexFile),
   expand_macros,
   nl,nl,write('running the lexical rules ...'),nl,nl,
   lex_rules,           % unleash lex rules to get more lex/2 entries
   save_lex(LexFile,Outfile).

save_lex(InLexFile,OutLexFile):-
   told, 
   tell(OutLexFile),
   write('%% file: '), write(OutLexFile),write(', the compiled lexicon'),nl,
   write('%% This file is generated by compile_lex/1'),nl,
   write('%% source lexicon: '), write(InLexFile),nl,
   write('%%'),nl,
   write('%%'),nl,
   listing(lex/1),
   told.

% unfold_lex/0 creates lex/1 entries out of x := y lexical assigments 
%   in the lexicon.
% The difference is that lex predicate does not have a list of
% allomorphs but only one morph.
 
expand_macros:-
      (Allomorphs := @ AtType phon Phon -- MSType : SemType),%morphemic lexicon
        expand(MSType,MSDef),
        unfold_lexitem(Allomorphs, @ AtType phon Phon -- MSDef : SemType ),
        fail.
expand_macros.
 
unfold_lexitem([],_Sign).
unfold_lexitem([H|T],Sign):-
        nonvar(H),
        assertz(lex((H := Sign))),
        unfold_lexitem(T,Sign).

