#lang planet neil/sicp

(define (scale-tree tree factor)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (* tree factor))
        (else (cons (scale-tree (car tree) factor)
                    (scale-tree (cdr tree) factor))))
  )

(define tree1 (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(display "scale-tree1 result")
(newline)
(scale-tree tree1  10)

(define (scale-tree2 tree factor)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (scale-tree2 sub-tree factor)
             (* sub-tree factor)))
       tree)
  )

(display "scale-tree2 result")
(newline)
(scale-tree2 tree1 10)


;;exercise 2.30
(define (square-tree tree)
    (cond ((null? tree) nil)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree)))))
  )

(display "square-tree1 result")
(newline)
(square-tree tree1)

(define (square-tree2 tree)
  (map (lambda (tree)
         (if (pair? tree)
             (square-tree2 tree)
             (* tree tree)
          )        
        ) 
       tree)
  )

(display "square-tree2 result")
(newline)
(square-tree2 tree1)

;exercise 2.31
(define (tree-map process tree)
  (map (lambda (sub-tree) 
               (if (pair? sub-tree)
                   (tree-map process sub-tree)
                   (process sub-tree)))
       tree                         
  ))
(define (square x) (* x x))
(define (square-tree3 tree) (tree-map square tree))

(display "square-tree3 result")
(newline)
(square-tree3 tree1)

;exercise 2.32 核心在于生产组合的方法
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (element) (cons (car s) element
                                             )) rest)))))



