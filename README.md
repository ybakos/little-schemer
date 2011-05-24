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
Introduces built-in functions `add1`, `sub1` and `zero?`. Prompts the reader to implement `+` and `-` recursively using just `add1`, `sub1` and `zero?`. Uses this to draw similarities between `null?` and `zero?`; and `cons` and `add1`. Introduces the concept of tuples through the imaginary `tup?` function. Prompts the reader to implement `addtup`. Walks the reader through a recursive `*` function. Prompts the reader to implement `tup+` for tuples of identical and differing lengths.



* The first commandment (first revision) (p64)

  When recurring on a list of atoms _lat_, ask two questions about it: `(null? lat)` and `else`. When recurring on a number, _n_, ask two questions about it: `(zero? n)` and `else`.

* The fourth commandment (first revision) (p65)

  Always change at least one argument while recurring. It must be changed to be closer to termination. The changing argumnet must be tested in the termination condition: when using `cdr`, test termination with `null?` and when using `sub1` test termination with `zero?`.

  * The fifth commandment

    When building a value with `+`, always use 0 for the value of the terminating line, for adding 0 does not change the value of an addition. When building a value with `*`, always use 1 for the value of the terminating line, for multiplying by 1 does not change the value of a multiplication. When building a value with `cons`, always consider () for the value of the terminating line.

