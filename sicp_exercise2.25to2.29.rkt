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

;;exercise 2.29

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch tree)
  (car tree)
  )

(define (right-branch tree)
  (car (cdr tree))
  )


(define (branch-length branch)
  (car branch)
  )

(define (branch-structure branch)
  (car (cdr branch))
  )

(define (total-weight tree)
  (cond ((and (pair? tree) (pair? (left-branch tree)) (pair? (right-branch tree)))
         (+ (total-weight (left-branch tree)) (total-weight (right-branch tree))))
        ((pair? tree) (total-weight (branch-structure tree)))
        (else tree)
        )
  )

(define (check-balance? tree)
  (cond ((and (pair? tree) (pair? (left-branch tree)) (pair? (right-branch tree)))
         (if (= (* (branch-length (left-branch tree)) (total-weight (left-branch tree))) (* (branch-length (right-branch tree)) (total-weight (right-branch tree))))
             (and (check-balance? (left-branch tree)) (check-balance? (right-branch tree)))
             #f)
             )
        ((pair? tree) (check-balance? (branch-structure tree)))
        (else #t)
        )     
    
  )
  
  
(define tree1 (make-mobile (make-branch 1 2) (make-branch 1 2)))
(define tree2 (make-mobile (make-branch 1 4) (make-branch 1 tree1)))

;;最后一问只要改修改获取值的方式，左节点不变，右节点变成单独的(cdr tree)就好了







