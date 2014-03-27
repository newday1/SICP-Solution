#lang planet neil/sicp

(define (square n) (* n n))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n) (= (remainder n 2) 0))


(define (fast-expt-iter current n coefficient)
    (cond ((= n 0) current)
        ((even? n) (fast-expt-iter current (/ n 2) (square coefficient)))
        (else (fast-expt-iter (* current coefficient) (/ (- n 1) 2) (square coefficient))))
  )

(define (fast-expt2 b n)
  (fast-expt-iter 1 n b)
  )


