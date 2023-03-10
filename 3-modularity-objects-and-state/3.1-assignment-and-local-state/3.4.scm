(define (make-account balance password)
  (let ((consecutive-wrong-passwords 0))
    (define (withdraw amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insuficient funds"))
    (define (deposit amount)
      (if (> amount 0)
          (begin (set! balance (+ balance amount))
                 balance)
          "Deposit must be a positive value"))
    (define (call-the-cops)
      (display "calling the cops")
      (newline))
    (define (dispatch symbol msg)
      (if (equal? symbol password)
          (begin (set! consecutive-wrong-passwords 0)
                  (cond ((equal? msg 'withdraw) withdraw)
                        ((equal? msg 'deposit) deposit)
                        (else (lambda (...args) "Invalid message"))))
          (begin (set! consecutive-wrong-passwords (+ consecutive-wrong-passwords 1))
                 (when (>= consecutive-wrong-passwords 3)
                   (call-the-cops))
                 (lambda (...args) "Incorrect password"))))
    dispatch))
