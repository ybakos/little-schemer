# Notes from _The Little Schemer_

## Chapter 1: Toys
This chapter introduces the style of the book and some preliminary questions and answers about scheme. Introduces the concepts of atoms, lists, S-expressions, `car`, `cdr`, `cons`, `null?` and `eq?`. Provides numerous examples of using `car` and `cdr`.

* Atoms and lists are s-expressions

* Law of car (p5)

  defined only for non-empty lists. Returns s-expression (atom or list)

* Law of cdr (p7)

  defined for non-empty lists. Returns list.

* Law of cons (p9)

  Takes two arguments, second must be a list. Returns list.

* Law of null? (p10)

  Defined only for lists. (Returns false for everything except empty list)

* Law of eq? (p12)

  `eq?` takes two arguments, each must be non-numeric atom (not true actually)


## Chapter 2: Do It, Do It Again, and Again, and Again...
This chapter introduces recursion through the exploration of `lat?` (list of atoms) and `member?` applications. It walks the reader through the descent of the recursive call chain and bubbling back up the answer to the original call.

* The first commandment (preliminary) (p23)

  Always ask `null?` as the first question in expressing any function.


## Chapter 3: Cons the Magnificent
Introduces list creation with cons, first via the `rember` function. Then proposes the `firsts` function and prompts the reader to attempt to write it.
There are lots of function implementation exercises at the end of this chapter for `subst`, `insertR`, `insertL` and `multi*` versions of each of those functions.

* The second commandment (p37)

  Use `cons` to build lists.

* The third commandment (p45)

  When building al list, describe the first typical element, and then `cons` it onto the natural recursion.

* The fourth commandment (preliminary) (p57)

  Always change at least one argument while recurring. It must be changed to be closer to termination. The changing argument must be tested in the termination condition: when using `cdr`, test termination with `null?`

## Chapter 4: Numbers Games
