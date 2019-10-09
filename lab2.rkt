#lang racket

(define mystery
  (lambda (L)
    (if (null? L)
        L
        (begin
          (displayln L)
          (append (mystery (cdr L))
                 (list (car L)))))))
;; Part 1)
;; 1) this function takes a list and recursively swaps the elements in reverse order and prints the list
;; 2) This function has no return value because its not returning anything. The return value was not specified so I assume it's a void function

;; Part 3
;; 1) displayln seems to be the racket form of println. Reading the documentation, begin seems to put the enclosed code into its own block.
;; Begin seems to be somewhat of an else statement. If you take it out, you get a bad syntax error.

;; Part 4 - 7)

(define gen-list
  (lambda (start end)
    (define L (list start))
    (if (<= start end)
        (append L (gen-list(+ start 1) end))
        (list)
    )
   )
)

(define sum
  (lambda (L)
    (if (null? L)
        0
        (+ (car L)(sum (cdr L)))
    )
  )
)

(define retrieve-first-n
  (lambda (n L)
    (displayln L)
    (if (> n (length L))
      null?
      (if (> n 0)
          (cons (car L) (retrieve-first-n (- n 1) (cdr L)))
          (list)
       )
    )
  )
)

(define pair-sum
  (lambda (L n)
    (if (even? n)
        #f
        (begin
          (if (< (length L) 2) 
          #f
          (if (= (+ (car L) (car(cdr L))) n)
              #t
              (pair-sum (cdr L) n)
          )
          )
        )
    )
  )
)
