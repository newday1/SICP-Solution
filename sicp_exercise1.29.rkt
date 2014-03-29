#lang planet neil/sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum2 term a next b)
  (define (iter a result)
  (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter 0 0)
  )


(define (inc n)
  (+ n 1))

;;都是语法惹得祸,(cond ( <p1> <s1>)
;;                  ( <p2> <s2>)
;;                  (else <s3>))
;; cond需要加括号,找了好久
(define (integral f a b n)
  (define h (/ (- b a) n) )
  (define (yk index) (f (+ a (* index h))))
  (define (simpson-term index)
    (cond ((or (= 0 index) (= n index)) (yk index))
          ((odd? index) (* 4 (yk index)))
          (else (* 2 (yk index)))))
  
  (* (/ h 3) (sum2 simpson-term 0 inc n))
  )
  
  
(define (cube x) (* x x x))

  