#lang br/quicklang

(define (read-syntax path port)
  (define src-lines (port->lines port))
  ; format-datum takes a format string and a list of string
  ; the ~a marks the place where the argument string is substitued
  ; if we add a second quote to the format, it will produce datums that will be displayed in the repl
  (define src-datums (format-datums '(handle ~a) src-lines))
  ; a backtick is "quasiquote", we can also insert variables in the list
  ; to insert a value, use "unquote" ,<variable>
  ; to insert a list of values, use "unquote-splicing", ,@<variable>
  (define module-datum `(module stacker-mod "stacker.rkt" ,@src-datums))
  ; #f is the context argument
  (datum->syntax #f module-datum)
  )

(provide read-syntax)

; our expander needs three identifiers: handle, + and *
; numbers cannot be identifiers, so we don't need to take care of them
; it also needs a stack
; it finaly needs a macro called #%module-begin to get everything started

; we define stacker-module-begin
; macros takes syntax patterns as arguments
; it returns the value of the macro #%module-begin
(define-macro (stacker-module-begin HANDLE-EXPR ...)
  #'(#%module-begin
     HANDLE-EXPR ...))
(provide (rename-out [stacker-module-begin #%module-begin]))