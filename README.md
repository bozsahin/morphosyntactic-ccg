# morphosyntactic-ccg
a demo system for CKY parsing of Combinatory Categorial Grammar with morphosyntactic categories,
including normal-form parsing.

This is the system used in the paper http://www.mitpressjournals.org/doi/abs/10.1162/089120102760173634#.WPnRCyGGPCI.

----------------------------------------------------------------
Morphosyntactic CCG 
version 0.4 
Cem Bozsahin, METU, 1996-2001
http://www.metu.edu.tr/~bozsahin

This system is COPYLEFTED. Any extension or change you make must 
  also remain in public domain (and free of charge).

  See http://www.gnu.org/licenses/licenses.html#WhatIsCopyleft 
    for Copyleft.
----------------------------------------------------------------

-----
files
-----

The package contains the following files:

README           - this file
msccg.pl         - morphosyntactic CCG 
turkish_specs.pl - Turkish specific type constraints, macros and lattice
english_specs.pl - English specific type constraints, macros and lattice
turkish.lex      - The morphemic Turkish lexicon (with lexical rules)
english.lex      - The morphemic English lexicon
<l>_lex.pl       - The morphic lexicons compiled out of <l>.lex lexicons. That's
                   the one that gets used by the parser to avoid list search
                   for allomorphy. These files can be re-generated (compile_lex)
testdata/*       - My tests for certain constructions
tr_US            - Turkish diacritics on a keyboard (see below)


-------
loading
-------

To start: load or consult msccg.pl, <l>_specs.pl and <l>_lex.pl in this order

--------------------
top-level predicates
--------------------

compile_lex(<abstract lexicon file name>,<output lexicon file name>) 

  compiles lexicon; recompile if you make any changes 
  (**note: do not have a lexicon loaded before compilation--assert might 
           give protection error depending on the prolog system)

On-line version can be started by calling go/0.

  go1/1 reads data from a file and writes to stdout.

  go2/2 reads data from a file and writes to a file.

-----------------
parser parameters
-----------------

nfcheck/0 sets Normal Form parsing (Eisner'96).

nonfcheck/0 resets it. 

pascheck/0 sets PAS equivalence check (beware!). 

nopascheck/0 resets it.

sacheck/0 sets the switch on for phonology check (surface attachment)

nosacheck/0 resets it. 

You can query these parameters with parser_stat/0

--------------------------------------------
Turkish characters on X Windows & linux/unix 
--------------------------------------------

To type in Turkish diacritics on iougsc, do the following
  - place tr_US in this package under your <X11 directory>/xkb
  - run: 
        setxkbmap -symbols "tr_US(pc105)"   
     or 
        setxkbmap -symbols "tr_US(pc102)"

  pc102 keyboard provides diacritics with RIGHT alt key: e.g alt-c is ç
  pc105 does the same with Windows key

----------------------
Comments & bug reports
----------------------

to bozsahin@metu.edu.tr
