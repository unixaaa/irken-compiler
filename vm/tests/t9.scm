(let loop ((n 10)) ;; 1000000))
  (%print n)
  (if (%= 0 n)
      42
      (loop (%- n 1))))

