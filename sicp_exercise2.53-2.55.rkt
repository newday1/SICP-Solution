#lang planet neil/sicp

(define (memq item x)
(cond ((null? x) false)
      ((eq? item (car x)) x)
      (else (memq item (cdr x)))))

(pair? (car '(a short list)))
(memq 'red '((red shoes) (blue socks)))
(memq 'red '(red shoes blue socks))

;exercise 2.54
(define (equal2? list1 list2)
  (cond ((and (pair? (car list1)) (pair? (car list2))) (and (equal2? (car list1) (car list2)) 
                                                           (equal2? (cdr list1) (cdr list2))))
      ((and (not (pair? list1)) (not (pair? list2))) (eq? (car list1) (car list2)))
      (else #f))
  )

(equal2? '(this is a list) '(this is a list))
(equal2? '(this is a list) '(this is a list))



