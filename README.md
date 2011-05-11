# Notes from _The Little Schemer_

## Chapter 1: Toys
This chapter introduces the style of the book and some preliminary questions and answers about scheme. Introduces the concepts of atoms, lists, S-expressions, car, cdr, cons, null? and eq?. Provides numerous examples of using car and cdr.

atoms and lists are s-expressions

Law of car (p5)
: defined only for non-empty lists. Returns s-expression (atom or list)

Law of cdr (p7)
: defined for non-empty lists. Returns list.

Law of cons (p9)
: Takes two arguments, second must be a list. Returns list.

Law of null? (p10)
: Defined only for lists. (Returns false for everything except empty list)

Law of eq? (p12)
: eq? takes two arguments, each must be non-numeric atom (not true actually)
