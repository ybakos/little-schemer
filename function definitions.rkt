#lang racket

;;; I disagree with this common Scheme commenting style, one semi is enough.

;;; Is the argument an atom?
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

;;; Is the argument a list of atoms?
(define lat?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((atom? (car l)) (lat? (cdr l)))
      (else #f))))

;;; Does the atom a occur in list lat?
(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? (car lat) a)
                (member? a (cdr lat)))))))

;;; Remove member a from list lat
(define rember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) a) (cdr lat))
      (else (cons (car lat) (rember a (cdr lat)))))))

;;; Returns a list of all the first elements in a list of lists.
(define firsts
  (lambda (l)
    (cond
      ((null? l) '())
      (else (cons (car (car l)) (firsts (cdr l))))
    )
  )
)

;;; Inserts the atom new to the right of old, if old exists in lat.
(define insertR
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
        (cond
          ((eq? (car lat) old) (cons old (cons new (cdr lat))))
          (else (cons (car lat) (insertR new old (cdr lat))))
        )
      )
    )
  )
)

;;; Inserts the atom new to the left of old, if old exists in lat.
(define insertL
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
        (cond
          ((eq? (car lat) old) (cons new lat))
          (else (cons (car lat) (insertL new old (cdr lat))))
        )
      )
    )
  )
)

;;; Replaces the first occurrence of old in lat with new.
(define subst
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
        (cond
          ((eq? (car lat) old) (cons new (cdr lat)))
          (else (cons (car lat) (subst new old (cdr lat))))
        )
      )
    )
  )
)

;;; Replaces the first occurrence of o1 or o2 in lat with new.
(define subst2
  (lambda (new o1 o2 lat)
    (cond
      ((null? lat) '())
      (else
        (cond
          ((or (eq? (car lat) o1) (eq? (car lat) o2)) (cons new (cdr lat)))
          (else (cons (car lat) (subst2 new o1 o2 (cdr lat))))
        )
      )
    )
  )
)

;;; Remove all occurrences of a from list lat
(define multirember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) a) (multirember a (cdr lat)))
      (else (cons (car lat) (multirember a (cdr lat)))))))

;;; Inserts the atom new to the right of all occurences of old in list lat.
(define multiinsertR
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
        (cond
          ((eq? (car lat) old) (cons old (cons new (multiinsertR new old (cdr lat)))))
          (else (cons (car lat) (multiinsertR new old (cdr lat))))
        )
      )
    )
  )
)

;;; Inserts the atom new to the left of all occurences of old in list lat.
(define multiinsertL
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
        (cond
          ((eq? (car lat) old) (cons new (cons old (multiinsertL new old (cdr lat)))))
          (else (cons (car lat) (multiinsertL new old (cdr lat))))
        )
      )
    )
  )
)

;;; Replaces the all occurrence of old in lat with new.
(define multisubst
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
        (cond
          ((eq? (car lat) old) (cons new (multisubst new old (cdr lat))))
          (else (cons (car lat) (multisubst new old (cdr lat))))
        )
      )
    )
  )
)

;;; Returns the sum of all the atoms in a tuple.
(define addtup
  (lambda (tup)
    (cond
      ((null? tup) '0)
      (else (+ (car tup) (addtup (cdr tup))))
    )
  )
)

;;; Returns a list of the sum of each pair of atoms in two tuples.
(define tup+
  (lambda (tup1 tup2)
    (cond
      ((null? tup1) tup2)
      ((null? tup2) tup1)
      (else
        (cons (+ (car tup1) (car tup2)) (tup+ (cdr tup1) (cdr tup2)))
      )
    )
  )
)

;;; Returns the number of atoms in a list.
(define length
  (lambda (lat)
    (cond
      ((null? lat) 0)
      (else (add1 (length (cdr lat))))
    )
  )
)

;;; Returns the nth atom of a list.
(define pick
  (lambda (n lat)
    (cond
      ((zero? (sub1 n)) (car lat))
      (else (pick (sub1 n) (cdr lat)))
    )
  )
)

;;; Removes the nth atom from a list.
(define rempick
  (lambda (n lat)
    (cond
      ((zero? (sub1 n)) (cdr lat))
      (else (cons (car lat) (rempick (sub1 n) (cdr lat))))
    )
  )
)

;;; Returns the provided list sans numbers.
(define no-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((number? (car lat)) (no-nums (cdr lat)))
      (else (cons (car lat) (no-nums (cdr lat))))
    )
  )
)

;;; Returns only the numeric atoms in a list.
(define all-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((number? (car lat)) (cons (car lat) (all-nums (cdr lat))))
      (else (all-nums (cdr lat)))
    )
  )
)

;;; Returns true if both atoms are equal.
(define eqan?
  (lambda (a b)
    (cond
      ((and (number? a) (number? b)) (= a b) )
      ((or (number? a) (number? b)) #f)
      (else (eq? a b))
    )
  )
)

;;; Returns the number of occurences of a in lat.
(define occur
  (lambda (a lat)
    (cond
      ((null? lat) 0)
      ((eqan? a (car lat)) (add1 (occur a (cdr lat))) )
      (else (occur a (cdr lat)))
    )
  )
)