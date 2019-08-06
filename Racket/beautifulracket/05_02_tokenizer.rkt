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