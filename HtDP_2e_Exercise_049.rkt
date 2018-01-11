;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_49) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 49. A cond expression is really just an expression
; and may therefore show up in the middle of another expression:

; (- 200 (cond [(> y 200) 0] [else y]))

; Use the stepper to evaluate the expression for y as 100 and 210

(define (result y)
  (- 200 (cond [(> y 200) 0] [else y])))

; (result 100)

; (result 210)

; Observation: This exercise was straightforward enough.

