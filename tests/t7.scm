;; testing variants

(define (+ a b)
  (%%cexp (int int -> int) "%s+%s" a b))

(let ((x (:fnord 12))
      (y (:blort #f))
      (z (:shlum "howdy"))
      )
  ;; three args: (success-cont, failure-cont, sum)
  (%vcase/fnord
   (lambda (a) (+ a 3))
   (lambda (b)
     (%vcase/blort
      (lambda (c) (if c 99 34))
      (lambda (d) 19)
      b))
   z))
