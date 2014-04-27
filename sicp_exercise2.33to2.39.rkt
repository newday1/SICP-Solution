#lang planet neil/sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))


(define list1 (list 1 2 3 4))
(define list2 (list 5 6 7 8))
(define (square x) (* x x))
;exercise 2.33 用accumulate构建map等价的函数
(define (map-acc p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (append-acc seq1 seq2)
  (accumulate cons seq2 seq1)
  )

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence)
  )

;exercise 2.34
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff (* x higher-terms))
               )
              0
              coefficient-sequence))

;exercise 2.35
(define (count-leaves t)
  (accumulate +  0 (map (lambda (x) (if (pair? x)
                                         (count-leaves x)
                                         1))
                                          t))
  )

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))


(define tree-x (list (list 1 2) (list 3 4)))

;exercise 2.36
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
             nil
             (cons (accumulate op init (get-first-seq seqs))
                   (accumulate-n op init (get-remain-seq seqs)))))

(define (get-first-seq seq)
  (cond ((null? seq) nil)
        ((not (pair? (car seq))) seq)
        ;((null? (car (car seq))) nil)
        (else (cons (car (car seq)) (get-first-seq (cdr seq))))))

(define (get-remain-seq seq)
  (cond ((null? seq) nil)
        ((not (pair? (car seq))) nil)
        (else (cons (cdr (car seq)) (get-remain-seq (cdr seq))))))

      
(define listt (list (list 1 2) (list 2 3) (list 3 4)))

;exercise 2.37
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product v x)) m )
  )

(define (transpose m)
  (accumulate-n cons nil m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)
          ) m )))
 

(define x1 (list 1 1 1 1))
(define x2 (list 1 2 3 4))
(define m1 (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define m2 (list (list 1 1 1) (list 1 1 1) (list 1 1 1) (list 1 1 1)))

