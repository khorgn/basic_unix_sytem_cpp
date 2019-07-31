#lang br/quicklang
; Every language in Racket has two essential components
; The reader to convert the source code into S-expressions
; The expander to match theses S-expressions to real racket expressions
; The #lang racket pragma tells the compiler where is the reader, and the reader tells it where is the expander
; #lang reader "stacker.rkt" allows to locate manually the reader, good enough for now


; We need to convert this
; 4
; 8
; +
; 3
; *
; into a S-expression (ex:)
; (handle 4)
; (handle 8)
; (handle +)
; (handle 3)
; (handle *)
; NOTE: the meaning of the handle function will be defined in the expander, not the reader


; Readers define a function read-syntax, it takes a path to the source file and a port to read the data
(define (read-syntax path port)
  (define src-lines (port->lines port))
  (datum->syntax #f '(module lucy br
                      42)))
(provide read-syntax)