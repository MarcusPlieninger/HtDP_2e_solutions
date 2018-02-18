;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_048) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 48. Enter the definition of reward followed by (reward 18)
; into the definitions area of DrRacket and use the stepper to find out
; how DrRacket evaluates applications of the function.

(define (reward s)
  (cond
    [(<= 0 s 10) "bronze"]
    [(and (< 10 s) (<= s 20)) "silver"]
    [else "gold"]))

(reward 18)

; Observation: Each clause of the conditional expression is evaluated until true is returned.
; If a clause evaluates to false (e.g., "false"), that clause false away and the next one is
; evaluated.
