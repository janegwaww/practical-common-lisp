;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname dsl) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
(define (find-attr loa sy)
  (local ((define attr (assq sy loa)))
    (if (cons? attr)
        (second attr)
        #false)))
(define (xexpr-attr xe)
  (local ((define optional-loa+content (rest xe)))
    (cond
      [(empty? optional-loa+content) '()]
      [else
       (local ((define loa-or-x
                 (first optional-loa+content)))
         (if (list-of-attributes? loa-or-x)
             loa-or-x
             '()))])))
(define (list-of-attributes? x)
  (cond
    [(empty? x) #true]
    [else
     (local ((define possible-attribute (first x)))
       (cons? possible-attribute))]))
(define (xexpr-content ex)
  (local ((define content (rest ex)))
    (cond
    [(empty? content) '()]
    [else (local
            ((define loa-or-x (first content)))
            (if (list-of-attributes? loa-or-x)
                (rest content)
                content))])))


; An FSM is a [List-of 1Transition]
; A 1Transition is a list of two items:
; - ()
; - (cons FSM-State (cons FSM-State (keyEvent '())))
; An FSM-State is a String that specifies a color
 
; data examples 
(define fsm-traffic
  '(("red" "green") ("green" "yellow") ("yellow" "red")))
 
; FSM FSM-State -> FSM-State 
; matches the keys pressed by a player with the given FSM 
(define (simulate state0 transitions)
  (big-bang state0 ; FSM-State
    [to-draw
      (lambda (current)
        (square 100 "solid" current))]
    [on-key
      (lambda (current key-event)
        ; there add cond statement
        (find transitions current))]))
 
; [X Y] [List-of [List X Y]] X -> Y
; finds the matching Y for the given X in alist
(check-expect (find fsm-traffic "red") "green")

(define (find alist x)
  (local ((define fm (assoc x alist)))
    (if (cons? fm) (second fm) (error "not found"))))

; Exercise 381
; An XMachine is a nested list of this shape:
;   (cons 'machine (cons (cons (cons initial (cons ,FSM-State '())) '()) [list-of X1T]))
; An X1T is a nested list of this shape:
;   (cons action (cons (cons state (cons ,FSM-State '())) (cons next (cons ,FSM-State '()))))

; Exercise 383
(define xm0
  '(machine ((initial "red"))
     (action ((state "red") (next "green")))
     (action ((state "green") (next "yellow")))
     (action ((state "yellow") (next "red")))))

; XMachine -> FSM-State 
; interprets the given configuration as a state machine 
(define (simulate-xmachine xm)
  (simulate (xm-state0 xm) (xm->transitions xm)))
 
; XMachine -> FSM-State 
; extracts and translates the transition table from xm0
 
(check-expect (xm-state0 xm0) "red")
 
(define (xm-state0 xm0)
  (find-attr (xexpr-attr xm0) 'initial))
 
; XMachine -> [List-of 1Transition]
; extracts the transition table from xm
 
(check-expect (xm->transitions xm0) fsm-traffic)
 
(define (xm->transitions xm)
  (local (; X1T -> 1Transition
          (define (xaction->action xa)
            (list (find-attr (xexpr-attr xa) 'state)
                  (find-attr (xexpr-attr xa) 'next))))
    (map xaction->action (xexpr-content xm))))


