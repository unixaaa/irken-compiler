
;; assumes the presence of a 'step' function, generated by parse/lexer.py,
;; that looks like this: 
;  (define (step ch state)
;;   (char->ascii (string-ref dfa[state] (char->ascii ch))))

(datatype token
  ;;  <kind> <value>
  (:t symbol string)
  )

(define eof-token (token:t 'eof "eof"))

(define (lex producer consumer)
  ;; producer gives us characters
  ;; consumer takes tokens

  (let ((action 'not-final)
	(state 0))

      (define (final? action)
	(not (eq? action 'not-final)))

      (let loop ((ch (producer))
		 (last 'not-final)
		 (current (list:nil)))
	(cond ((char=? ch #\eof)
	       ;; parser seems to require an extra NEWLINE in here...
	       (consumer (token:t 'NEWLINE "\n"))
	       (consumer (token:t '<$> "<$>")) #t)
	      (else
	       (set! state (step ch state))
	       (set! action finals[state])
	       (cond ((and (not (final? last)) (final? action))
		      ;; we've entered a new final state
		      (loop (producer) action (list:cons ch current)))
		     ((and (final? last) (not (final? action)))
		      ;; we've left a final state - longest match - emit token
		      (consumer (token:t last (list->string (reverse current))))
		      (set! state 0)
		      (loop ch 'not-final (list:nil)))
		     (else
		      ;; accumulate this character
		      (loop (producer) action (list:cons ch current)))))))
      ))

(define (make-lex-generator file)

  (define (producer)
    (file:read-char file))

  (make-generator
   (lambda (consumer)
     (lex producer consumer)
     (let forever ()
       (consumer eof-token)
       (forever))
     )))

