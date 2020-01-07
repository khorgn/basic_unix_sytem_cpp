#lang br/quicklang

;;; a quick stub of an expander
;; like before we need to define a macro named "#%module-begin" but must not conflict with the one in br/quicklang
(define-macro (bf-module-begin PARSE-TREE)
  #'(#%module-begin
     ;; the only thing this expander is doing is make a symbol out of the expression
     'PARSE-TREE))

(provide (rename-out [bf-module-begin #%module-begin]))

;; the results can be seen in "05_02_reader-test.rkt"

;; the next step is to make a real expander