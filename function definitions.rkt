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

;;; Returns a list of the sum of each pair of atoms in two tuples
(define tup+
  (lambda (tup1 tup2)
    (cond
      ((and (null? tup1) (null? tup2)) '())
      (else
        (cons (+ (car tup1) (car tup2)) (tup+ (cdr tup1) (cdr tup2)))
      )
    )
  )
)