(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insuficient funds"))
  (define (deposit amount)
    (if (> amount 0)
        (begin (set! balance (+ balance amount))
               balance)
        "Deposite must be a positive value"))
  (define (dispatch symbol msg)
    (if (equal? symbol password)
        (cond ((equal? msg 'withdraw) withdraw)
              ((equal? msg 'deposit) deposit)
              (else (error "Invalid message")))
        (error "Incorrect password")))
  dispatch)
