#lang planet neil/sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))
  ))

(define (make-rat n d)
  (define g (gcd n d))
  (define (make-rat-format x)
    (cond ((> (cdr x) 0) x)
           (else (make-rat (- (car x)) (- (cdr x)))))
     )
    (make-rat-format (cons (/ n g) (/ d g)))
  )

(define (print-rat x)
  (newline)
  (display (car x))
  (display "/")
  (display (cdr x))
  )



