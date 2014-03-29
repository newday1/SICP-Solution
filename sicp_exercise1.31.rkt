#lang planet neil/sicp

(define (inc n)
  (+ n 1))


(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product2 term a next b)
  (define (iter a result)
  (if (>= a b)
      result
      (iter (next a) (* result (term a)))))
  (iter 0 1)
  )

(define (numbernext n base)
  (if (even? n)
      (+ base n)
      (+ base n 1))
  )

(define (factorial n)
  (/  (numbernext n 2) (numbernext (+ n 1) 1))
  )

(define (pifunc n)
  (product2 factorial 0 inc n)
  )