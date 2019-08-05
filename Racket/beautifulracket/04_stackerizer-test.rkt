#lang s-exp "04_stackerizer.rkt"
; #lang s-exp invokes Racket's default reader (which read S-expressiosn)
; it also defines the expander, since we didn't give one yet
; in Racket lingo, a language that uses the standard reader is called a "module language"

(* 1 2 (+ 3 4 (* 5 6 (+ 7 8 (* 9 10)))))