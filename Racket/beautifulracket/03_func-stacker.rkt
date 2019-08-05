#lang br/quicklang

; ===== READER ===== ;
(define (read-syntax path port)
  (define src-lines (port->lines port))
  ; instead of wrapping each argument in its own datum, we convert them into datums with no wrapping, storing them in a list
  (define src-datums (format-datums '~a src-lines))
  ; splice the datums as arguments for handle-args
  (define module-datum `(module stacker-mod "03_func-stacker.rkt" (handle-args ,@src-datums)))
  (datum->syntax #f module-datum))

(provide read-syntax)

; ===== EXPANDER ===== ;

; HANDLE-ARGS-EXPR is a call to handle-args with the arguments, so module-begin only need to handle this one arg as input
(define-macro (funcstacker-module-begin HANDLE-ARGS-EXPR)
  #'(#%module-begin
     ; HANDLE-ARGS-EXPR will return a finished stack, so we can use it as input arg for display
     (display (first HANDLE-ARGS-EXPR))))
(provide (rename-out [funcstacker-module-begin #%module-begin]))

; . args designate args as the rest argument, it gathers all the rest of arguments in a list
(define (handle-args . args)
  ; iterates over a list of values, and each pass of the loop returns the accumulator
  ; the first arg is the name of the acc and its starting value
  (for/fold ([stack-acc empty])
            ; the second one is the name of the current element and the list to be folded
            ; in-list is a sequence constructor, a list could directly be used, but using the right type of sequence will make it more efficient for long lists
            ([arg (in-list args)]
             ; a guard expression, it skip to the next element if arg is <#void> (the datum of empty lines)
             #:unless (void? arg))
    ; the accumulation function
    (cond
      [(number? arg) (cons arg stack-acc)]
      [(or (equal? * arg) (equal? + arg))
       (define op-result
         (arg (first stack-acc) (second stack-acc)))
       ; create a new list with the result of the operation and without the first two elements of the acc
       (cons op-result (drop stack-acc 2))])))
(provide handle-args)

(provide + *)