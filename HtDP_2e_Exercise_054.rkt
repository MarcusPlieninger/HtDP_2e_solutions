;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_054) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; (define (show x)
;  (cond
;    [(string? x) ...]
;    [(<= -3 x -1) ...]
;    [(>= x 0) ...]))

; Exercise 54. Why is (string=? "resting" x) incorrect as the first condition in show?
; Conversely, formulate a completely accurate condition, that is, a Boolean expression
; that evaluates to #true precisely when x belongs to the first sub-class of LRCD.

; It is incorrect as the first condition of show because the show function does not consume String arguments,
; only a world state which has been defined as a number.

(define (show x)
  (cond
    [(= x 0) ...]
    [(<= -3 x -1) ...]
    [(>= x 0) ...]))

; Observation: When x belongs to the first sub-class of LRCD, it is said to be
; "resting." In other words, the clock-tick event handler has not been called and the
; world state is always at 0 until the space bar as pressed.

; In addition, the third condition in show must be corrected to (> x 0) for the sake of clarity,
; but since this is not absolutely necessary, I left it as is.