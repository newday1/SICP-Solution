#lang planet neil/sicp



(define (square-list items)
  (map (lambda (x) (* x x)) items)
  )
;;exercise2.22 是的会相反，因为链表往后生成的
(define (mymap proc items)
  (define (mymap-iter items result)
    (if (null? items)
        (reverse result)
        (mymap-iter (cdr items) (cons (proc (car items)) result))
        )
    )
  (mymap-iter  items nil)
  )

(define (mysquare-list items)
  (mymap (lambda (x) (* x x)) items)
  )

;;exercise2.22 不能交换，交换car就是一个列表，不是值了，无法进行proc操作
;;需要进行一次reverse

;;exercise2.23
;;(for-each (lambda (x) (newline) (display x)) (list 57 321 88))
(define (my-for-each proc items) 
   (let ((items-cdr (cdr items))) 
     (proc (car items)) 
     (if (not (null? items-cdr)) 
         (my-for-each proc items-cdr) 
         true))) 


(my-for-each (lambda (x) (newline) (display x)) (list 57 321 88))
