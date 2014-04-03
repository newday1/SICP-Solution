#lang planet neil/sicp

(define (abstract-make n d)
  (cons n d)
  )

(define (abstract-get-first x)
  (car x)
  )

(define (abstract-get-second x)
  (cdr x)
  )


(define (make-segment n d)
  (abstract-make n d)
  )

(define (start-segment x)
  (abstract-get-first x)
  )

(define (end-segment x)
  (abstract-get-second x)
  )

(define (make-point x y)
  (abstract-make x y)
  )

(define (x-point x)
  (abstract-get-first x)
  )

(define (y-point x)
  (abstract-get-second x)
  )


(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  )
  
  
(define (average-point x y)
  (make-point (/ (+ (x-point x) (x-point y)) 2) (/ (+ (y-point x) (y-point y)) 2))
  )

(define (midpoint-segment segment)
  (average-point (start-segment segment) (end-segment segment))
  )

(define x1 (make-point 0 0))
(define x2 (make-point 4 4))
(define sg1 (make-segment x1 x2))
;;(print-point (midpoint-segment sg1))----exercise2.2

;;exercise 2.3
(define (make-rectangle height weight)
  (abstract-make height weight)
  )

(define (get-height x)
  (abstract-get-first x))

(define (get-weight x)
  (abstract-get-second x))

(define (get-perimeter rectangle)
  (* 2 (+ (get-height rectangle) (get-weight rectangle)))
  )

(define (get-area rectangle)
  (* (get-height rectangle) (get-weight rectangle))
  )

(define one-rectangle (make-rectangle 4 5))

;;第二种方法使用exercise2.2算距离公式来
(define (square x) (* x x))

(define (length segment)
  (sqrt (+ (square (- (x-point (start-segment segment)) (x-point (end-segment segment)))) (square (- (y-point (start-segment segment)) (y-point (end-segment segment)))) ))
  )

;;make-rectangle依然可以复用传入两条边
  
(define (get-perimeter2 rectangle length)
  (* 2 (+ (length (get-height rectangle)) (length (get-weight rectangle))))
  )

(define (get-area2 rectangle length)
 (* (length (get-height rectangle)) (length (get-weight rectangle)))
  )

(define p1 (make-point 0 2))
(define p2 (make-point 0 0))
(define r1 (make-segment p1 p2))
(define p3 (make-point 4 0))
(define r2 (make-segment p3 p2))

(define rectangle1 (make-rectangle r1 r2))

;;如果要让第一种和第二种一样，只要实现对应的length方法就好，将length作为参数传入
(define (length2 x) x)

(define rectangle2 (make-rectangle 2 4))



  