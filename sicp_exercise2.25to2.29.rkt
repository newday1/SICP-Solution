#lang planet neil/sicp
;;exercise2.25
(define l1 (list 1 3 (list 5 7) 9))
(define l2 '((7)))
(car (cdr (car (cdr (cdr l1)))))
(car (car l2))
;;(car (cdr (cdr (cdr (cdr (cdr (cdr l3)))))))
 (car 
  (cdr 
   (car 
    (cdr 
     (car 
      (cdr 
       (car 
        (cdr 
         (car 
          (cdr 
           (car 
            (cdr '(1 (2 (3 (4 (5 (6 7)))))))))))))))))) 

;;exercise2.26
;(1 2 3 4 5 6)
;((1 2 3) 4 5 6) cons和list有区别 (cons x (list a b c))=(list x a b c)他将头尾连接起来，但是如果是list中存list，一次cdr是
;取不到值的，因为上面已经写了嵌套list需要cdr car嵌套才能取到
;((1 2 3) (4 5 6))

;exercise2.27
(define x (list (list 1 2) (list 3 4)))


(define (deep-reverse items) 
   (define (iter items result) 
     (if (null? items) 
         result 
         (iter (cdr items) (cons  (atom-reverse (car items)) result))))
  (define (atom-reverse x) (if (pair? x)
                               (deep-reverse x)
                               x
                               ))
   (iter items nil)) 

;;exercise 2.28
(define (fringe tree) 
   (define nil '()) 
  
   (define (build-fringe x result) 
     (cond ((null? x) result) 
           ((not (pair? x)) (cons x result)) 
           (else (build-fringe (car x)  
                               (build-fringe (cdr x) result))))) 
  
   (build-fringe tree nil)) 

(fringe x) 
