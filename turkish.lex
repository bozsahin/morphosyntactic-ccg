
%% module: turkish.lex ; The abstract morphemic CCG lexicon for Turkish 
%%
%%   This file must be compiled by compile_lex to be interpretable.
%%
%% -Cem Bozsahin (1996-2001)
%% --------------


% format : [allomorphs] := @ attachment phon (Phonology) -- Syn : Sem.

%
%% V
% 

[uyu] := 
	@ s phon("uyu", "sleep") --
	@@iv:X^sleep`X .

[git] := 
	@ s phon("git", "go") --
	@@iv:X^go`X .
[al] := 
	@ s phon("al", "buy") --
	@@tv(acc):X^Y^buy`X`Y .

[yürü] := 
	@ s phon("yürü", "walk") --
	@@iv:X^walk`X .

[üz] := 
	@ s phon("üz", "sadden") --
	@@tv(acc):X^Y^sadden`X`Y .

[oku] := 
	@ s phon("oku", "read") --
	@@tv(acc):X^Y^read`X`Y .

[kes] := 
	@ s phon("kes", "cut") --
	@@tv(acc):X^Y^cut`X`Y .

[vur] := 
	@ s phon("vur", "kick") --
	@@tv(dat):X^Y^kick`X`Y .

[vur] := 
	@ s phon("vur", "shoot") --
	@@tv(acc):X^Y^shoot`X`Y .

% note that NP2 is a dative marked object for "bak".
[bak] := 
	@ s phon("bak", "look") --
	@@tv(dat):X^Y^look`X`Y .

[gör] := 
	@ s phon("gör", "see") --  
	@@tv(acc):X^Y^see`X`Y .

% DVs wrap VP around NP3 (hence Cv semantics) 
[ver] := 
	@ s phon("ver", "give") --
	@@dv:X^Y^Z^give`Y`X`Z .

[koy] := 
	@ s phon("koy", "put") --
	@@dv:X^Y^Z^put`Y`X`Z .


%
% Raising and control verbs.
% 
%  Raising is lexically marked on the predicate hence we can differentiate
%    raising and nonraising readings as 
%      forget(read book mehmet) and forget book mehmet 
%    since raising always associates subord subject with matrix sub.
%  Raising is handled transparently by raising cat of -ma.
%
%  Control is also lexically marked in the PAS, mediated by ANA for
%    coindexing. Subject/object(which obj?) is explicit in PAS. 
%    Unlike raising, there is no assurance that embedded subj is subj
%    of matrix clause so we need ANA to make it explicit. 
%  Raising cat of -ma helps to find the right bracketing, but it is the
%    control verb that does the coindexing.
%

% unut (raising). 
[unut] :=  
	@ s phon("unut", "forget") --
        @@tv(acc,minus):((&ana`X)^F)^X^forget`F`X .

% unut (nonraising). 
[unut] :=  
	@ s phon("unut", "forget") --
        @@tv(acc):X^Y^forget`X`Y .

% iste (raising)
[iste,isti] := 
	@ s phon("iste", "want") --
	@@tv(acc,minus):((&ana`X)^F)^X^want`F`X .

% iste (nonraising)
[iste,isti] := 
	@ s phon("iste", "want") --
	@@tv(acc):X^Y^want`X`Y .


% subject control by TV
[çalýþ] := 
	@ s phon("çalýþ", "try") --
	@@tv(dat,minus):((&ana`X)^F)^X^try`F`X .

% subject control by DV (control on dative DO)
[sözver] := 
	@ s phon("söz ver", "promise") --
	@@dv(minus):((&ana`Y)^F)^X^Y^promise`X`F`Y .


% subject control by a DV (control on accusative DO)
[teklifet] :=  
	@ s phon("teklif et", "offer") --
	@@dv(minus):((&ana`Y)^F)^X^Y^offer`X`F`Y .

% object control (control by DO)
[zorla] := 
	@ s phon("zorla", "force") --
	@@dv(minus):((&ana`X)^F)^X^Y^force`F`X`Y .

% object control (control by IO) 
[söyle] := 
	@ s phon("söyle", "tell") --
	@@dv(minus):((&ana`X)^F)^X^Y^tell`X`F`Y .

%% soyle (noncontrol)
[söyle] :=  
	@ s phon("söyle", "say") --
        @@tv(acc):X^Y^say`X`Y .

%% object control (control by IO) 
[tavsiyeet] := 
	@ s phon("tavsiyeet", "recommend") --
      @@dv(minus):((&ana`X)^F)^X^Y^recommend`X`F`Y .


%
%% N
%

[ben] := 
	@ s phon("ben", "i") --
	@@n(sg,1):i .

[biz] := 
	@ s phon("biz", "we") --
	@@n(pl,1):we .

[sen] := 
	@ s phon("sen", "you") --
	@@n(sg,2):you .

[siz] := 
	@ s phon("siz", "yoU") --
	@@n(pl,2):yoU .

[o] := 
	@ s phon("o", "she") --
	@@n(sg,3):she .

[onlar] := 
	@ s phon("onlar", "they") --
	@@n(pl,3):they .

[kredi] := 
	@ s phon("kredi", "credit") --
	@@n(sg,3):credit .

[kart] := 
	@ s phon("kart", "card") --
	@@n(sg,3):card .

[faiz] := 
	@ s phon("faiz", "interest") --
	@@n(sg,3):interest .

[oran] := 
	@ s phon("oran", "rate") --
	@@n(sg,3):rate .

[kýz] := 
	@ s phon("kýz", "girl") --
	@@n(sg,3):girl .

[oðul,oðlu] := 
	@ s phon("oðul", "son") --
	@@n(sg,3):son .

[adam] := 
	@ s phon("adam", "man") --
	@@n(sg,3):man .

[ev] := 
	@ s phon("ev", "house") --
	@@n(sg,3):house .

[araba] := 
	@ s phon("araba", "car") --
	@@n(sg,3):car .

[otobüs] := 
	@ s phon("otobüs", "bus") --
	@@n(sg,3):bus .

[bilet] := 
	@ s phon("bilet", "ticket") --
	@@n(sg,3):ticket .

[kardeþ] := 
	@ s phon("kardeþ", "sibling") --
	@@n(sg,3):sibling .

[arkadaþ] := 
	@ s phon("arkadaþ", "friend") --
	@@n(sg,3):friend .

[çocuk,çocuð] := 
	@ s phon("çocuk", "child") --
	@@n(sg,3):child .

[kitap,kitab] := 
	@ s phon("kitap", "book") --
	@@n(sg,3):book .

[koltuk,koltuð] := 
	@ s phon("koltuk", "chair") --
	@@n(sg,3):chair .

[kapý] := 
	@ s phon("kapý", "door") --
	@@n(sg,3):door .

[aðac,aðaç] := 
	@ s phon("aðaç", "tree") --
	@@n(sg,3):tree .

[mehmet,mehmed] := 
	@ s phon("mehmet", "mehmet") --
	@@n(sg,3):mehmet .

[top] := 
	@ s phon("top", "ball") --
	@@n(sg,3):ball .

% inherently temporal n. controlled by relbase 
[sabahki] := 
	@ s phon("sabahki","at morning") --
 (# n_relbase) $ n([_,_,sg,3,_,_])
   / (~ n_num) $ n([_,_,_,_,_,_]) : X^(X^P)^and`(at`morning`X)`P .

[sabah] := 
	@ s phon("sabah","morning") --
   @@n(sg,3):morning .
%
%% Adj
%

% intersective adjectives
[yeþil] := 
	@ s phon("yeþil", "green") --
	 (~ n_num) $ n([I,C,N,P,G,R]) 
         / (~ n_num) $ n([I,C,N,P,G,R]) : X^green`X .

[uzun] := 
	@ s phon("uzun", "long") --
	 (~ n_num) $ n([I,C,N,P,G,R]) 
         / (~ n_num) $ n([I,C,N,P,G,R]) : X^long`X .

[yýllýk] := 
	@ s phon("yýllýk", "annual") --
	 (~ n_num) $ n([I,C,N,P,G,R]) 
         / (~ n_num) $ n([I,C,N,P,G,R]) : X^annual`X .
%non-intersective adj
[oyuncak] := 
	@ s phon("oyuncak", "toy") --
	 (~ n_base) $ n([I,C,N,P,G,R]) 
         / (~ n_base) $ n([I,C,N,P,G,R]) : X^long`X .


%
%% Grammatical morphemes (person, number, case, tense, etc)
%  

[ler,lar] := 
	@ a phon("lAr", "-PLU") --
   (~ n_num) $ n([_,_,pl,_,_,_]) 
   \ (~ n_base) $ n([_,_,sg,_,_,_]) : X^plu`X .


% (genitive as subject; embedded clauses )
% index is not N5 but N1 (no case! this is simply NPagr\N)
[in,ýn,un,ün,nin,nýn,nun,nün] := 
	@ a phon("(n)In", "-AGR") --
   (~ n_case) $ np([1,_,N,3,G,plus]) 
   \ (~ n_poss) $ n([_,_,N,3,G,_]) : F^F .
[in,ýn,un,ün,nin,nýn,nun,nün] := 
	@ a phon("(n)In", "-AGR") --
   (~ n_case) $ np([1,_,N,3,G,plus]) 
   \ @@tr1([_,_,N,3,G,_]) : F^F .

% (genitive as subject; embedded clauses )
% index is not N5 but N1
[im] := 
	@ a phon("(n)In", "-AGR") --
   (~ n_case) $ np([1,_,N,1,G,plus]) 
   \ (~ n_poss) $ n([_,_,N,1,G,_]) : F^F .
%[im] := 
%	@ a phon("(n)In", "-AGR") --
%   @@tr1([1,_,N,1,G,plus]) 
%   \ (~ n_poss) $ n([_,_,N,1,G,_]) : F^F .
%[im] := 
%	@ a phon("(n)In", "-AGR") --
%   @@tr2([1,_,N,1,G,plus]) 
%   \ (~ n_poss) $ n([_,_,N,1,G,_]) : F^F .

% (genitive as subject; embedded clauses )
[in] := 
	@ a phon("(n)In", "-AGR") --
   (~ n_case) $ np([1,_,N,2,G,plus])
   \ (~ n_poss) $ n([_,_,N,2,G,_]) : F^F .
%[in] := 
%	@ a phon("(n)In", "-AGR") --
%   @@tr1([1,_,N,2,G,plus])
%   \ (~ n_poss) $ n([_,_,N,2,G,_]) : F^F .
%[in] := 
%	@ a phon("(n)In", "-AGR") --
%   @@tr2([1,_,N,2,G,plus])
%   \ (~ n_poss) $ n([_,_,N,2,G,_]) : F^F .


% N+gen => Nagr/(Nagr\Ngen) (3rd person)
[in,ýn,un,ün,nin,nýn,nun,nün] := 
	@ a phon("(n)In", "-GEN.3") --
  @@gen(N,3)\ (~ n_poss) $ n([_,_,N,3,_,_]) : X^Y^poss`Y`X .
[in,ýn,un,ün,nin,nýn,nun,nün] := 
	@ a phon("(n)In", "-GEN.3") --
  (~n_poss)$n([_,gen,N,3,_,plus])/ (#n_comp)$n(_) \
    (~ n_poss) $ n([_,_,N,3,_,_]) : X^Y^poss`Y`X .


% N+gen => Nagr/(Nagr\Ngen) (2nd person)
[in] := 
	@ a phon("In", "-GEN.2") --
  @@gen(N,2)\ (~ n_poss) $ n([_,_,N,2,_,_]) : X^Y^poss`Y`X .
[in] := 
	@ a phon("In", "-GEN.2") --
  (~n_poss)$n([_,gen,N,2,_,plus])/ (#n_comp)$n(_) \
    (~ n_poss) $ n([_,_,N,2,_,_]) : X^Y^poss`Y`X .


% N+gen => Nagr/(Nagr\Ngen) (1st person)
[im] := 
	@ a phon("Im", "-GEN.1") --
  @@gen(N,1)\ (~ n_poss) $ n([_,_,N,1,_,_]) : X^Y^poss`Y`X .
[im] := 
	@ a phon("Im", "-GEN.1") --
  (~n_poss)$n([_,gen,N,1,_,plus])/ (#n_comp)$n(_) \
    (~ n_poss) $ n([_,_,N,1,_,_]) : X^Y^poss`Y`X .


[leri,larý] := 
	@ a phon("lArI", "-POSS.3p") --
  @@poss(pl,3)\ (~ n_num) $ n([_,_,sg,3,_,_]) : F^F .

[ý,i,u,ü,sý,si,su,sü] := 
	@ a phon("(s)I", "-POSS.3s") --
  @@poss(_,3)\ (~ n_num) $ n([_,_,_,3,_,_]) : F^F .

[n,in,ýn,un,ün] := 
	@ a phon("(I)n", "-POSS.2s") --
  @@poss(sg,2)\ (~ n_num) $ n([_,_,_,3,_,_]) : F^F .

[niz,nuz,iniz,unuz,nýz,ýnýz,ünüz,nüz] := 
	@ a phon("(I)nIz", "-POSS.2p") --
  @@poss(pl,2)\ (~ n_num) $ n([_,_,_,3,_,_]) : F^F .

[m,im,ým,um,üm] := 
	@ a phon("(I)m", "-POSS.1s") --
  @@poss(sg,1)\ (~ n_num) $ n([_,_,_,3,_,_]) : F^F .

[miz,muz,imiz,umuz,mýz,ýmýz,ümüz,müz] := 
	@ a phon("(I)mIz", "-POSS.1p") --
  @@poss(pl,1)\ (~ n_num) $ n([_,_,_,3,_,_]) : F^F  .


% POSS as compound marker : N\N\N
[i,ý,u,ü,si,sý,su,sü] := 
	@ a phon("(s)I", "-COMP") --
	 (# n_comp) $ n([_,_,_,3,_,_]) \
          (~n_num) $ n([_,_,_,3,_,minus]) \
	  (# n_base) $ n([_,_,_,3,_,_]) : X^Y^comp`X`Y .


% POSS as compound marker in nested compounds: N\N\N\N
[ý,i,u,ü,sý,si,su,sü] := 
	@ a phon("(s)I", "-COMP.POSS.3s") --
   (# n_comp) $ n([_,_,_,3,_,plus])\
        (# n_comp) $ n([_,_,_,3,_,_]) \
        (~n_num) $ n([_,_,_,3,_,minus]) \
        (# n_base) $ n([_,_,_,3,_,_]) : X^Y^Z^comp`(comp`X`Y)`Z .
% POSS as compound+agr : N\N\N\N
[ý,i,u,ü,sý,si,su,sü] := 
	@ a phon("(s)I", "-COMP.POSS.3s") --
   (# n_poss) $ n([_,_,_,3,_,plus])\
        (# n_poss) $ n([_,_,_,3,_,_]) \
        (~n_num) $ n([_,_,_,3,_,minus]) \
        (# n_base) $ n([_,_,_,3,_,_]) : X^Y^(comp`X`Y) .

% POSS as compound marker : N\N\N
[leri,larý] := 
	@ a phon("lArI", "-COMP2") --
	 (# n_comp) $ n([_,_,_,3,_,_])\
	      (~n_num) $ n([_,_,_,3,_,minus]) \
	      (# n_base) $ n([_,_,_,3,_,_]) : X^Y^plu`(comp`X`Y) .


% POSS as compound marker in nested compounds : N\N\N\N
[leri,larý] := 
	@ a phon("lArI", "-COMP2.POSS.3p") --
   (# n_comp) $ n([_,gen,_,3,_,plus])\
        (# n_comp) $ n([_,gen,_,3,_,_]) \
        (~n_num) $ n([_,_,_,3,_,minus]) \
        (# n_base) $ n([_,_,_,3,_,_]) : X^Y^Z^comp`(comp`X`Y)`Z .


% N+acc => Nacc 
[yý,yi,yu,yü] := 
	@ a phon("(y)I", "-ACC") --
  (~n_case) $ n([2,acc,N,P,G,_]) 
   \ (~ n_num) $ n([_,_,N,P,G,plus]) : F^F .


[ý,i,u,ü] := 
	@ a phon("(y)I", "-ACC") --
  (~n_case)$ n([2,acc,N,P,G,plus]) \ (~ n_poss) $ n([_,_,N,P,G,plus]) : F^F .

% N+acc => Nacc  with possessor
[ni,ný,nu,nü] := 
	@ a phon("nI", "-ACC") --
  (~n_case)$ n([2,acc,N,3,G,plus])
   \ (# n_poss) $ n([_,gen,N,3,G,plus]) :F^F .
[ni,ný,nu,nü] := 
	@ a phon("nI", "-ACC") --
  (~n_case)$ n([2,acc,_,3,_,plus])
   \ (# n_comp) $ n([_,_,_,3,_,_]) :F^F .

% N+acc => Nacc  with possessor
[ni,ný,nu,nü] := 
	@ a phon("nI", "-ACC") --
  (~n_case)$ n([2,acc,N,3,G,plus])
   \ (# n_relbase) $ n([_,_,N,3,G,plus]) : F^F .

% N+dat => Ndat 
[ye,ya] := 
	@ a phon("(y)A","-DAT") --
  (~n_case)$ n([3,dat,N,P,G,plus]) 
   \ (~ n_num) $ n([_,_,N,P,G,plus]) : F^F .

[e,a] := 
	@ a phon("(y)A","-DAT") --
  (~n_case)$ n([3,dat,N,P,G,plus]) 
   \ (~ n_poss) $ n([_,_,N,P,G,plus]) : F^F .

% N+dat => Ndat (dative marked lower N2)
[ye,ya] := 
	@ a phon("(y)A", "-DAT") --
  (~n_case)$ n([2,dat,N,P,G,plus]) 
   \ (~ n_num) $ n([_,_,N,P,G,plus]) : F^F .

[e,a] := 
	@ a phon("(y)A", "-DAT") --
  (~n_case)$ n([2,dat,N,P,G,plus]) 
   \ (~ n_poss) $ n([_,_,N,P,G,plus]) : F^F .

% N+dat => Ndat  with possessor 
[na,ne] := 
	@ a phon("nA", "-DAT") --
  (~n_case)$ n([2,dat,N,3,G,plus])
   \ (# n_poss) $ n([_,gen,N,3,G,plus]) : F^F .
[na,ne] := 
	@ a phon("nA", "-DAT") --
  (~n_case)$ n([2,dat,_,3,_,plus])
   \ (# n_comp) $ n([_,_,_,3,_,_]) : F^F .

% N+dat => Ndat  with possessor
[na,ne] := 
	@ a phon("nA", "-DAT") --
  (~n_case)$ n([3,dat,N,3,G,plus])
   \ (# n_poss) $ n([_,_,N,3,G,plus]) : F^F .
[na,ne] := 
	@ a phon("nA", "-DAT") --
  (~n_case)$ n([3,dat,_,3,_,plus])
   \ (# n_comp) $ n([_,_,_,3,_,_]) : F^F .


% N+dat => S|S\N  as adjunct
[ye,ya] := 
	@ a phon("(y)A", "-DAT") --
   (T) $ s([Te,N,P,V,_]) 
   / (T) $ s([Te,N,P,V,_]) 
   \ (~ n_num) $ n([_,_,_,3,_,_]) : X^F^to`F`X .

% N+dat => S|S\N  as adjunct
[e,a] := 
	@ a phon("(y)A", "-DAT") --
   (T) $ s([Te,N,P,V,_]) 
   / (T) $ s([Te,N,P,V,_]) 
   \ (~ n_poss) $ n([_,_,_,3,_,_]) : X^F^to`F`X  .


% N+dat => S|S\N  as adjunct
[ne,na] := 
	@ a phon("(y)A", "-DAT") --
   (T) $ s([Te,N,P,V,_]) 
   / (T) $ s([Te,N,P,V,_]) 
   \ (# n_poss) $ n([_,_,_,3,_,_])  : X^F^to`F`X .
[ne,na] := 
	@ a phon("(y)A", "-DAT") --
   (T) $ s([Te,N,P,V,_]) 
   / (T) $ s([Te,N,P,V,_]) 
   \ (# n_comp) $ n([_,_,_,3,_,_])  : X^F^to`F`X .
[ne,na] := 
	@ a phon("(y)A", "-DAT") --
   (T) $ s([Te,N,P,V,_]) 
   / (T) $ s([Te,N,P,V,_]) 
   \ (# n_relbase) $ n([_,_,_,3,_,_])  : X^F^to`F`X .


% N+abl => Nabl as argument
[den,dan] := 
	@ a phon("dAn", "-ABL") --
  (~ n_case)$ n(4,abl,N,P,_,plus) \  (~ n_poss) $ n([_,_,N,P,_,_]) 
    : F^F  .

% N+abl => S|S\N  as adjunct
[den,dan] := 
	@ a phon("dAn", "-ABL") --
   (T) $ s([Te,N,P,V,_]) 
   / (T) $ s([Te,N,P,V,_]) 
   \ (~ n_poss) $ n([_,_,_,3,_,_]) : X^F^from`F`X .

% N+abl => Nabl as argument
[nden,ndan] := 
	@ a phon("ndAn", "-ABL") --
  (~n_case)$ n([4,abl,N,3,G,plus]) 
   \ (# n_poss) $ n([_,gen,N,3,G,_])  : F^F .

% N+abl => Nabl as argument
[nden,ndan] := 
	@ a phon("ndAn", "-ABL") --
  (~n_case)$ n([4,abl,N,3,G,plus]) 
   \ (# n_relbase) $ n([_,gen,N,3,G,_]) : F^F .

% N+abl => S|S\N  as adjunct
[nden,ndan] := 
	@ a phon("ndAn", "-ABL") --
   (T) $ s([Te,N,P,V,_]) 
   / (T) $ s([Te,N,P,V,_]) 
   \ (# n_poss) $ n([_,_,_,3,_,_]) : X^F^from`F`X .

[nden,ndan] := 
	@ a phon("ndAn", "-ABL") --
   (T) $ s([Te,N,P,V,_]) 
   / (T) $ s([Te,N,P,V,_]) 
   \ (# n_comp) $ n([_,_,_,3,_,_]) : X^F^from`F`X .


[nden,ndan] := 
	@ a phon("ndAn", "-ABL") --
   (T) $ s([Te,N,P,V,_]) 
   / (T) $ s([Te,N,P,V,_]) 
   \ (# n_relbase) $ n([_,_,_,3,_,_]) : X^F^from`F`X  .

% N+loc => Nloc as argument
[te,ta,de,da] := 
	@ a phon("DA", "-LOC") --
  (~n_case)$ n([6,loc,N,P,G,plus]) \ (~ n_poss) $ n([_,_,N,P,G,_]) :F^F .

% N+loc => S|S\N  as adjunct
[te,ta,de,da] := 
	@ a phon("DA", "-LOC") --
   (T) $ s([Te,N,P,V,_]) 
   / (T) $ s([Te,N,P,V,_]) 
   \ (~ n_poss) $ n([_,_,_,3,_,_]) : X^F^at`F`X .

% N+loc => Nloc as argument
[nde,nda] := 
	@ a phon("ndA", "-LOC") --
  (~n_case)$ n([6,loc,N,3,G,plus]) 
   \ (# n_poss) $ n([_,_,N,3,G,_]) :F^F .

% N+loc => Nloc as argument
[nde,nda] := 
	@ a phon("ndA", "-LOC") --
  (~n_case)$ n([6,loc,N,3,G,plus]) 
   \ (# n_relbase) $ n([_,_,N,3,G,_]) :F^F .

% N+loc => S|S\N  as adjunct
[nde,nda] := 
	@ a phon("ndA", "-LOC") --
   (T) $ s([Te,N,P,V,_]) 
   / (T) $ s([Te,N,P,V,_]) 
   \ (# n_poss) $ n([_,_,_,3,_,_]) :X^F^at`F`X .

[nde,nda] := 
	@ a phon("ndA", "-LOC") --
   (T) $ s([Te,N,P,V,_]) 
   / (T) $ s([Te,N,P,V,_]) 
   \ (# n_comp) $ n([_,_,_,3,_,_]) :X^F^at`F`X .

% N+loc => S|S\N  as adjunct
[nde,nda] := 
	@ a phon("ndA", "-LOC") --
   (T) $ s([Te,N,P,V,_]) 
   / (T) $ s([Te,N,P,V,_]) 
   \ (# n_relbase) $ n([_,_,_,3,_,_]) :X^F^at`F`X .


% N+com => Ncom as argument
[le,la,yle,yla] := 
	@ a phon("(y)lA", "-COM") --
  (~n_case)$ n([7,com,N,P,G,plus]) \ (~ n_poss) $ n([_,_,N,P,G,_]) :F^F .

% N+com => S|S\N  as adjunct
[le,la,yle,yla] := 
	@ a phon("(y)lA", "-INST") --
   (T) $ s([Te,N,P,V,_]) 
   / (T) $ s([Te,N,P,V,_]) 
   \ (~ n_poss) $ n([_,_,_,3,_,_]) :X^F^with`F`X .

% -ki relativizer for locative case (relative pronoun)

% also need value-raised variety for -ki 
[ki] := 
	@ a phon("ki", "-NREL") --
   (# n_relbase) $ n([_,_,N,P,G,R]) 
   \ (#n_case)$ n([6,loc,N,P,G,R]) : X^(pro^F)^and`(at`pro`X)`F .

% -ki relativizer for locative case (relative adj.): (N/N)\NPloc
[ki] := 
	@ a phon("ki", "-NREL") --
  (# n_relbase) $ n([_,_,N,P,G,R]) 
   / (~ n_num) $ n([_,_,_,_,_,_])
   \ (#n_case)$ n([6,loc,N,P,G,R]) : X^Y^(Y^F)^and`(at`Y`X)`F .

% -ki relativizer after genitive (relative pro) (look for TRed Ngen)
[ki] := 
	@ a phon("ki", "-NREL") --
   (# n_relbase) $ n([_,_,_,_,_,_]) 
   \( (~ n_poss) $ n([_,gen,_,3,_,plus]) 
     /( (# n_poss) $ n([_,gen,Num,Per,_,_]) 
         \ (# n_poss) $ n([5,gen,Num,Per,_,_]))) 
   : X^(pro^F)^and`(poss`pro`X)`F .


% subject relative participle : (N/N)\IVnom (but value-raise result N)
[en,an,yen,yan] := 
	@ a phon("(y)An", "-REL.SP") --
  @@tr1(A) 
  / (~free) $ n(A)
   \ @@iv2(~s_abil,nom) : (X^P)^X^(X^Q)^and`Q`P .
[en,an,yen,yan] := 
	@ a phon("(y)An", "-REL.SP") --
  @@tr2(A)
    / (~free) $ n(A)
   \ @@iv2(~s_abil,nom) : (X^P)^X^(X^Q)^and`Q`P .

% relative participle for subject-specifying genitive: (N/N)\(N\N)\IVnom
[en,an,yen,yan] := 
	@ a phon("(y)An", "-REL.SP") --
  @@tr1(A)
    / (~free) $ n(A)
   \ @@poss(_,3)\ @@iv2(~s_abil,nom) 
  : (X^P)^X^Y^(Y^Q)^and`(poss`X`Y)`Q`P .
[en,an,yen,yan] := 
	@ a phon("(y)An", "-REL.SP") --
  @@tr2(A)
    / (~free) $ n(A)
   \ @@poss(_,3)\ @@iv2(~s_abil,nom) 
  : (X^P)^X^Y^(Y^Q)^and`(poss`X`Y)`Q`P .


% object relative participle : (N/N)\IVacc,dat
[dýðý,diði,duðu,düðü,týðý,tiði,tuðu,tüðü] := 
	@ a phon("DIGI", "-REL.OP") --
  @@tr1(A)
    / (~free) $ n(A)
    \((~s_abil)$s([_,_,_,_,_])\ (~free)$np([_,_,_,_,_,_]))
   : (X^P)^X^(X^Q)^and`Q`P .
[dýðý,diði,duðu,düðü,týðý,tiði,tuðu,tüðü] := 
	@ a phon("DIGI", "-REL.OP") --
  @@tr2(A)
    / (~free) $ n(A)
    \((~s_abil)$s([_,_,_,_,_])\ (~free)$np([_,_,_,_,_,_]))
   : (X^P)^X^(X^Q)^and`Q`P .

[dýðýn,diðin,duðun,düðün,týðýn,tiðin,tuðun,tüðün] :=
	@ a phon("DIGIn","-REL.OP") --
  @@tr1(A)
    / (~free) $ n(A)
   \((~s_abil)$s([_,_,_,_,_])\ (~free)$np([_,_,_,_,_,_]))
   : (X^P)^X^(X^Q)^and`Q`P .

[dýðýn,diðin,duðun,düðün,týðýn,tiðin,tuðun,tüðün] :=
	@ a phon("DIGIn", "-REL.OP") --
  @@tr2(A)
    / (~free) $ n(A)
   \((~s_abil)$s([_,_,_,_,_])\ (~free)$np([_,_,_,_,_,_]))
   : (X^P)^X^(X^Q)^and`Q`P.

[dýðýnýz,diðiniz,duðunuz,düðünüz,
     týðýnýz,tiðiniz,tuðunuz,tüðünüz] :=
	@ a phon("DIGInIz", "-REL.OP") --
  @@tr1(A)
    / (~free) $ n(A)
    \ ((~s_abil)$s([_,_,_,_,_])\ (~free)$np([_,_,_,_,_,_]))
   : (X^P)^X^(X^Q)^and`Q`P .
[dýðýnýz,diðiniz,duðunuz,düðünüz,
     týðýnýz,tiðiniz,tuðunuz,tüðünüz] :=
	@ a phon("DIGInIz", "-REL.OP") --
  @@tr2(A)
    / (~free) $ n(A)
    \ ((~s_abil)$s([_,_,_,_,_])\ (~free)$np([_,_,_,_,_,_]))
   : (X^P)^X^(X^Q)^and`Q`P .

[dýðým,diðim,duðum,düðüm,
     týðým,tiðim,tuðum,tüðüm] :=
	@ a phon("DIGIm", "-REL.OP") --
  @@tr1(A)
    / (~free) $ n(A)
    \ ((~s_abil)$s([_,_,_,_,_])\ (~free)$np([_,_,_,_,_,_]))
   : (X^P)^X^(X^Q)^and`Q`P .
[dýðým,diðim,duðum,düðüm,
     týðým,tiðim,tuðum,tüðüm] :=
	@ a phon("DIGIm", "-REL.OP") --
  @@tr2(A)
    / (~free) $ n(A)
    \ ((~s_abil)$s([_,_,_,_,_])\ (~free)$np([_,_,_,_,_,_]))
   : (X^P)^X^(X^Q)^and`Q`P .

[dýðýmýz,diðimiz,duðumuz,düðümüz,
     týðýmýz,tiðimiz,tuðumuz,tüðümüz] :=
	@ a phon("DIGImIz", "-REL.OP") --
  @@tr1(A)
    / (~free) $ n(A)
    \ ((~s_abil)$s([_,_,_,_,_])\ (~free)$np([_,_,_,_,_,_]))
   : (X^P)^X^(X^Q)^and`Q`P .
[dýðýmýz,diðimiz,duðumuz,düðümüz,
     týðýmýz,tiðimiz,tuðumuz,tüðümüz] :=
	@ a phon("DIGImIz", "-REL.OP") --
  @@tr2(A)
    / (~free) $ n(A)
    \ ((~s_abil)$s([_,_,_,_,_])\ (~free)$np([_,_,_,_,_,_]))
   : (X^P)^X^(X^Q)^and`Q`P .

% adjunct relative participle (N/N)\S (but value-raise result N)
% duplicate LF for each adjunct NP (at, with, from)
[dýðý,diði,duðu,düðü,
     týðý,tiði,tuðu,tüðü] :=
	@ a phon("DIGI", "-REL.ADJ") --
  @@tr1(A)
    / (~free) $ n(A)
    \ (~s_abil)$s([_,_,_,_,minus]) 
   : P^X^(X^Q)^and`Q`(at`P`X) .
[dýðý,diði,duðu,düðü,
     týðý,tiði,tuðu,tüðü] :=
	@ a phon("DIGI", "-REL.ADJ") --
  @@tr2(A)
    / (~free) $ n(A)
    \ (~s_abil)$s([_,_,_,_,minus]) 
   : P^X^(X^Q)^and`Q`(at`P`X) .

[dýðýnýz,diðiniz,duðunuz,düðünüz,
     týðýnýz,tiðiniz,tuðunuz,tüðünüz] :=
	@ a phon("DIGInIz", "-REL.ADJ") --
  @@tr1(A)
    / (~free) $ n(A)
   \ (~s_abil)$s([_,_,_,_,minus]) : (X^P)^X^(X^Q)^and`Q`(at`P`X) .
[dýðýnýz,diðiniz,duðunuz,düðünüz,
     týðýnýz,tiðiniz,tuðunuz,tüðünüz] :=
	@ a phon("DIGInIz", "-REL.ADJ") --
  @@tr2(A)
    / (~free) $ n(A)
   \ (~s_abil)$s([_,_,_,_,minus]) : P^X^(X^Q)^and`Q`(at`P`X) .

[dýðýn,diðin,duðun,düðün,
     týðýn,tiðin,tuðun,tüðün] :=
	@ a phon("DIGIn", "-REL.ADJ") --
  @@tr1(A)
    / (~free) $ n(A)
    \ (~s_abil)$s([_,_,_,_,minus]) : P^X^(X^Q)^and`Q`(at`P`X) .
[dýðýn,diðin,duðun,düðün,
     týðýn,tiðin,tuðun,tüðün] :=
	@ a phon("DIGIn", "-REL.ADJ") --
  @@tr2(A)
    / (~free) $ n(A)
    \ (~s_abil)$s([_,_,_,_,minus]) : P^X^(X^Q)^and`Q`(at`P`X) .

[dýðýmýz,diðimiz,duðumuz,düðümüz,
     týðýmýz,tiðimiz,tuðumuz,tüðümüz] :=
	@ a phon("DIGImIz", "-REL.ADJ") --
  @@tr1(A)
    / (~free) $ n(A)
   \ (~s_abil)$s([_,_,_,_,minus]) : P^X^(X^Q)^and`Q`(at`P`X) .
[dýðýmýz,diðimiz,duðumuz,düðümüz,
     týðýmýz,tiðimiz,tuðumuz,tüðümüz] :=
	@ a phon("DIGImIz", "-REL.ADJ") --
  @@tr2(A)
    / (~free) $ n(A)
   \ (~s_abil)$s([_,_,_,_,minus]) : P^X^(X^Q)^and`Q`(at`P`X) .

[dýðým,diðim,duðum,düðüm,
     týðým,tiðim,tuðum,tüðüm] :=
	@ a phon("DIGIm", "-REL.ADJ") --
  @@tr1(A)
    / (~free) $ n(A)
   \ (~s_abil)$s([_,_,_,_,minus]) : P^X^(X^Q)^and`Q`(at`P`X) .
[dýðým,diðim,duðum,düðüm,
     týðým,tiðim,tuðum,tüðüm] :=
	@ a phon("DIGIm", "-REL.ADJ") --
  @@tr2(A)
    / (~free) $ n(A)
   \ (~s_abil)$s([_,_,_,_,minus]) : P^X^(X^Q)^and`Q`(at`P`X) .



% subordination infinitive (raising verbs): N_nonsubj\(S\NP1) 
[dýðý,diði,duðu,düðü,
     týðý,tiði,tuðu,tüðü] :=
	@ a phon("DIGI", "-SUB2I") --
	 (~ n_poss) $ n([2,_,_,_,_,_]) \
 ( (~ s_abil) $ s([_,_,_,_,_]) \ (~free) $ np([1,_,_,_,_,_])) : F^F .


% subordination:gerundive: N2\NP1,gen\IV
[dýðý,diði,duðu,düðü,
     týðý,tiði,tuðu,tüðü] :=
	@ a phon("DIGI", "-SUB2G") --
   (~ n_poss) $ n([2,_,_,3,_,_]) \ (~free)$ np([1,gen,sg,3,_,_])\
( (~ s_abil) $ s([_,_,_,_,_]) \ (~free) $ np([1,_,_,_,_,_])) : (X^F)^X^F .

% subordination:gerundive: N3\NP1,gen\IV
[dýðý,diði,duðu,düðü,
     týðý,tiði,tuðu,tüðü] :=
	@ a phon("DIGI", "-SUB2G") --
    (~ n_poss) $ n([3,_,_,3,_,_]) \ (~free)$ np([1,gen,sg,3,_,_])\
( (~ s_abil) $ s([_,_,_,_,_]) \ (~free) $ np([1,_,_,_,_,_])) : (X^F)^X^F .

% subordination:gerundive: N\NP1,gen\IV
[dýklarý,dikleri,duklarý,dükleri,
     týklarý,tikleri,tuklarý,tükleri] :=
	@ a phon("DIklArI", "-SUB2G") --
    (~ n_poss) $ n([_,_,_,3,_,_]) \ (~free)$ np([1,gen,pl,3,_,_])\
( (~ s_abil) $ s([_,_,_,_,_]) \ (~free) $ np([1,_,_,_,_,_])) : (X^F)^X^F .

% subordination:gerundive: N\NP1,gen\IV
[dýðýn,diðin,duðun,düðün,
     týðýn,tiðin,tuðun,tüðün] :=
	@ a phon("DIGIn", "-SUB2G") --
    (~ n_poss) $ n([_,_,_,3,_,_]) \ (~free)$ np([1,gen,sg,2,_,_])\
( (~ s_abil) $ s([_,_,_,_,_]) \ (~free) $ np([1,_,_,_,_,_])) : (X^F)^X^F .

% subordination:gerundive: N\NP1,gen\IV
[dýðýnýz,diðiniz,duðunuz,düðünüz,
     týðýnýz,tiðiniz,tuðunuz,tüðünüz] :=
	@ a phon("DIGInIz", "-SUB2G") --
    (~ n_poss) $ n([_,_,_,3,_,_]) \ (~free)$ np([1,gen,pl,2,_,_])\
( (~ s_abil) $ s([_,_,_,_,_]) \ (~free) $ np([1,_,_,_,_,_])) : (X^F)^X^F .

% subordination:gerundive: N\NP1,gen\IV
[dýðýmýz,diðimiz,duðumuz,düðümüz,
     týðýmýz,tiðimiz,tuðumuz,tüðümüz] :=
	@ a phon("DIGImIz", "-SUB2G") --
    (~ n_poss) $ n([_,_,_,3,_,_]) \ (~free)$ np([1,gen,pl,1,_,_])\
( (~ s_abil) $ s([_,_,_,_,_]) \ (~free) $ np([1,_,_,_,_,_])) : (X^F)^X^F .

% subordination:gerundive: N\NP1,gen\IV
[dýðým,diðim,duðum,düðüm,
     týðým,tiðim,tuðum,tüðüm] :=
	@ a phon("DIGIm", "-SUB2G") --
    (~ n_poss) $ n([_,_,_,3,_,_]) \ (~free)$ np([1,gen,sg,1,_,_])\
( (~ s_abil) $ s([_,_,_,_,_]) \ (~free) $ np([1,_,_,_,_,_])) : (X^F)^X^F .



% subordination infinitive (raising verbs): N\(S\NP1) 
[me,ma,mek,mak,mað,með] := 
	@ a phon("mA(K)", "-SUB1I") --
	(~ n_base) $ n([_,_,_,_,_,_]) \
  ( (~ s_abil) $ s([_,_,_,_,_]) \ (~free) $ np([1,_,_,_,_,_])) : F^F .


% subordination: -masi (gerundive): N\NP1,gen\IV
[mesi,masý] := 
	@ a phon("mAsI", "-SUB1G") --
   (~ n_poss) $ n([_,_,_,3,_,_]) \ (~free)$ np([1,gen,sg,3,_,_])\
        ( (~ s_abil) $ s([_,_,_,_,_]) \ (~free) $ np([1,_,_,_,_,_])) : F^F .

% subordination: -masi (gerundive): N\NP1,gen\IV
[meleri,malarý] := 
	@ a phon("mAlArI", "-SUB1G") --
   (~ n_poss) $ n([_,_,_,3,_,_]) \ (~free)$ np([1,gen,pl,3,_,_])\
        ( (~ s_abil) $ s([_,_,_,_,_]) \ (~free) $ np([1,_,_,_,_,_])) : F^F .

% subordination:gerundive -masi (gerundive): N\NP1,gen\IV
[men,man] := 
	@ a phon("mAn", "-SUB1G") --
   (~ n_poss) $ n([_,_,_,3,_,_]) \ (~free)$ np([1,gen,sg,2,_,_])\
        ( (~ s_abil) $ s([_,_,_,_,_]) \ (~free) $ np([1,_,_,_,_,_])) :F^F .

% subordination:gerundive -masi (gerundive): N\NP1,gen\IV
[meniz,manýz] := 
	@ a phon("mAnIz", "-SUB1G") --
   (~ n_poss) $ n([_,_,_,3,_,_]) \ (~free)$ np([1,gen,pl,2,_,_])\
        ( (~ s_abil) $ s([_,_,_,_,_]) \ (~free) $ np([1,_,_,_,_,_])) :F^F .

% subordination:gerundive -masi (gerundive): N\NP1,gen\IV
[mem,mam] := 
	@ a phon("mAm", "-SUB1G") --
   (~ n_poss) $ n([_,_,_,3,_,_]) \ (~free)$ np([1,gen,sg,1,_,_])\
        ( (~ s_abil) $ s([_,_,_,_,_]) \ (~free) $ np([1,_,_,_,_,_])) :F^F .

% subordination:gerundive -masi (gerundive): N\NP1,gen\IV
[memiz,mamýz] := 
	@ a phon("mAmIz", "-SUB1G") --
   (~ n_poss) $ n([_,_,_,3,_,_]) \ (~free)$ np([1,gen,pl,1,_,_])\
        ( (~ s_abil) $ s([_,_,_,_,_]) \ (~free) $ np([1,_,_,_,_,_])) : F^F .


% TENSE is a V operator
 
[du,di,dü,dý,tu,ti,tü,tý] := 
	@ a phon("DI", "-TENSE") --
  ( (~ s_tense) $ s([past,_,3,_,_]) \ (~free)$ np([I1,C1,C,D,G,P]))\
          ( (~ s_abil) $ s([_,_,3,_,_]) \ (~free)$ np([I1,C1,C,D,G,P])) 
   : F^F .


% Finite marker (person) is a V operator.
 
[m,üm,im,um,ým] := 
	@ a phon("(I)m", "-PERS.1s") --
     ( (~ s_person) $ s([_,_,1,_,_]) \
             (~ free) $ np([I,C,sg,1,G,plus]) )\
           ( (~ s_modal) $ s([_,_,_,_,_]) \
             (~ free) $ np([I,C,sg,1,G,plus]) ) : F^F .


%%
%%
%% lexical rules section (to be compiled by compile_lex/1)
%%
%%



lex_rules:- 
   lex_rule_osv,   
   lex_rule_o1so2v,
   lex_rule_adjectives,
   lex_rule_adjuncts.
   
   %lex_rule_sdroptv.

% create O[+ref]SV categories out of SOV 

lex_rule_osv:-
   lex((Morph := @ s phon Phon -- 
               (HCS) $ s(SI)
               \(HCNP1) $ np([1,nom,N1,P1,G1,R1])
               \(HCNP2) $ np([2,C2,N2,P2,G2,_]) : X^Y^F )),
   assertz(lex((Morph := @ s phon Phon --
               (HCS) $ s(SI)
               \(HCNP2) $ np([2,C2,N2,P2,G2,plus]) 
               \(HCNP1) $ np([1,nom,N1,P1,G1,R1]) : Y^X^F ))),
   fail.
lex_rule_osv.

% create XYZV categories out of SO2O1V  (for DVs)
% in OS sequences, O is +ref

lex_rule_o1so2v:-
lex((Morph := @ s phon Phon -- (HCS) $ s(SI)
               \(HCNP1) $ np([1,nom,N1,P1,G1,R1])
               \(HCNP1) $ np([3,C3,N3,P3,G3,R3])
               \(HCNP2) $ np([2,C2,N2,P2,G2,_]) 
            : X2^X3^X1^F )),
assertz(lex((Morph := @ s phon Phon --
               (HCS) $ s(SI)
               \(HCNP2) $ np([2,C2,N2,P2,G2,plus]) 
               \(HCNP1) $ np([1,nom,N1,P1,G1,R1])
               \(HCNP1) $ np([3,C3,N3,P3,G3,R3])
            : X3^X1^X2^F ))),
assertz(lex((Morph := @ s phon Phon --
	(HCS) $ s(SI)
               \(HCNP1) $ np([1,nom,N1,P1,G1,R1])
               \(HCNP2) $ np([2,C2,N2,P2,G2,_]) 
               \(HCNP1) $ np([3,C3,N3,P3,G3,R3])
            : X3^X2^X1^F ))),
assertz(lex((Morph := @ s phon Phon --
	(HCS) $ s(SI)
               \(HCNP1) $ np([3,C3,N3,P3,G3,R3])
               \(HCNP1) $ np([1,nom,N1,P1,G1,R1])
               \(HCNP2) $ np([2,C2,N2,P2,G2,_]) 
            : X2^X1^X3^F ))),
assertz(lex((Morph := @ s phon Phon --
	(HCS) $ s(SI)
               \(HCNP2) $ np([2,C2,N2,P2,G2,plus]) 
               \(HCNP1) $ np([3,C3,N3,P3,G3,R3])
               \(HCNP1) $ np([1,nom,N1,P1,G1,R1])
            : X1^X3^X2^F ))),
assertz(lex((Morph := @ s phon Phon --
	(HCS) $ s(SI)
               \(HCNP1) $ np([3,C3,N3,P3,G3,R3])
               \(HCNP2) $ np([2,C2,N2,P2,G2,plus]) 
               \(HCNP1) $ np([1,nom,N1,P1,G1,R1])
            : X1^X2^X3^F ))),

   fail.
lex_rule_o1so2v.

lex_rule_sdroptv:-
  lex((Morph := @ s phon Phon --
	(_) $ s(A)
               \(_) $ np([1,nom,_,_,_,_])
               \(HCNP2) $ np([2,C2,N2,P2,G2,R2]) : _^_^F`_`_ )),
  assertz(lex((Morph := @ s phon Phon --
	(#s_person) $ s(A)
               \(HCNP2) $ np([2,C2,N2,P2,G2,R2]) : Y^F`Y`pro ))),
  fail.
lex_rule_sdroptv.

% adj are ambiguous on nouns and syntactic/lexical compounds
lex_rule_adjectives:-
  lex((Morph := @ s phon Ph --
         (~ n_num) $ n([I,C,N,P,G,R])
         / (~ n_num) $ n([I,C,N,P,G,R]) : F )),
  assertz(lex((Morph := @ s phon Ph --
         (# n_comp) $ n([I,C,N,P,G,R])
         / (# n_comp) $ n([I,C,N,P,G,R]) : F ))),
  fail.
lex_rule_adjectives.

% S/S\N available in lex; generate others (for whatever N morphosyn type)
lex_rule_adjuncts:-
  lex((Morph := @ a phon Ph --
   (T) $ s([Te,N,P,V,_]) / (T) $ s([Te,N,P,V,_]) \ (NT) $ n([_,_,_,3,_,_])  
     : LF )),
  assertz(lex((Morph := @ a phon Ph --
   (T) $ s([Te,N,P,V,_]) \ (T) $ s([Te,N,P,V,_]) \ (NT) $ n([_,_,_,3,_,_])  
     : LF ))),
  assertz(lex((Morph := @ a phon Ph --
   (T) $ st([Te,N,P,V,_]) \ (T) $ st([Te,N,P,V,_]) \ (NT) $ n([_,_,_,3,_,_])  
     : LF ))),
  assertz(lex((Morph := @ a phon Ph --
   (T) $ st([Te,N,P,V,_]) / (T) $ st([Te,N,P,V,_]) \ (NT) $ n([_,_,_,3,_,_])  
     : LF ))),
  fail.
lex_rule_adjuncts.
