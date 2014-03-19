#lang planet neil/sicp

( / (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
    (* 3 (- 6 2) (- 2 7)))

(define (max2 a b) (if (> a b)
                       a
                       b))

(define (max3 a b c) (
                      if (> a b)
                         (+ a (max2 b c))
                         (+ b (max2 a c))
                      ))

(define (p) (p))
(define (test x y) 
                    (if (= x 0)
                        0
                        y)
                    )

(define (sqrt-iter guess x)
  (if (good-enough2? guess x )
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x )
  (average guess (/ x guess)))

(define (average x y )
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x) (sqrt-iter 1.0 x))

(define (square x) (* x x ))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (new-sqrt-iter (improve guess x)
                         x)))

(define (new-sqrt x) (new-sqrt-iter 1.0 x))

(define (try  b)
  (if (= 0 0) 1 b))

(define (tryif x)
  (if (= 0 0) 1 (/ 1 x)))

(define (new-if-exec a b) (new-if (= 0 0) a b))

(define (good-enough2? guess x)
  (< (abs (- guess (improve guess x))) 0.001)
  )




