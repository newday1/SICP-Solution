#lang planet neil/sicp

(define (sqrt3 x) (sqrt3-iter 1.0  x))

(define (sqrt3-iter guess x)
  (if (good-enough? guess x )
      guess
      (sqrt3-iter (improve guess x)
                 x)))




(define (good-enough? guess x)
  (< (abs (- guess (improve guess x))) 0.0001)
  )
  
(define (improve y x )
  (/ (+ (/ x (* y y)) 
        (* 2 y)) 
     3)
 
  )
  

