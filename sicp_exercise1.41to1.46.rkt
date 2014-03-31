#lang planet neil/sicp


(define (double f) 
         (lambda (x) (f (f x)))) 
(define (inc x) (+ x 1))

(define (compose f g)
  (lambda (x) (f (g x))))


(define (square x) (* x x))

;;((compose square inc) 6)

(define (repeated f n)
  (if (= 1 n)
      (lambda (x) (f x))
      (compose f (repeated f (- n 1)))))

;;exercise 1.43
(define dx 0.000001)
(define (smooth f)
  (lambda (x) (/ (+ (f x) (f (+ x dx) (- x dx))) 3)))
;;两个方式区别
(define (smoothn f n)
  (repeated (smooth f) n))

(define (smoothn2 f n)
  ((repeated smooth n) f))
  