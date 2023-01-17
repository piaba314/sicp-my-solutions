(define (monte-carlo trials experiment)
  (let iter ((trials-remaining trials) (trials-passed 0.0))
    (cond ((= trials-remaining 0) (/ trials-passed trials))
          ((experiment) (iter (- trials-remaining 1)
                              (+ trials-passed 1)))
          (else (iter (- trials-remaining 1)
                      trials-passed)))))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (* range (random 1.0)))))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (define (experiment)
    (let ((x (random-in-range x1 x2))
          (y (random-in-range y1 y2)))
      (P x y)))
  (* (monte-carlo trials experiment) (- x2 x1) (- y2 y1)))

(define (estimate-pi trials)
  (estimate-integral (lambda (x y) (<= (+ (* x x) (* y y)) 1)) -1 1 -1 1 trials))