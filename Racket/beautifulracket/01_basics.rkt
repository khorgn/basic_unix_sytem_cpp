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
; a port is a generic interface for input/output to read/write incrementally
; a reader first reads from the port, then returns a module
; form of a module: (module <module-name> <which-expander>|<path to the expander file> <expression 1> <expression 2> ...)
(define (read-syntax path port)
  ; read all the lines (list of strings) from the port and bind them to src-lines
  (define src-lines (port->lines port))
  ; we then need to convert the code into a syntax object
  ; first we turn the expression into a datum (a literal which keep the structure of the S-expression

  ; === example === ;
  (define datum '(module lucy br 42))
  (list? datum) ; #t
  (length datum) ; 4

  ; we then transform the datum into a syntax object (a datum with additional information, like its context )
  (datum->syntax #f '(module lucy br 42))
  ; the last expression in a function is the return value of the function
  
  )
; all functions are private by default, we need to make the definition public
(provide read-syntax)
