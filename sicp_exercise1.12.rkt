#lang planet neil/sicp

(define (pascal-triangle row column)
  ( cond ((> column row) 0)
         ((< column 0) 0)
         ((and (= row 0) (= column 0)) 1)
         (else (+ (pascal-triangle (- row 1) (- column 1)) (pascal-triangle (- row 1) column )))
   )
  )

