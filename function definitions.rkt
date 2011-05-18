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

