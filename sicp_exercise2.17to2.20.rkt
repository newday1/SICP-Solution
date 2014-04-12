#lang planet neil/sicp

;;exercise 2.17

(define (last-pair x)
  (define (last-pair-iter x current)
    (if (null? x)
        current
        (last-pair-iter (cdr x) (car x)))
    )
  (last-pair-iter x nil)
  )

;;exercise 2.18
(define (reverse items) 
   (define (iter items result) 
     (if (null? items) 
         result 
         (iter (cdr items) (cons (car items) result)))) 
  
   (iter items nil)) 