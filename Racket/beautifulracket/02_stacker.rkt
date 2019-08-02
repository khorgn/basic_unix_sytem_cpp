#lang br/quicklang

; ===== READER ===== ;
(define (read-syntax path port)
  (define src-lines (port->lines port))
  ; format-datum takes a format string and a list of string
  ; the ~a marks the place where the argument string is substitued
  ; if we add a second quote to the format, it will produce datums that will be displayed in the repl
  (define src-datums (format-datums '(handle ~a) src-lines))
  ; a backtick is "quasiquote", we can also insert variables in the list
  ; to insert a value, use "unquote" ,<variable>
  ; to insert a list of values, use "unquote-splicing", ,@<variable>
  (define module-datum `(module stacker-mod "02_stacker.rkt" ,@src-datums))
  ; #f is the context argument
  (datum->syntax #f module-datum)
  )

(provide read-syntax)

; ===== EXPANDER ===== ;

; our expander needs three identifiers: handle, + and *
; numbers cannot be identifiers, so we don't need to take care of them
; it also needs a stack
; it finaly needs a macro called #%module-begin to get everything started

; we define stacker-module-begin
; macros takes syntax patterns as arguments
; it returns the value of the macro #%module-begin
; our goal is to pass the input code to the next #%module-begin in the chain
(define-macro (stacker-module-begin HANDLE-EXPR ...)
  ; #' makes code into a syntax object, it also caputres the current lexical context (the list of available variables)
  #'(#%module-begin
     HANDLE-EXPR ...
     ; we add one expression to display the top of the stack
     (display (first stack))))
; we then make stacker-module-begin available outside this source file and rename it #%module-begin
(provide (rename-out [stacker-module-begin #%module-begin]))

; implementation of the stack
(define stack empty)

; by convention racket functions with ! change the value of a variable
(define (pop-stack!)
  (define arg (first stack))
  (set! stack (rest stack))
  arg)

(define (push-stack! arg)
  (set! stack (cons arg stack)))

; definition of handle
; we define arg as being an optional argument
(define (handle [arg #f])
  (cond
    [(number? arg) (push-stack! arg)]
    [(or (equal? + arg) (equal? * arg))
     (define op-result (arg (pop-stack!) (pop-stack!)))
     (push-stack! op-result)]))
(provide handle)
; we also need to provide bindings
(provide + *)