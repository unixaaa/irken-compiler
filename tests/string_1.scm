(include "lib/string.scm")

(printn (make-string 30))
(printn (copy-string "howdy there pardner!" 11))
(let ((buffer (make-string 5)))
  (buffer-copy "testing, testing" 2 5 buffer 0)
  (printn buffer))
(printn (ascii->char 65))
(printn (char->ascii #\A))
(let ((irken "irken"))
  (printn (string-length irken))
  (printn (string-ref irken 3))
  (string-set! irken 3 #\E)
  (printn irken))
(printn (string-compare "zim" "zim"))
(printn (string-compare "zim" "aim"))
(printn (string-compare "aim" "zim"))
(printn (string-<? "aim" "zim"))
(printn (sys:argv 0))


(terpri)
