(define (make-accumulator initial-value)
  (let ((sum initial-value))
    (lambda (amount)
      (begin (set! sum (+ sum amount))
             sum))))

(define A (make-accumulator 5))
(A 10) ; 15
(A 10) ; 25
