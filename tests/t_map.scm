;; -*- Mode: Irken -*-

(include "lib/core.scm")
(include "lib/pair.scm")

(printn (map (lambda (x) (+ 1 x)) '(0 1 2 3 4)))
(printn (map2 + '(1 2 3) '(4 5 6)))
