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

; It is incorrect as the first condition of show because show does not accept String arguments.

(define (show x)
  (cond
    [(number? (- HEIGHT CENTER) ...]
    [(<= -3 x -1) ...]
    [(>= x 0) ...]))

; Observation: When x belongs to the first sub-class of LRCD, it is said to be
; "resting." That is, the reference point of the rocket image (i.e., its center) is at
; HEIGHT minus CENTER (i.e. height of image divided by 2). The condition now reflects the
; subclass referred to as "resting" as accurately as possible.