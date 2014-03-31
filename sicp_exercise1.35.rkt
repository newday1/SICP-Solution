#lang planet neil/sicp

(#%provide (all-defined))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))
(define (try guess)
  (display guess)
  (newline)
  (let ((next (f guess)))
    (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (average a b) (/ (+ a b) 2))

;;阻尼方法会减少很多步骤
;;(fixed-point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2)) 2)
(fixed-point (lambda (x) (/ (log 1000) (log x))) 2)

(define (cube x) (* x x x))