(include "lib/string.scm")
(include "lib/pair.scm")
(define (+ a b)
  (%+ a b))
(cons (ascii->char (+ 20 45)) '())
