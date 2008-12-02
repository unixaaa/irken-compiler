
(include "lib/pair.scm")
(include "lib/string.scm")

(let ((s1 (make-string 10))
      (s2 "howdy")
      (s3 "maybe")
      (c0 #\X)
      )
  (%printn s1)
  (%printn s2)
  (%printn c0)
  (%printn (string-length s1))
  (%printn (string-length s2))
  (%printn (string-ref s2 0))
  (string-set! s2 1 #\A)
  (%printn s2)
  (%printn "string-compare")
  (%printn (string-compare "A" "B"))
  (%printn (string-compare "sam" "sam2"))
  (%printn (string-compare "sam2" "sam"))
  (%printn (string-compare "hello" "dolly"))
  (%printn (string-compare "dolly" "hello"))
  (%printn (string-=? s2 s3))
  (%printn "string-=?")
  (%printn (string-=? "hello" "not"))
  (%printn (string-=? "yes" "yes"))
  (%printn (string-=? "maybe" "maybe not"))
  (%printn "string-<?")
  (%printn (string-<? "sam" "george"))
  (%printn (string-<? "george" "sam"))
  (%printn "done")
  )
