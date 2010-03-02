;; value restriction

(define (+ a b)
  (%%cexp (int int -> int) "%s+%s" a b))

(let ((id (lambda (x) x)))
  (set! id (lambda (x) (+ 1 x)))
  ;; shouldn't be able to add one to #t
  (id #t)
  )
