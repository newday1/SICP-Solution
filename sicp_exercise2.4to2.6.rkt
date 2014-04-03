#lang planet neil/sicp

(define (cons2 x y)
  (lambda (m) (m x y)))

(define (car2 z)
  (z (lambda (p q) p)))

(define (cdr2 z)
  (z (lambda (p q) q)))

;;exercise2.5
(define (pow base n)
  (define (pow-iter result n)
    (if (= n 0)
        result
        (pow-iter (* base result) (- n 1))))
  (pow-iter 1 n)
  )
  
(define (get-base-n z base)
  (if (= (remainder z base) 0)
      (+ (get-base-n (/ z base) base) 1)
      0
      )
  )
(define (cons3 x y)
  (* (pow 2 x) (pow 3 y))
  )

(define (car3 z)
  (get-base-n z 2)
  )

(define (cdr3 z)
  (get-base-n z 3)
  )

;;exercise2.6
(define zero (lambda (f) (lambda (x) x)))
