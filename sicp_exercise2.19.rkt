#lang planet neil/sicp

;;exercise2.19
;;old version
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
                 (cc (- amount (first-denomination kinds-of-coins))
                  kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

;;cc2 new version
(define (cc2 amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else (+ (cc2 amount (except-first-denomination coin-values))
                 (cc2 (- amount (first-denomination2 coin-values))
                  coin-values)))))


(define (no-more? coin-values)
  (null? coin-values)
  )

(define (except-first-denomination coin-values)
  (cdr coin-values)
  )

(define (first-denomination2 coin-values)
  (car coin-values)
  )

;;exercise 2.20
(define (same-parity x . y )
  (define (mk-parity src numbers result)
    (cond ((null? numbers) result)
          ((and (odd? src) (odd? (car numbers))) 
                                                 (mk-parity src (cdr numbers) (cons (car numbers) result )))
          ((and (even? src) (even? (car numbers))) 
                                                   (mk-parity src (cdr numbers) (cons (car numbers) result )))
          (else (mk-parity src (cdr numbers) result)))
        )
  (mk-parity x y (list x))    
    )


 
        