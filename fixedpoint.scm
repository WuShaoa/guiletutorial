
(define (fixed-point func guess)
  (define (good-enough? g n)
    (< (abs (- g n)) 0.0000001))
  (define (try guess)
    (let ((next (func guess)))
      (if (good-enough? guess next)
         next
         (try next))))
  (try guess))

(define (fixed-point-of-transform g trans guess)
 (fixed-point (trans g) guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average x y)
  (/ (+ x y) 2))

(define (deriv f)
 (lambda (x) 
  (/ (- (f (+ x dx)) (f x)) dx)))

(define dx 0.00000001)

(define (newton-transform g)
 (lambda (x) 
  (- x (/ (g x) ((deriv g) x))))) 
