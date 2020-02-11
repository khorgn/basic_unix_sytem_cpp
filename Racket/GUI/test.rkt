#lang racket/gui


; Make a frame by instantiating the frame% class
(define frame (new frame% [label "Example"]))
 
; Make a static text message in the frame
(define msg (new message% [parent frame]
                 [label "No events so far..."]))
 
; Make a button in the frame
(new button% [parent frame]
     [label "Click Me"]
     ; Callback procedure for a button click:
     [callback (lambda (button event)
                 (send msg set-label "Button click"))])

; Derive a new canvas (a drawing window) class to handle events
(define my-canvas%
  (class canvas% ; The base class is canvas%
    ; Define overriding method to handle mouse events
    (define/override (on-event event)
      (send msg set-label "Canvas mouse"))
    ; Define overriding method to handle keyboard events
    (define/override (on-char event)
      (send msg set-label "Canvas keyboard"))
    ; Call the superclass init, passing on all init args
    (super-new)))
 
; Make a canvas that handles events in the frame
(new my-canvas% [parent frame])

(new button% [parent frame]
     [label "Pause"]
     [callback (lambda (button event) (sleep 5))])

; Side-by-side buttons
(define panel (new horizontal-panel% [parent frame]))
(new button% [parent panel]
             [label "Left"]
             [callback (lambda (button event)
                         (send msg set-label "Left click"))])
(new button% [parent panel]
             [label "Right"]
             [callback (lambda (button event)
                         (send msg set-label "Right click"))])
 
; Show the frame by calling its show method
(send frame show #t)