#lang planet neil/sicp

(define (make-interval a b) (cons a b))
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (lower-bound y))))
        (make-interval (min p1 p2 p3 p4)
                       (max p1 p2 p3 p4))
        ))
;;exercise2.7
(define (upper-bound z)
  (cdr z)
  )

(define (lower-bound z)
  (car z)
  )

;;exercise2.8
(define (neg-interval x)
  (make-interval (- (lower-bound x)) (- (upper-bound x)))
  )

(define (sub-interval x y)
  (add-interval x (neg-interval y))
  )

;;test
(define test1 (make-interval -2 5)
  )
(define test2 (make-interval 2 7))

;;exercise 2.10
(define (div-interval x y)
  (define (check x)
  (if (< (* (lower-bound x) (upper-bound x)) 0)
      (error "wrong none sense")
      ))
  (check x)
  (check y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound x))
                               (/ 1.0 (lower-bound y)))))

;;exercise2.11
;; A(1)=(-4,-2) A(2)=(-2,2) A(3)=(2,4)
;;三种排列组合有9种方法3*3*3

;;exercise 2.12
(define (make-center-percent c p)
  (let ((w (percent c p)))
    (make-interval (- c w) (+ c w)))
  )

(define (percent base p)
  (* base (/ p 100)))

;;exercise2.14
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one (add-interval (div-interval one r1)
                                    (div-interval one r2)))))
(define r1 (make-interval 9.5 9.6))
(define r2 (make-interval 9.5 19.6))
(define r3 (make-center-percent 10 0))
(define r4 (make-center-percent 10 0))
(define one (make-interval 1 1))