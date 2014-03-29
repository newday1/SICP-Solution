#lang planet neil/sicp

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

;;定义一个next函数代替#;;定义一个next函数代替(+ test-divisor 1)

(define (next n)
  (
   if (= n 2) 
      3
      (+ n 2)
  ))


(define (divides? a b)
  (= (remainder b a) 0))

(define (square n) (* n n))

(define (prime? n)
  (= n (smallest-divisor n)))


(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      -1
  ))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  elapsed-time
  )


(define (search-for-primes first count) 
   (define (search-iter cur count) 
     (if (> count 0) 
          (if (> (timed-prime-test cur) -1) 
         (search-iter (+ cur 2) (- count 1))
         (search-iter (+ cur 2) count))
         )) 
   (search-iter (if (even? first) (+ first 1) first) count)) 




