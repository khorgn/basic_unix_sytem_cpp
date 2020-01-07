#lang br/quicklang

; more than a string of source code as input, the parser takes an sequence of tokens
; a source string (given as input or through a port pointing to it) is converted into tokens with a function called a tokenizer
; if we don't use a tokenizer, every character in the source code is a token

; == Some tasks more easily handled by a tokenizer == ;
; Meaningless strings in a source code (comments) that can be removed
; strings that represent a type of value (eg. numbers) can be labeled with a generic token type (like NUMBER)
; strings handled literally (like "<" to represent an operation) can just pass through

#| Example for zip-code
the tokenizer can use a regex to match strings "0" to "9", and convert them into a token type DIGIT-TOKEN
zip-code : digit digit digit digit digit
digit : DIGIT-TOKEN
|#

; == Some downsides == ;
; Removed substrings are completely invisible to the parser
; tokens are atomic, once fused into a token, it can't be decomposed

#| Example for zip-code
the tokenizer can use a regex to match strings "00000" to "99999", and convert them into a token type FIVE-DIGIT-TOKEN
zip-code : FIVE-DIGIT-TOKEN
however, it would return '(zip-code "01234"), a lot less detailled
|#

; == bf tokenizer == ;
; every character outside of the eight used in the grammar are ignored, so they will be tossed out

; we write a reader with a tokenizer using our parser
(require "05_parser.rkt")
; we require brag/support to get access to lexer
(require brag/support)

(define (read-syntax path port)
  ; instead of manually reading strings of code from port, we pass the port to make-tokenizer, which reads characters from the port and generates tokens
  ; we then pass these tokens to parse from 05_parser.rkt to make the parse-tree from our grammar
  (define parse-tree (parse path (make-tokenizer port)))
  ; we create a module datum representing the code of a module
  (define module-datum `(module bf-mod "05_02_expander.rkt" ,parse-tree))
  (datum->syntax #f module-datum))
(provide read-syntax)

;; make-tokenizer returns a function next-token to retrieve the next token, instead of reading all tokens
(define (make-tokenizer port)
  (define (next-token)
    ; the tokenizer relies on a lexer for its tokenizing rules
    ; a lexer is a tree, each branch is a rule. On the left side of the branch is a pattern (like regex), on the right side a token-creating expression
    (define bf-lexer
      (lexer
       ; first branch, we let through
       ; char-set is a lexer helper function to match one of the characters given
       ; lexeme is a special lexer variable binding to the thing just matched
       [(char-set "><-.,+[]") lexeme]
       ; any-char is a lexer helper function to match any character
       ; since these characters should be ignored, we just call next-token
       [any-char (next-token)]
       ; the port emits a oef signal when it reaches the end of the file, it must be handled by the lexer. But we can also rely on lexer's default behavior:
       ; lexer will emit an oef token, which will stop the parser
       ))
    (bf-lexer port))
  next-token)
