#lang planet neil/sicp

(#%require "sicp_exercise1.35.rkt")

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x))
                 dx)))

(define dx 0.000001)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))


(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c) 
  (lambda (x) (+ (cube x) (* a x x) (* b x) c)))

