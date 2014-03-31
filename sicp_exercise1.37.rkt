#lang planet neil/sicp


(define (cont-frac n d k)
  (if (> k 0) 
  (/ (n k) (+ (d k) (cont-frac n d (- k 1))))
  (/ (n k) (d k))))

;;迭代法，保存结果变量，第一个终结结果一定是Nk/Dk
(define (cont-frac2 n d k)
  (define (cont-frac-iter n d k result current)
  (cond ((= current k) (cont-frac-iter n d k (/ (n current) (d current)) (- current 1)))
        ((= 1 current) result)
        (else (cont-frac-iter n d k (/ (n current) (+ (d current) result)) (- current 1)))
  ))
  (cont-frac-iter n d k 0 k)
  )


